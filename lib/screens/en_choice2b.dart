import 'package:affirmation_forest/utils/colors.dart';
//import 'package:affirmation_forest/utils/route.dart';
import 'package:affirmation_forest/utils/strings_en.dart' as en;
//import 'package:affirmation_forest/utils/strings_fi.dart' as fi;
import 'package:affirmation_forest/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Choice2bEn extends StatelessWidget {
	const Choice2bEn({super.key});

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
							Center(
								child: SizedBox(
									width: 350,
									child: Text(
								en.MyStrings.headlineB,
								style: TextStyle(
									fontFamily: 'Merriweather',
									color: MyColor.crete,
									fontSize: 18,)
									),
								),
							),
							Padding(
								padding: EdgeInsets.all(32),
								),

								ElevatedButton.icon(
									style: ElevatedButton.styleFrom(
										alignment: Alignment.centerLeft,
										fixedSize: Size(350, 60),
										backgroundColor: MyColor.chelseaCucumber,
										foregroundColor: MyColor.chromeWhite,
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									label: const Text(
										style: TextStyle(
											fontFamily: 'Poppins',
											),
										en.MyStrings.buttonChoice2b1,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30, color: MyColor.chromeWhite),),
									),
							Padding(
								padding: EdgeInsets.all(8),
								),
								ElevatedButton.icon(
									style: ElevatedButton.styleFrom(
										alignment: Alignment.centerLeft,
										fixedSize: Size(350, 60),
										backgroundColor: MyColor.chelseaCucumber,
										foregroundColor: MyColor.chromeWhite,
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									label: const Text(
										style: TextStyle(
											fontFamily: 'Poppins',
											),
										en.MyStrings.buttonChoice2b2,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30, color: MyColor.chromeWhite),),
									),
							Padding(
								padding: EdgeInsets.all(8),
								),
								ElevatedButton.icon(
									style: ElevatedButton.styleFrom(
										alignment: Alignment.centerLeft,
										fixedSize: Size(350, 60),
										backgroundColor: MyColor.chelseaCucumber,
										foregroundColor: MyColor.chromeWhite,
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									label: const Text(
										style: TextStyle(
											fontFamily: 'Poppins',
											),
										en.MyStrings.buttonChoice2b3,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30, color: MyColor.chromeWhite),),
									),
							Padding(
								padding: EdgeInsets.all(8),
								),
								ElevatedButton.icon(
									style: ElevatedButton.styleFrom(
										alignment: Alignment.centerLeft,
										fixedSize: Size(350, 60),
										backgroundColor: MyColor.chelseaCucumber,
										foregroundColor: MyColor.chromeWhite,
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									label: const Text(
										style: TextStyle(
											fontFamily: 'Poppins',
											),
										en.MyStrings.buttonChoice2b4,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30, color: MyColor.chromeWhite),),
									),
							Padding(
								padding: EdgeInsets.all(8),
								),
								ElevatedButton.icon(
									style: ElevatedButton.styleFrom(
										alignment: Alignment.centerLeft,
										fixedSize: Size(350, 60),
										backgroundColor: MyColor.chelseaCucumber,
										foregroundColor: MyColor.chromeWhite,
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									label: const Text(
										style: TextStyle(
											fontFamily: 'Poppins',
											),
										en.MyStrings.buttonChoice2b5,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30, color: MyColor.chromeWhite),),
									),
							Padding(
								padding: EdgeInsets.all(8),
								),
								ElevatedButton.icon(
									style: ElevatedButton.styleFrom(
										alignment: Alignment.centerLeft,
										fixedSize: Size(350, 60),
										backgroundColor: MyColor.chelseaCucumber,
										foregroundColor: MyColor.chromeWhite,
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(2))),
										),
									label: const Text(
										style: TextStyle(
											fontFamily: 'Poppins',
											),
										en.MyStrings.buttonChoice2b6,),
									onPressed: () {},
									icon: Align(
										alignment: Alignment.centerLeft,
										child: SvgPicture.asset(MyImages.butterfly, width: 30, height: 30, color: MyColor.chromeWhite),),
									),
							Padding(
								padding: EdgeInsets.all(32),
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
