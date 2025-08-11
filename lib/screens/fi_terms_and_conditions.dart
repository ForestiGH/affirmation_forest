import 'package:affirmation_forest/utils/colors.dart';
import 'package:affirmation_forest/utils/route.dart';
import 'package:affirmation_forest/utils/strings_en.dart' as en;
import 'package:affirmation_forest/utils/strings_fi.dart' as fi;
import 'package:affirmation_forest/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FiTermsAndConditions extends StatelessWidget {
	const FiTermsAndConditions({super.key});

	@override
	Widget build(BuildContext context) {
		return Material(
		child: LayoutBuilder(
			builder: (context, constraints) {
				return SingleChildScrollView(
					child: ConstrainedBox(
						constraints: BoxConstraints(minHeight: constraints.maxHeight),
						child: Container(
							color: MyColor.bianca,
						child: Column(
							mainAxisSize: MainAxisSize.min,
							children: [
							AppBar(
								backgroundColor: MyColor.bianca,
								),
							Text(
								'Käyttöehdot',
								style: TextStyle(
									fontFamily: 'Merriweather',
									color: MyColor.crete,
									fontSize: 18,)
								),
								Padding(
									padding: const EdgeInsets.only(bottom: 8),
									),
								Text(
									'Subtitle',
									style: TextStyle(
										fontFamily: 'Poppins',
										color: MyColor.lisbonBrown,
										fontSize: 14,)
									),
								Padding(
									padding: const EdgeInsets.only(bottom: 8),
									),
								],
							)
						)
					)
				);
			}
		)
	);
}
}
