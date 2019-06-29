import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  Page1State createState() => Page1State();
}
class Page1State extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Text("I am PAGE 1.")
    );
  }
}