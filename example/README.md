# example app

<img src="https://raw.githubusercontent.com/Abhi011999/create_atom_flutter/master/images/example.gif" alt="Atoms"/>

## Code

```dart
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:create_atom/create_atom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyAtoms(),
    );
  }
}

class MyAtoms extends StatefulWidget {
  @override
  _MyAtomsState createState() => _MyAtomsState();
}

class _MyAtomsState extends State<MyAtoms> {
  static final _rand = new Random();
  static int _r, _g, _b;

  int _genRand(int min, int max) => min + _rand.nextInt(max - min);

  _genColor() {
    return Color.fromRGBO(
      _r,
      _g,
      _b,
      1.0,
    );
  }

  _genRandColor() {
    _r = _genRand(0, 255);
    _g = _genRand(0, 255);
    _b = _genRand(0, 255);

    return _genColor();
  }

  Widget _showText(text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Quicksand",
        fontSize: 100.0,
        color: Colors.white,
      ),
    );
  }

  Widget _atomGrid() {
    return GridTile(
      child: Card(
        child: Container(
          child: Atom(
            scale: 0.6,
            orbitsColor: _genRandColor(),
            nucleusColor: _genRandColor(),
            electronsColor: _genRandColor(),
            orbit1Angle: (pi / 180) * _genRand(0, 361),
            orbit2Angle: (pi / 180) * _genRand(0, 361),
            orbit3Angle: (pi / 180) * _genRand(0, 361),
            animDuration1: Duration(milliseconds: _genRand(250, 5000)),
            animDuration2: Duration(milliseconds: _genRand(250, 5000)),
            animDuration3: Duration(milliseconds: _genRand(250, 5000)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: Container(
          color: Colors.black,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _showText("A "),
                _showText("T "),
                Atom(
                  scale: 0.35,
                  orbitsColor: Colors.white,
                  nucleusColor: Colors.white,
                  electronsColor: Colors.white,
                ),
                _showText(" M"),
              ],
            ),
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(4.0),
        children: <Widget>[
          _atomGrid(),
          _atomGrid(),
          _atomGrid(),
          _atomGrid(),
          _atomGrid(),
          _atomGrid(),
          _atomGrid(),
          _atomGrid(),
          _atomGrid(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {}),
        child: Icon(Icons.refresh),
        tooltip: "Reload",
      ),
    );
  }
}
```