import 'package:flutter/material.dart';
import 'package:affirmation_forest/utils/colors.dart';

class CustomIconBtn extends StatelessWidget {
	final String text;
	final void Function() press;
	final double elevation;
	final Color bgColor;
	final Color shadowColor;
	final double width;
	final double height;
	final void margin;
	final Widget? icon;
	final bool isLoading;

	const CustomIconBtn({
		super.key,
		required this.text,
		required this.press,
		this.elevation = 0,
		this.bgColor = MyColor.lighterGreen,
		this.shadowColor = MyColor.darkGreen,
		this.width = 360,
		this.height = 48,
		this.margin = const EdgeInsets.all(10),
		this.icon,
		this.isLoading = false,
	});

	@override
	Widget build(BuildContext context) {
		return icon != null
			? ElevatedButton.icon(
				icon: isLoading ? const Padding(padding: EdgeInsets.only(left: 2)) : icon ?? const Padding(padding: EdgeInsets.only(left: 2)), 
				onPressed: () {
					if (isLoading == false) {
						press();
					}
				},
				style: ElevatedButton.styleFrom(
						backgroundColor: bgColor,
						elevation: elevation,
						surfaceTintColor: bgColor.withValues(alpha: 0.3),
						shadowColor: shadowColor,
						shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
						maximumSize: Size.fromHeight(height),
						minimumSize: Size(width, height),
						splashFactory: InkRipple.splashFactory,
						),
				label: isLoading
					? const SizedBox(
						height: 20,
						width: 20,
						child: CircularProgressIndicator(color: MyColor.white),
						)
					 : Text(
						 text,
						 style: TextStyle(
							 color: MyColor.darkerGreen,
							 fontFamily: 'Poppins',
							 ),
						 ),
					 )
	: ElevatedButton(
		onPressed: () {
			if (isLoading == false) {
				press();
			}
		},
		style: ElevatedButton.styleFrom(
					 backgroundColor: bgColor,
					 elevation: elevation,
					 splashFactory: InkRipple.splashFactory,
					 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
					 maximumSize: Size.fromHeight(height),
					 minimumSize: Size(width, height),
					 ),
		child: isLoading
			? const SizedBox(
				height: 20,
				width: 20,
				child: CircularProgressIndicator(color: MyColor.white),
				)
			: Text(
				text,
				style: TextStyle(
					color: MyColor.darkerGreen,
					fontFamily: 'Poppins',)
				)
			);
	}
}
