import 'app_localizations.dart';

extension Translate on String {
	String tl(context) {
		return AppLocalizations.of(context)!.translate(this);
	}
}
