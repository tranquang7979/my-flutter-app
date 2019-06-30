//https://www.youtube.com/watch?v=kVi7taaaUVM
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MySideMenu extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Navigator',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  MyAppHomeState createState() => MyAppHomeState();
}

class MyAppHomeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SideMenu Demo'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text("tranquang7979@gmail.com"),
                accountName: Text("Steven Tran"),
                // currentAccountPicture: CircleAvatar(
                //   child: Text("S"),
                // ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://yt3.ggpht.com/-2m85vI_4G1Y/AAAAAAAAAAI/AAAAAAAAAHc/NvpWQ7iYx8A/s88-mo-c-c0xffffffff-rj-k-no/photo.jpg"),
                ),
                otherAccountsPictures: <Widget>[
                  GestureDetector(
                      onTap: () {
                        //print("Clicked");
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  actions: <Widget>[
                                    IconButton(
                                        icon: Icon(Icons.list),
                                        onPressed: () => Navigator.pop(context) ),
                                    IconButton(
                                        icon: Icon(Icons.arrow_forward),
                                        onPressed: () => Navigator.pop(context) ),
                                  ],
                                  content: Text("This is content"),
                                  title: Text("Adding new account..."));
                            });
                      },
                      child: CircleAvatar(child: Icon(Icons.add)))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.inbox), title: Text("Inbox"),
                  trailing: Chip(
                    label: Text("8", style: TextStyle(fontWeight: FontWeight.bold)),
                    backgroundColor: Colors.blue[100]
                  )),
              ListTile(
                  leading: Icon(FontAwesomeIcons.edit), title: Text("Draft")),
              ListTile(
                  leading: Icon(FontAwesomeIcons.archive),
                  title: Text("Archive")),
              ListTile(
                  leading: Icon(FontAwesomeIcons.paperPlane),
                  title: Text("Sent")),
              ListTile(
                  leading: Icon(FontAwesomeIcons.trash), title: Text("Trash")),
              Divider(),
              Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: ListTile(
                        leading: Icon(FontAwesomeIcons.cog),
                        title: Text("Settings"))),
              ),
            ],
          ),
        ),
        body: Text('I am SideMenu'));
  }
}
