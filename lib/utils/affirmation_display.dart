import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class AffirmationDisplay extends StatefulWidget {
  final String csvAssetPath;
  final String columnName;

  const AffirmationDisplay({
    required this.csvAssetPath,
    required this.columnName,
    Key? key,
  }) : super(key: key);

  @override
  AffirmationDisplayState createState() => AffirmationDisplayState();
}

class AffirmationDisplayState extends State<AffirmationDisplay> {
  String? randomValue; // Holds the single random value
  bool isLoading = false;

  /// Fetches a single random value from the specified column in the CSV file.
Future<void> loadRandomValue() async {
  setState(() => isLoading = true);

  try {
    // Load the CSV file and remove BOM if present
    final data = (await rootBundle.loadString(widget.csvAssetPath)).replaceAll('\uFEFF', '');
    print('CSV file content:\n$data');

    if (data.trim().isEmpty) {
      throw Exception('CSV file is empty.');
    }

    // Parse the CSV file
    final List<List<dynamic>> csvTable = const CsvToListConverter().convert(data);
    print('Parsed CSV table: $csvTable');

    if (csvTable.isEmpty || csvTable.length < 2) {
      throw Exception('CSV file does not contain enough data.');
    }

    // Get the header row to find the column index
    final List<dynamic> headerRow = csvTable.first.map((e) => e.toString().trim()).toList();
    print('Header row: $headerRow');

    final int columnIndex = headerRow.indexOf(widget.columnName.trim());
    print('Column index for "${widget.columnName}": $columnIndex');

    if (columnIndex == -1) {
      throw Exception('Column "${widget.columnName}" not found in CSV file.');
    }

    // Extract the values from the specified column
    final List<String> columnValues = csvTable
        .sublist(1) // Skip the header row
        .map((row) => row[columnIndex].toString())
        .toList();
    print('Column values: $columnValues');

    if (columnValues.isEmpty) {
      throw Exception('No values found in the column "${widget.columnName}".');
    }

    // Pick a random value
    columnValues.shuffle();
    setState(() => randomValue = columnValues.first);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.toString()}')),
    );
  } finally {
    setState(() => isLoading = false);
  }
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: loadRandomValue,
            child: const Text('Load Random Affirmation'),
          ),
          const SizedBox(height: 20),
          if (isLoading) const CircularProgressIndicator(),
          if (randomValue != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                randomValue!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
