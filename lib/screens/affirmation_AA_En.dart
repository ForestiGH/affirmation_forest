import 'package:affirmation_forest/utils/colors.dart';
import 'package:affirmation_forest/utils/strings_en.dart' as en;
import 'package:affirmation_forest/utils/strings_fi.dart' as fi;
import 'package:affirmation_forest/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:affirmation_forest/utils/affirmation_selector.dart';
import 'package:affirmation_forest/utils/affirmations_en.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class AffirmationAAEn extends StatefulWidget {
  const AffirmationAAEn({super.key});

  @override
  State<AffirmationAAEn> createState() => _AffirmationAAEnState();
}

class _AffirmationAAEnState extends State<AffirmationAAEn> {
  final AffirmationRandomSelector selection = AffirmationRandomSelector();

  @override
  void initState() {
    super.initState();
    loadAffirmations();
  }

  Future<void> loadAffirmations() async {
    final affirmations = await readAffirmationAA();
    setState(() {
      selection.selected.addAll(affirmations);
    });
  }

  Future<List<String>> readAffirmationAA() async {
    final data = await rootBundle.loadString('assets/sheets/affirmations.csv');
    final List<List<dynamic>> csvTable = const CsvToListConverter().convert(data);
    final List<String> result = csvTable
        .sublist(1, 90)
        .map((row) => row[24].toString())
        .toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.bianca,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                color: MyColor.bianca,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                    ),
                    Image.asset('assets/images/bearWColor.png'),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                    ),
                    Center(
                      child: Text(
                        selection.selected.isNotEmpty
                            ? selection.selected.last
                            : "No selection yet",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
