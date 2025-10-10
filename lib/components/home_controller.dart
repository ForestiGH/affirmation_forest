import 'package:flutter/material.dart';
import 'package:affirmation_forest/utils/route.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class SwapCard extends StatefulWidget {
final CardController? cardController;
@override
_SwapCardState createState() => _SwapCardState();
}

class HomeController extends GetxController {
  CardController? cardController;
  final ZoomDrawerController drawerController = ZoomDrawerController();
final bool resetSwiper=false;
}

void resetCardController() {
cardController = CardController();
update();
}
