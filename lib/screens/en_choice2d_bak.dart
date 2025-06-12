import 'package:affirmation_forest/utils/colors.dart';
import 'package:affirmation_forest/utils/route.dart';
import 'package:affirmation_forest/utils/strings_en.dart' as en;
import 'package:affirmation_forest/utils/strings_fi.dart' as fi;
import 'package:affirmation_forest/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Choice2dEn extends StatelessWidget {
	const Choice2dEn({super.key});

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
								'Headline',
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
										en.MyStrings.buttonChoice2d1,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30,),),
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
										en.MyStrings.buttonChoice2d2,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30,),),
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
										en.MyStrings.buttonChoice2d3,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30,),),
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
										en.MyStrings.buttonChoice2d4,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30,),),
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
											fontSize: 12,
											),
										en.MyStrings.buttonChoice2d5,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30,),),
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
											fontSize: 12,
											),
										en.MyStrings.buttonChoice2d6,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30,),),
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
