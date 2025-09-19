import 'package:affirmation_forest/utils/colors.dart';
import 'package:affirmation_forest/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class AffirmationAAEn extends StatefulWidget {
  @override
  _AffirmationAAEnState createState() => _AffirmationAAEnState();
}

class _AffirmationAAEnState extends State<AffirmationAAEn> {
  List<String> affirmations = [];
  List<String> wcImages = [
    MyImages.wcBear,
    MyImages.wcBird,
    MyImages.wcButterfly,
    MyImages.wcDeer,
    MyImages.wcDeer2,
    MyImages.wcDragonfly,
    MyImages.wcDuck,
    MyImages.wcFox,
    MyImages.wcFox2,
    MyImages.wcFrog,
    MyImages.wcHedgehog,
    MyImages.wcLynx,
    MyImages.wcMoose,
    MyImages.wcMouse,
    MyImages.wcOtter,
    MyImages.wcOwl,
    MyImages.wcPheasant,
    MyImages.wcRabbit,
    MyImages.wcRabbit2,
    MyImages.wcBird2,
  ];
  List<String> cardImages = [];
  List<String> savedCards = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadSavedCards();
    loadAffirmations();
  }

  Future<void> loadAffirmations() async {
    try {
      final jsonString = await rootBundle.loadString('assets/sheets/affirmations.json');
      final parsedJson = jsonDecode(jsonString);

      final categoryName = 'Balanced_and_fulfilling_everyday_life';
      if (parsedJson is Map<String, dynamic>) {
        final dynamic categoryData = parsedJson[categoryName];
        if (categoryData is List<dynamic>) {
          setState(() {
            affirmations = categoryData.map((e) => e.toString()).toList();
            affirmations.shuffle();
            generateCardImages();
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

  void generateCardImages() {
    final random = Random();
    cardImages = List.generate(
      affirmations.length,
      (_) => wcImages[random.nextInt(wcImages.length)],
    );
  }
  

  Future<void> saveCardsToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('savedCards', savedCards);
  }

  Future<void> loadSavedCards() async {
    final prefs = await SharedPreferences.getInstance();
    final loadedCards = prefs.getStringList('savedCards') ?? [];
    setState(() {
      savedCards = loadedCards;
    });
  }

  void showSavedCardsDialog() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                              cardImages[index],
                              width: 150,
                              height: 150,
                            ),
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
						onSwipe: onCardSwiped,
                ),
    );
  }
void onCardSwiped(int index, CardSwiperDirection direction) {
    if (direction == CardSwiperDirection.right) {
      savedCards.add(affirmations[index]);
    }

    if (savedCards.length == 3) {
      saveCardsToPreferences();
      showSavedCardsDialog();
    }
  }
}
