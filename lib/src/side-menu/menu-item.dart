import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef void MenuItem_OnTapCallback(String screenId);

class MenuItem extends StatelessWidget {
  MenuItem({Key key, this.screenId, this.onTapCallback}) : super(key: key);

  String screenId;
  final MenuItem_OnTapCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text("Inbox"),
            trailing: Chip(
                label: Text("8", style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.blue[100]),
            enabled: true,
            onTap: () {
              print("Clicked");
              onTapCallback(screenId);
            }
        )
    );
  }
}
