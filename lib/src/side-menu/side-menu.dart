//https://www.youtube.com/watch?v=kVi7taaaUVM
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/src/screen-home/screen-home.dart';
import 'package:myapp/src/shopping/ShoppingList.dart';
import 'package:myapp/src/shopping/ShoppingListItem.dart';
import 'package:myapp/src/side-menu/menu-item.dart';

class MySideMenu extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steven\'s App',
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
  AppBar _appBar = AppBar(title: Text('Steven App 1'));
  Widget _body = Home();
  BuildContext _context = null;

  void _handleMenuItem_OnTap(String screenId) {
    setState(() {
      switch (screenId) {
        case 'HOME_SCREEN':
          _appBar = AppBar(
            title: Text('Home Screen'),
          );
          _body = Home();
          break;
        case 'LIST_SCREEN':
          _appBar = AppBar(
            title: Text('List Screen'),
          );
          _body = ShoppingList(
            products: <Product>[
              Product(name: 'Eggs'),
              Product(name: 'Flour'),
              Product(name: 'Chocolate chips'),
            ],
          );
          break;
      }
      Navigator.of(_context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
        appBar: _appBar,
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
                                        onPressed: () =>
                                            Navigator.pop(context)),
                                    IconButton(
                                        icon: Icon(Icons.arrow_forward),
                                        onPressed: () =>
                                            Navigator.pop(context)),
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
              MenuItem(
                  screenId: 'HOME_SCREEN',
                  onTapCallback: _handleMenuItem_OnTap),
              MenuItem(
                  screenId: 'LIST_SCREEN',
                  onTapCallback: _handleMenuItem_OnTap),
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
        body: _body);
  }
}
