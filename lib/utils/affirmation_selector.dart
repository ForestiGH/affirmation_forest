import 'dart:math';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

class AffirmationRandomSelector {
  static Future<List<String>> getRandomValuesFromColumn(
    String csvAssetPath, 
    String columnName,
    int count,
  ) async {
    // Load the CSV file from assets
    final rawData = await rootBundle.loadString('assets/sheets/affirmations.csv');
    
    // Parse the CSV data
    final List<List<dynamic>> rowsAsListOfValues = 
        const CsvToListConverter().convert(rawData);
    
    // Find the index of the target column
    final headerRow = rowsAsListOfValues.first;
    final columnIndex = headerRow.indexOf(columnName);
    
    if (columnIndex == -1) {
      throw Exception('Column $columnName not found in CSV');
    }
    
    // Extract all non-empty values from the column (excluding header)
    final columnValues = rowsAsListOfValues
        .sublist(1) // skip header
        .map((row) => row.length > columnIndex ? row[columnIndex].toString() : '')
        .where((value) => value.isNotEmpty)
        .toList();
    
    if (columnValues.isEmpty) {
      return [];
    }
    
    // Select random unique indices
    final random = Random();
    final selectedIndices = <int>{};
    
    while (selectedIndices.length < count && selectedIndices.length < columnValues.length) {
      selectedIndices.add(random.nextInt(columnValues.length));
    }
    
    // Return the corresponding values
    return selectedIndices.map((index) => columnValues[index]).toList();
  }
}
