import 'package:flutter/material.dart';

class AffirmationDisplay extends StatefulWidget {
	static Future<List<String>> getRandomValuesFromColumns(
	 String csvAssetPath,
	 String columnName,
	 int count,
  ) async {
	 await Future.delayed(Duration(seconds: 1));
	 
	 return List.generate(count, (index) => '$columnName Value ${index + 1}');
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

  Future<void> loadRandomValues() async {
    setState(() => isLoading = true);
    
    try {
      final values = await AffirmationDisplay.getRandomValuesFromColumns(
        widget.csvAssetPath,
        widget.columnName,
        3, // Get 3 random values
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
      children: [
        ElevatedButton(
          onPressed: loadRandomValues,
          child: Text('Load Random Values'),
        ),
        if (isLoading) CircularProgressIndicator(),
        if (randomValues.isNotEmpty)
          Column(
            children: randomValues
                .map((value) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(value),
                    ))
                .toList(),
          ),
      ],
    );
  }
}
