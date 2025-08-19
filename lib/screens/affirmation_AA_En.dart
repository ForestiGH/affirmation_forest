import 'package:affirmation_forest/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:affirmation_forest/utils/affirmation_display.dart';

class AffirmationAAEn extends StatelessWidget {
const AffirmationAAEn({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
	appBar: AppBar(
		backgroundColor: MyColor.bianca,
		),
	body: Padding(
		padding: const EdgeInsets.all(16.0),
		child: AffirmationDisplay(
			categoryName: 'Balanced_and_fulfilling_everyday_life',
			jsonAssetPath: 'assets/sheets/affirmations.json',
		),
	),
);
}
}
