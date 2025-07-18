import 'package:flutter/material.dart';
import 'package:affirmation_forest/screens/en_start_screen.dart';
import 'package:affirmation_forest/screens/fi_start_screen.dart';
import 'package:affirmation_forest/screens/fi_tips1.dart';
import 'package:affirmation_forest/screens/en_choice1.dart';
import 'package:affirmation_forest/screens/en_choice2a.dart';
import 'package:affirmation_forest/screens/en_choice2b.dart';
import 'package:affirmation_forest/screens/en_choice2c.dart';
import 'package:affirmation_forest/screens/en_choice2d.dart';
import 'package:affirmation_forest/screens/fi_choice1.dart';
import 'package:affirmation_forest/screens/fi_choice2a.dart';
import 'package:affirmation_forest/screens/fi_choice2b.dart';
import 'package:affirmation_forest/screens/fi_choice2c.dart';
import 'package:affirmation_forest/screens/fi_choice2d.dart';
import 'package:affirmation_forest/screens/affirmation_AA_En.dart';

Route englishOption() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const StartEn(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route finnishOption() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const StartFi(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route fiTips() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const Tips1Fi(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route enChoice1() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const Choice1En(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route fiChoice1() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const Choice1Fi(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route enChoice2a() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const Choice2aEn(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route enChoice2b() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const Choice2bEn(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route enChoice2c() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const Choice2cEn(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route enChoice2d() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const Choice2dEn(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route fiChoice2a() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const Choice2aFi(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route fiChoice2b() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const Choice2bFi(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route fiChoice2c() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const Choice2cFi(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route fiChoice2d() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const Choice2dFi(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(0.0, 1.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
Route affirmationAAEn() {
	return PageRouteBuilder(
		pageBuilder: (context, animation, secondaryAnimation) => const AffirmationAAEn(),
		transitionsBuilder: (context, animation, secondaryAnimation, child) {
			const begin = Offset(1.0, 0.0);
			const end = Offset.zero;
			const curve = Curves.ease;
		
			var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

			return SlideTransition(position: animation.drive(tween), child: child);
		},
	);
}
