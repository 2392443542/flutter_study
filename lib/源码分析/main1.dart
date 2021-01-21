import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List item = ["aaaa", "bbbb", "ccccc"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
          children: item.map((e) {
        return ListItemFull(
          e,
          key: ValueKey(e),
        );
      }).toList()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            item.removeAt(0);
          });
        },
      ),
    );
  }
}

class ListItemLess extends StatelessWidget {
  final String name;
  ListItemLess(this.name);
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.name),
      color: randomColor,
      height: 80,
    );
  }
}

class ListItemFull extends StatefulWidget {
  final String name;
  ListItemFull(
    this.name, {
    Key key,
  }) : super(key: key);

  @override
  _ListItemFullState createState() => _ListItemFullState();
}

class _ListItemFullState extends State<ListItemFull> {
  // ListItemLess(this.name);
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.name),
      color: randomColor,
      height: 80,
    );
  }
}
