import 'package:affirmation_forest/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class AffirmationAAEn extends StatefulWidget {
  const AffirmationAAEn({super.key});

  @override
  State<AffirmationAAEn> createState() => _AffirmationAAEnState();
}

class _AffirmationAAEnState extends State<AffirmationAAEn> {
  List<String> affirmations = []; // List to store affirmations

  @override
  void initState() {
    super.initState();
    loadAffirmations();
  }

  Future<void> loadAffirmations() async {
    try {
      final loadedAffirmations = await readAffirmationAA();
      setState(() {
        affirmations = loadedAffirmations;
      });
    } catch (e) {
      print("Error loading affirmations: $e");
    }
  }

  Future<List<String>> readAffirmationAA() async {
    try {
      // Load the CSV file from assets
      final data = await rootBundle.loadString('assets/sheets/affirmations.csv');
      print("CSV file loaded successfully.");

      // Parse the CSV file
      final List<List<dynamic>> csvTable = const CsvToListConverter().convert(data);
      print("CSV Table: ${csvTable.take(5)}"); // Debug: Print the first 5 rows of the CSV

      // Ensure the file has enough rows and columns
      if (csvTable.length < 2) {
        print("CSV file does not have enough rows.");
        return [];
      }
      if (csvTable[0].length <= 24) {
        print("CSV file does not have enough columns.");
        return [];
      }

      // Extract affirmations from the 25th column (index 24)
      final List<String> result = csvTable
          .sublist(1) // Skip the header row
          .map((row) => row[24].toString()) // Convert the 25th column to a string
          .toList();

      print("Parsed Affirmations: $result"); // Debug: Print the parsed affirmations
      return result;
    } catch (e) {
      print("Error reading CSV: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.bianca,
        title: const Text("Affirmations"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                color: MyColor.bianca,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                    ),
                    Image.asset('assets/images/bearWColor.png'),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                    ),
                    Center(
                      child: Text(
                        affirmations.isNotEmpty
                            ? affirmations.last // Display the last affirmation
                            : "No affirmations loaded.",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // Display a random affirmation when the button is pressed
                          affirmations.shuffle();
                        });
                      },
                      child: const Text("Show Random Affirmation"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
