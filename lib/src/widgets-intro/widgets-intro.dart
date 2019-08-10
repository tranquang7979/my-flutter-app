// https://flutter.dev/docs/development/ui/widgets-intro
import 'package:flutter/material.dart';

import './my-app-bar.dart'; // create own app bar without using material
import './my-button.dart'; // demo gesture
//import './counter-state.dart'; // demo state class
import './counter-state-full-less.dart'; // demo state class

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: MyButton(),
            ),
          ),
          new Counter()
        ],
      ),
    );
  }
}