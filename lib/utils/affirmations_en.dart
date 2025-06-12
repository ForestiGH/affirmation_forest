import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

Future<List<String>> getAffirmations(String specify) async {
	final data = await rootBundle.loadString('assets/sheets/affirmations.csv');
	final List<List<dynamic>> csvRows = const CsvToListConverter().convert(data);

	final affirmations = csvRows
	.skip(1)
	.where((row) => row[1].toString().trim() == specify.trim())
	.map((row) => row[2].toString())
	.toList();

return affirmations;
}
