import 'package:affirmation_forest/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:affirmation_forest/utils/affirmation_display.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class AffirmationAAEn extends StatelessWidget {
	final List<Container> cards = [
	Container(
		alignment: Alignment.center,
		child: AffirmationDisplay(
			categoryName: 'Balanced_and_fulfilling_everyday_life',
			jsonAssetPath: 'assets/sheets/affirmations.json',
			),
		),
	Container(
		alignment: Alignment.center,
		child: AffirmationDisplay(
			categoryName: 'Balanced_and_fulfilling_everyday_life',
			jsonAssetPath: 'assets/sheets/affirmations.json',
			),
	),
	Container(
		alignment: Alignment.center,
		child: AffirmationDisplay(
			categoryName: 'Balanced_and_fulfilling_everyday_life',
			jsonAssetPath: 'assets/sheets/affirmations.json',
			),
	),
	];

@override
Widget build(BuildContext context) {
return Scaffold(
	appBar: AppBar(
		backgroundColor: MyColor.bianca,
		),
	body: Flexible(
		child: CardSwiper(
			cardsCount: cards.length,
			cardBuilder: (context, index, percentThresholdX, percentThresholdY) => cards[index],
			),
		),
	);
}
}
