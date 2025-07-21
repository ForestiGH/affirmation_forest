import 'package:affirmation_forest/utils/colors.dart';
import 'package:affirmation_forest/utils/route.dart';
import 'package:affirmation_forest/utils/strings_en.dart' as en;
import 'package:affirmation_forest/utils/strings_fi.dart' as fi;
import 'package:affirmation_forest/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tips2Fi extends StatelessWidget {
	const Tips2Fi({super.key});

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
							Image.asset(
								MyImages.wcDeer,
								width: 200,
								height: 200,),
							Padding(
								padding: const EdgeInsets.only(bottom: 16),
								),
							Text(
								fi.MyStrings.howToUse,
								style: TextStyle(
									fontWeight: FontWeight.bold,
									fontFamily: 'Merriweather',
									color: MyColor.crete,
									fontSize: 18,)
								),
								Padding(
									padding: const EdgeInsets.only(bottom: 16),
									),
							Text(
								fi.MyStrings.howToUse1,
								style: TextStyle(
									fontWeight: FontWeight.bold,
									fontFamily: 'Merriweather',
									color: MyColor.crete,
									fontSize: 18,)
								),
								Padding(
									padding: const EdgeInsets.only(bottom: 4),
									),

								SizedBox(
									width: 350,
									child: Text(
									textAlign: TextAlign.center,
										style: TextStyle(
											fontFamily: 'Poppins',
											color: MyColor.lisbonBrown,
											fontSize: 16,
											),
										fi.MyStrings.howToUse1a,),
									),
								Padding(
									padding: const EdgeInsets.only(bottom: 32),
									),
							Text(
								fi.MyStrings.howToUse2,
								style: TextStyle(
									fontWeight: FontWeight.bold,
									fontFamily: 'Merriweather',
									color: MyColor.crete,
									fontSize: 18,)
								),
								ElevatedButton.icon(
									style: ElevatedButton.styleFrom(
										fixedSize: Size(175, 20),
										backgroundColor: MyColor.chelseaCucumber,
										foregroundColor: MyColor.bianca,
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									label: const Text(
										style: TextStyle(
											fontFamily: 'Poppins',
											),
										'Seuraava',),
									onPressed: () {},
									),
								Padding(
									padding: EdgeInsets.all(16),
									child: SvgPicture.asset(
										MyImages.logoColor,
										width: 100,
										height: 100,
										),
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
