import 'package:affirmation_forest/utils/colors.dart';
import 'package:affirmation_forest/utils/route.dart';
import 'package:affirmation_forest/utils/strings_en.dart' as en;
import 'package:affirmation_forest/utils/strings_fi.dart' as fi;
import 'package:affirmation_forest/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartFi extends StatelessWidget {
	const StartFi({super.key});

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
								'Tervetuloa Affirmation Forestiin!',
								style: TextStyle(
									fontFamily: 'Merriweather',
									color: MyColor.crete,
									fontSize: 18,)
								),
								Padding(
									padding: const EdgeInsets.only(bottom: 16),
									),

								ElevatedButton.icon(
									style: ElevatedButton.styleFrom(
										fixedSize: Size(350, 20),
										backgroundColor: MyColor.chelseaCucumber,
										foregroundColor: MyColor.kelp,
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									label: const Text(
										style: TextStyle(
											fontFamily: 'Poppins',
											),
										'Aloita!',),
									onPressed: () {
									Navigator.of(context).push(fiChoice1());
									},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.paw, width: 30, height: 30,),),
									),
								Padding(
									padding: const EdgeInsets.only(bottom: 32),
									),
								ElevatedButton.icon(
									style: ElevatedButton.styleFrom(
										fixedSize: Size(350, 20),
										backgroundColor: MyColor.chelseaCucumber,
										foregroundColor: MyColor.kelp,
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									label: const Text(
										style: TextStyle(
											fontFamily: 'Poppins',
											),
										'Vinkkejä affirmaatioiden käyttöön',),
									onPressed: () {
									Navigator.of(context).push(fiTips());
									},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.plant, width: 30, height: 30,),),
									),
								ElevatedButton.icon(
									style: ElevatedButton.styleFrom(
										fixedSize: Size(350, 20),
										backgroundColor: MyColor.chelseaCucumber,
										foregroundColor: MyColor.kelp,
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									label: const Text(
										style: TextStyle(
											fontFamily: 'Poppins',
											),
										'Tilaus',),
									onPressed: () {
									Navigator.of(context).push(fiSubscription());
									},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.star, width: 30, height: 30,),),
									),
							Padding(
								padding: EdgeInsets.all(190),
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
