import 'package:flutter/material.dart';
import 'package:affirmation_forest/screens/home_screen.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

void main() {
	WidgetsFlutterBinding.ensureInitialized();
	InAppPurchase.instance.isAvailable();
	runApp( MyApp() );
}

class MyApp extends StatelessWidget {
	const MyApp({ Key? key }) : super(key: key);

@override
Widget build(BuildContext context) {
	return const MaterialApp(
		home: Home()
		);
	}
}
