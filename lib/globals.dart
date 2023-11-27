library my_prj.globals;

import 'package:flutter/material.dart';

ValueNotifier<bool> notify = ValueNotifier(true);

List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
int filledBoxes = 0;
bool xTurn = true;
