import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class AffirmationDisplay extends StatefulWidget {
  /// A utility method to fetch random values from a specific column in a CSV file.
  static Future<List<String>> getRandomValuesFromColumns(
    String csvAssetPath,
    String columnName,
    int count,
  ) async {
	  try {
    // Load the CSV file
    final data = await rootBundle.loadString(csvAssetPath);
	 print('CSV data loaded: $data');

    // Parse the CSV file
    final List<List<dynamic>> csvTable = const CsvToListConverter().convert(data);
	 print('CSV table parsed: $csvTable');

    // Get the header row to find the column index
    final List<dynamic> headerRow = csvTable.first;
	 print('Header row: $headerRow');

    final int columnIndex = headerRow.indexOf(columnName);
	 print('Column index: "$columnIndex');

    if (columnIndex == -1) {
      throw Exception('Column "$columnName" not found in CSV file.');
    }

    // Extract the values from the specified column
    final List<String> columnValues = csvTable
        .sublist(1) // Skip the header row
        .map((row) => row[columnIndex].toString())
        .toList();

	 print('Column values: $columnValues');

    // Shuffle the values and return the requested count
    columnValues.shuffle();
    return columnValues.take(count).toList();
  } catch (e) {
	 print('Error loading CSV data: $e');
	 throw Exception('Failed to load random values from CSV: $e');
  	}
  }

  final String csvAssetPath;
  final String columnName;

  const AffirmationDisplay({
    required this.csvAssetPath,
    required this.columnName,
    Key? key,
  }) : super(key: key);

  @override
  _AffirmationDisplayState createState() => _AffirmationDisplayState();
}

class _AffirmationDisplayState extends State<AffirmationDisplay> {
  List<String> randomValues = [];
  bool isLoading = false;

  /// Loads random values from the specified column in the CSV file.
  Future<void> loadRandomValues() async {
    setState(() => isLoading = true);

    try {
      final values = await AffirmationDisplay.getRandomValuesFromColumns(
        widget.csvAssetPath,
        widget.columnName,
        1, // Get 1 random value
      );

      setState(() => randomValues = values);
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: loadRandomValues,
          child: Text('Load Random Affirmation'),
        ),
        const SizedBox(height: 20),
        if (isLoading) const CircularProgressIndicator(),
        if (randomValues.isNotEmpty)
          Text(
            randomValues.first, // Display the first random value
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
