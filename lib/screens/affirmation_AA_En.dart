import 'package:affirmation_forest/components/card_state.dart';
import 'package:affirmation_forest/utils/colors.dart';
import 'package:affirmation_forest/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

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

  final CardSwiperController _cardSwiperController = CardSwiperController();

  @override
  void initState() {
    super.initState();
    loadSavedCards().then((loadedCards) {
      setState(() {
        savedCards = loadedCards;
      });
    });
    loadAffirmations('Balanced_and_fulfilling_everyday_life').then((loadedAffirmations) {
      setState(() {
        affirmations = loadedAffirmations;
        cardImages = generateCardImages(affirmations, wcImages);
        isLoading = false;
      });
    });
  }

  void onCardSwiped(int index, CardSwiperDirection direction) {
    if (direction == CardSwiperDirection.right) {
      savedCards.add(affirmations[index]);
    }

    if (savedCards.length == 3) {
      saveCardsToPreferences(savedCards);
      showSavedCardsDialog(context, savedCards);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.crete,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Positioned(
                  top: -8,
                  left: 0,
                  right: -8,
                  child: Image.asset(
                    MyImages.wave,
                    color: MyColor.crete,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                ),
                CardSwiper(
                  controller: _cardSwiperController,
                  cardsCount: affirmations.length,
                  cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 64.0),
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                          ),
                          Image.asset(
                            MyImages.arrows,
                            width: 200,
                            height: 20,
                            color: MyColor.crete,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          Image.asset(
                            cardImages[index],
                            width: 200,
                            height: 200,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(16),
                                width: double.infinity,
                                height: 200,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: MyColor.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Text(
                                  affirmations[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    color: MyColor.lisbonBrown,
                                  ),
                                ),
                              ),
                              LogoWithBG(),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  // onSwipe: onCardSwiped,
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                ),
              ],
            ),
    );
  }
}
