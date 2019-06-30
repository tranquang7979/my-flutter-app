import 'package:flutter/material.dart';
import './page1.dart';
import './page2.dart';

//https://api.flutter.dev/flutter/widgets/Navigator-class.html

// This is the type used by the popup menu below.
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class MyNavigator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Navigator',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: MyAppHome(),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => Page1(),
        '/b': (BuildContext context) => Page2(),
        '/c': (BuildContext context) => Page1(),
      },
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
          title: Text('Home page'),
        ),
        body: Column(
          children: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.arrow_forward_ios),
                label: Text('Push context'),
                onPressed: _goNextPage),
            FlatButton.icon(
                icon: Icon(Icons.arrow_forward_ios),
                label: Text('Push by name'),
                onPressed: () {
                  _goPage("a");
                }),
            FlatButton.icon(
                icon: Icon(Icons.arrow_forward_ios),
                label: Text('Push by name'),
                onPressed: () {
                  _goPage("b");
                }),
             _popupMenu(),
          ],
        ));
  }

  void _goNextPage() {
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('My Page')),
          body: Center(
            child: FlatButton(
              child: Text('POP'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    ));
  }

  void _goPage(name) {
    Navigator.pushNamed(context, '/' + name);
  }

  PopupMenuButton<WhyFarther> _popupMenu() {
    return PopupMenuButton<WhyFarther>(
      onSelected: (WhyFarther result) {
        //_showDialog(result._name);
        _showDialog(result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.harder,
              child: Text('Working a lot harder'),
            ),
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.smarter,
              child: Text('Being a lot smarter'),
            ),
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.selfStarter,
              child: Text('Being a self-starter'),
            ),
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.tradingCharter,
              child: Text('Placed in charge of trading charter'),
            ),
          ],
    );
  }

  void _showDialog(content) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text(content),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
