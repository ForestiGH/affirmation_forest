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
  List<String> categoryAffirmations = [];

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
      final parsedJson = jsonDecode(jsonString);
      
      // 3. Extract affirmations for the category
      if (parsedJson is Map<String, dynamic>) {
        // Handle Map format where values can be String or List<String>
        final dynamic categoryData = parsedJson[widget.categoryName];
        
        if (categoryData == null) {
          throw Exception('Category "${widget.categoryName}" not found');
        }

        if (categoryData is String) {
          categoryAffirmations = [categoryData];
        } 
        else if (categoryData is List<dynamic>) {
          categoryAffirmations = categoryData.map((e) => e.toString()).toList();
        } 
        else {
          throw Exception('Invalid format for category "${widget.categoryName}"');
        }
      } 
      else {
        throw Exception('JSON root should be a Map');
      }

      // 4. Validate we got affirmations
      if (categoryAffirmations.isEmpty) {
        throw Exception('No affirmations found for "${widget.categoryName}"');
      }

      // 5. Select random affirmation
      categoryAffirmations.shuffle();
      setState(() => randomValue = categoryAffirmations.first);
      debugPrint('Selected random affirmation: $randomValue');

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
