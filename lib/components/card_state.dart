import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> loadAffirmations(String categoryName) async {
  try {
    final jsonString = await rootBundle.loadString('assets/sheets/affirmations.json');
    final parsedJson = jsonDecode(jsonString);

    if (parsedJson is Map<String, dynamic>) {
      final dynamic categoryData = parsedJson[categoryName];
      if (categoryData is List<dynamic>) {
        final affirmations = categoryData.map((e) => e.toString()).toList();
        affirmations.shuffle();
        return affirmations;
      } else {
        throw Exception('Invalid format for category "$categoryName"');
      }
    } else {
      throw Exception('JSON root should be a Map');
    }
  } catch (e) {
    debugPrint('Error loading affirmations: $e');
    return [];
  }
}

List<String> generateCardImages(List<String> affirmations, List<String> wcImages) {
  final random = Random();
  return List.generate(
    affirmations.length,
    (_) => wcImages[random.nextInt(wcImages.length)],
  );
}

Future<void> saveCardsToPreferences(List<String> savedCards) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('savedCards', savedCards);
}

Future<List<String>> loadSavedCards() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('savedCards') ?? [];
}

void showSavedCardsDialog(BuildContext context, List<String> savedCards) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Saved Cards'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: savedCards.map((card) => Text(card)).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(savedCards);
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
