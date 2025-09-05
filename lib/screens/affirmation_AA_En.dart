import 'package:affirmation_forest/utils/colors.dart';
import 'package:affirmation_forest/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AffirmationAAEn extends StatefulWidget {
  @override
  _AffirmationAAEnState createState() => _AffirmationAAEnState();
}

class _AffirmationAAEnState extends State<AffirmationAAEn> {
  List<String> affirmations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadAffirmations();
  }

  Future<void> loadAffirmations() async {
    try {
      // Load JSON file
      final jsonString = await rootBundle.loadString('assets/sheets/affirmations.json');
      final parsedJson = jsonDecode(jsonString);

      // Extract affirmations for the category
      final categoryName = 'Balanced_and_fulfilling_everyday_life';
      if (parsedJson is Map<String, dynamic>) {
        final dynamic categoryData = parsedJson[categoryName];
        if (categoryData is List<dynamic>) {
          setState(() {
            affirmations = categoryData.map((e) => e.toString()).toList();
            isLoading = false;
          });
        } else {
          throw Exception('Invalid format for category "$categoryName"');
        }
      } else {
        throw Exception('JSON root should be a Map');
      }
    } catch (e) {
      debugPrint('Error loading affirmations: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.bianca,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : affirmations.isEmpty
              ? const Center(child: Text('No affirmations found'))
              : CardSwiper(
                  cardsCount: affirmations.length,
                  cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: MyColor.bianca,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: MyColor.lisbonBrown.withOpacity(0.2),
                            blurRadius: 8.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
								child: Column(
									mainAxisSize: MainAxisSize.min,
									children: [
								Image.asset(
									MyImages.wcFox,
									width: 150,
									height: 150,),
                       	Text(
                          affirmations[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
								  ),
                          ),
                        ],
								),
								),
                    );
                  },
                ),
	 	 );
	}
}
