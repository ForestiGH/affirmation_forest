import 'package:affirmation_forest/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:affirmation_forest/utils/images.dart';
import 'package:affirmation_forest/utils/route.dart';
import 'package:affirmation_forest/utils/strings_en.dart' as en;
import 'package:affirmation_forest/utils/strings_fi.dart'as fi;

class Home extends StatelessWidget {
	const Home({super.key});

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
								Text(
									en.MyStrings.selectLang,
									style: TextStyle(
										fontFamily: "Merriweather",
										color: MyColor.crete,
										fontSize: 24,
										)
								),
								Padding(
									padding: const EdgeInsets.only(bottom: 8),
									),
								Text(
									fi.MyStrings.selectLang,
									style: TextStyle(
										fontFamily: "Merriweather",
										color: MyColor.crete,
										fontSize: 24,
										)
								),
								Padding(
									padding: EdgeInsets.all(48),
									),
								IconButton(
									style: IconButton.styleFrom(
										fixedSize: Size(150, 150),
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									onPressed: () {
										Navigator.of(context).push(englishOption());
									},
									icon: Image.asset(MyImages.english),
								),
								Padding(
									padding: const EdgeInsets.only(bottom: 8),
									),
								IconButton(
									style: IconButton.styleFrom(
										fixedSize: Size(150, 150),
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									onPressed: () {
										Navigator.of(context).push(finnishOption());
									},
									icon: Image.asset(MyImages.finnish),
									),
								Padding(
									padding: EdgeInsets.only(top: 128),
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
