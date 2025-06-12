import 'package:flutter/material.dart';
import 'package:affirmation_forest/utils/colors.dart';

@override
Widget build (BuildContext context) {
return MaterialApp(
	theme: ThemeData(
		colorScheme: ColorScheme.fromSeed(
			seedColor: MyColor.green,
			brightness: Brightness.light,
			),
		textTheme: TextTheme(
			displayLarge: const TextStyle(
				fontSize: 72,
				fontWeight: FontWeight.bold,
				fontFamily: 'Merriweather',
				),
			titleLarge: TextStyle(
				fontSize: 30,
				fontStyle: FontStyle.italic,
				fontFamily: 'Poppins',
				),
			bodyMedium: TextStyle(
				fontSize: 18,
				fontFamily: 'Poppins',
				),
			displaySmall: TextStyle(
				fontSize: 10,
				fontFamily: 'Poppins',
				),
			),
		),
	);
}		
