import 'package:flutter/material.dart';
import 'package:affirmation_forest/utils/colors.dart';

class CustomIconBtn extends StatelessWidget {
	final String text;
	final Widget icon;
	final Color bgColor;

	const CustomIconBtn({
		super.key,
		required this.text,
		required this.icon,
		this.bgColor,
		)};

	@override
	Widget build(BuildContext context) {
		ElevatedButton.icon(
			style: style,
			onPressed: () {},
			)}
	}
