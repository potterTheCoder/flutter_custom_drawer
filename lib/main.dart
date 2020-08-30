import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/app_theme.dart';
import 'package:flutter_custom_drawer/home.dart';

main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: myTheme[AppTheme.values[0]],
    home: HomePage(),
  ));
}
