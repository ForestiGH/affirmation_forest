import 'package:affirmation_forest/utils/colors.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:affirmation_forest/utils/route.dart';
import 'package:affirmation_forest/utils/strings_en.dart' as en;
//import 'package:affirmation_forest/utils/strings_fi.dart' as fi;
import 'package:affirmation_forest/components/welcome_message_en.dart';
import 'package:affirmation_forest/utils/images.dart';

int randomIndex = Random().nextInt(welcomeMessages.length);

class Choice1En extends StatelessWidget {
	const Choice1En({super.key});

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
							children: <Widget>[
							AppBar(
								backgroundColor: MyColor.bianca,
								),
							Center(
							child: SizedBox(
								width: 350,
								child: Text(
							en.MyStrings.whatDoYouNeed,
							style: TextStyle(
								fontFamily: "Merriweather",
								color: MyColor.lisbonBrown,
								fontSize: 18,)
								),
							),
							),
							Padding(
								padding: EdgeInsets.all(48),
								),

							ElevatedButton.icon(
								style: ElevatedButton.styleFrom(
									alignment: Alignment.centerLeft,
									fixedSize: Size(350, 60),
									backgroundColor: MyColor.caper,
									foregroundColor: MyColor.kelp,
									shape: const RoundedRectangleBorder(
										borderRadius: BorderRadius.all(Radius.circular(2))),
								),
								label: const Text(
									style: TextStyle(
										fontFamily: 'Poppins',
										),
									en.MyStrings.buttonChoice1),
								onPressed: () {
									Navigator.of(context).push(enChoice2a());
								},
								icon: SvgPicture.asset(MyImages.tree4, width: 30, height: 30,)
								),
							Padding(
								padding: const EdgeInsets.only(bottom: 16),
								),
							ElevatedButton.icon(
								style: ElevatedButton.styleFrom(
									alignment: Alignment.centerLeft,
									fixedSize: Size(350, 60),
									backgroundColor: MyColor.caper,
									foregroundColor: MyColor.kelp,
									shape: const RoundedRectangleBorder(
										borderRadius: BorderRadius.all(Radius.circular(2))),
								),
								label: const Text(
									style: TextStyle(
										fontFamily: 'Poppins',
										),
									en.MyStrings.buttonChoice2),
								onPressed: () {
									Navigator.of(context).push(enChoice2b());
								},
								icon: Align(
									alignment: Alignment.centerLeft,
									child: SvgPicture.asset(MyImages.heart, width: 30, height: 30,)),
								),
							Padding(
								padding: const EdgeInsets.only(bottom: 16),
								),
							ElevatedButton.icon(
								style: ElevatedButton.styleFrom(
									alignment: Alignment.centerLeft,
									fixedSize: Size(350, 60),
									backgroundColor: MyColor.caper,
									foregroundColor: MyColor.kelp,
									shape: const RoundedRectangleBorder(
										borderRadius: BorderRadius.all(Radius.circular(2))),
								),
								label: const Text(
									style: TextStyle(
										fontFamily: 'Poppins',
										),
									en.MyStrings.buttonChoice3),
								onPressed: () {
									Navigator.of(context).push(enChoice2c());
								},
								icon: Align(
									alignment: Alignment.centerLeft,
									child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30,)),
								),
							Padding(
								padding: const EdgeInsets.only(bottom: 16),
								),
							ElevatedButton.icon(
								style: ElevatedButton.styleFrom(
									alignment: Alignment.centerLeft,
									fixedSize: Size(350, 60),
									backgroundColor: MyColor.caper,
									foregroundColor: MyColor.kelp,
									shape: const RoundedRectangleBorder(
										borderRadius: BorderRadius.all(Radius.circular(2))),
								),
								label: const Text(
									style: TextStyle(
										fontFamily: 'Poppins',
										),
									en.MyStrings.buttonChoice4),
								onPressed: () {
									Navigator.of(context).push(enChoice2d());
								},
								icon: Align(
									alignment: Alignment.centerLeft,
									child: SvgPicture.asset(MyImages.sun, width: 30, height: 30,)),
								),
							Padding(
								padding: EdgeInsets.all(80),
								),

							Padding(
								padding: EdgeInsets.all(16),
								child: SvgPicture.asset(
									MyImages.logoColor,
								width: 100,
								height: 100,
								),
								),
							]
						),
					)
					)
				);
			}
		)
	);
}
}
