import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  Page2State createState() => Page2State();
}
class Page2State extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Text("I am PAGE 2.")
    );
  }
}
