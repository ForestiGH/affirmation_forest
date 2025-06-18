import 'dart:math';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

class AffirmationRandomSelector {
	List<String> selected = [];

   Future<List<String>> getRandomValuesFromColumn(
    String csvAssetPath,
    String columnName,
    int count,
  ) async {
    final rawData = await rootBundle.loadString('assets/sheets/affirmations.csv');
    final List<List<dynamic>> rowsAsListOfValues = 
        const CsvToListConverter().convert(rawData);
    
    final headerRow = rowsAsListOfValues.first;
    final columnIndex = headerRow.indexOf(columnName);
    
    if (columnIndex == -1) {
      throw Exception('Column $columnName not found in CSV');
    }
    
    final columnValues = rowsAsListOfValues
        .sublist(1)
        .map((row) => row.length > columnIndex ? row[columnIndex].toString() : '')
        .where((value) => value.isNotEmpty)
        .toList();
    
    if (columnValues.isEmpty) {
      return [];
    }
    
    final random = Random();
    final selectedIndices = <int>{};
    
    while (selectedIndices.length < count && selectedIndices.length < columnValues.length) {
      selectedIndices.add(random.nextInt(columnValues.length));
    }
    
    return selectedIndices.map((index) => columnValues[index]).toList();
  }
}
