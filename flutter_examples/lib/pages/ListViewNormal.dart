import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewNormal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Todo'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Title')),
          ListTile(title: Text('Title')),
          ListTile(title: Text('Title')),
          ListTile(title: Text('Title')),
          ListTile(title: Text('Title')),
        ],
      ),
    );
  }
}
