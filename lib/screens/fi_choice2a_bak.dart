import 'package:affirmation_forest/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:affirmation_forest/utils/strings_fi.dart' as en;
import 'package:affirmation_forest/utils/strings_fi.dart' as fi;
//import 'package:affirmation_forest/utils/images.dart';

class Choice2aFi extends StatelessWidget {
	const Choice2aFi({super.key});

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
							children: <Widget>[
							AppBar(
								backgroundColor: MyColor.bianca,
								),
							Text(
							fi.MyStrings.whatDoYouNeed,
							textAlign: TextAlign.left,
							style: TextStyle(
								fontFamily: "Merriweather",
								color: MyColor.crete,
								fontSize: 16,)
							),
							Padding(
								padding: const EdgeInsets.only(bottom: 8),
								),
							Text(
							"Made your first choice!",
							textAlign: TextAlign.left,
							style: TextStyle(
								fontFamily: "Poppins",
								color: MyColor.lisbonBrown,
								fontSize: 14,)
							),
							Padding(
								padding: const EdgeInsets.only(bottom: 8),
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
									fi.MyStrings.buttonChoice2a1,
									),
								onPressed: () {},
								icon: Align(
									alignment: Alignment.centerLeft,
									child: SvgPicture.asset('assets/images/butterfly.svg', width: 30, height: 30,)),
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
									fi.MyStrings.buttonChoice2a2,
									),
								onPressed: () {},
								icon: Align(
									alignment: Alignment.centerLeft,
									child: SvgPicture.asset('assets/images/butterfly.svg', width: 30, height: 30,)),
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
									fi.MyStrings.buttonChoice2a3,
									),
								onPressed: () {},
								icon: Align(
									alignment: Alignment.centerLeft,
									child: SvgPicture.asset('assets/images/butterfly.svg', width: 30, height: 30,)),
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
									fi.MyStrings.buttonChoice2a4,
									),
								onPressed: () {},
								icon: Align(
									alignment: Alignment.centerLeft,
									child: SvgPicture.asset('assets/images/butterfly.svg', width: 30, height: 30,)),
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
									fi.MyStrings.buttonChoice2a5,
									),
								onPressed: () {},
								icon: Align(
									alignment: Alignment.centerLeft,
									child: SvgPicture.asset('assets/images/butterfly.svg', width: 30, height: 30,)),
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
									fi.MyStrings.buttonChoice2a6,
									),
								onPressed: () {},
								icon: Align(
									alignment: Alignment.centerLeft,
									child: SvgPicture.asset('assets/images/butterfly.svg', width: 30, height: 30,)),
								),
							Padding(
								padding: EdgeInsets.all(16),
								child: SvgPicture.asset(
								'assets/images/logoColor.svg',
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
