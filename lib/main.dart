import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var appContainers = [AppContainer(key: UniqueKey()), AppContainer(key: UniqueKey())];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: appContainers,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.swap_vert),
        onPressed: () {
          setState(() {
            appContainers.insert(0, appContainers.removeLast());
          });
        },
      ),
    );
  }
}

class AppContainer extends StatefulWidget {
  AppContainer({Key key}) : super(key: key);

  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  static const colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];

  var _text = (Random().nextInt(3) + 1).toString();
  var _color = colors[Random().nextInt(colors.length)];

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: _color,
          width: 4.0,
        ),
      ),
      child: Center(child: Text(_text)),
    );
  }
}
