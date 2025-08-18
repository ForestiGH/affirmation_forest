import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AffirmationDisplay extends StatefulWidget {
  final String jsonAssetPath;
  final String categoryName;

  const AffirmationDisplay({
    required this.jsonAssetPath,
    required this.categoryName,
    Key? key,
  }) : super(key: key);

  @override
  AffirmationDisplayState createState() => AffirmationDisplayState();
}

class AffirmationDisplayState extends State<AffirmationDisplay> {
  String? randomValue;
  bool isLoading = false;

  Future<void> loadRandomValue() async {
    setState(() {
      isLoading = true;
      randomValue = null;
    });

    try {
      // 1. Load JSON file
      final jsonString = await rootBundle.loadString(widget.jsonAssetPath);
      debugPrint('JSON loaded (first 200 chars): ${jsonString.substring(0, jsonString.length > 200 ? 200 : jsonString.length)}');

      if (jsonString.trim().isEmpty) {
        throw Exception('JSON file is empty');
      }

      // 2. Parse JSON
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      debugPrint('Available categories: ${jsonData.keys.join(', ')}');

      // 3. Get affirmation for selected category
      final affirmation = jsonData[widget.categoryName] as String?;
      if (affirmation == null) {
        throw Exception('Category "${widget.categoryName}" not found. Available categories: ${jsonData.keys.join(', ')}');
      }

      if (affirmation.isEmpty) {
        throw Exception('Affirmation for "${widget.categoryName}" is empty');
      }

      setState(() => randomValue = affirmation);
      debugPrint('Selected affirmation: $randomValue');

    } catch (e, stackTrace) {
      debugPrint('Error loading JSON: $e\n$stackTrace');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          duration: const Duration(seconds: 4),
        ),
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
            child: const Text('Load Affirmation'),
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
