import 'package:flutter/material.dart';

import 'myapp.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(accentColor: Colors.grey[400]),
  ));
}
