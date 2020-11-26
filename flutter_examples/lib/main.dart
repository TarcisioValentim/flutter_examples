import 'package:flutter/material.dart';
import 'package:listViewBuilder/pages/ListViewNormal.dart';

import 'pages/ListViewBuilder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter listView Builder',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ListViewBuilder(),
    );
  }
}
