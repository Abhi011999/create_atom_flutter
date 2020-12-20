// Copyright 2020 Abhishek Dubey. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:create_atom/create_atom.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
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
  static int _currentIndex = 1;

  static final List<Widget> _pages = [
    RandomAtoms(),
    AtomPlayground(),
  ];

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

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.all_inclusive),
          label: "Random",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow),
          label: "Playground",
        ),
      ],
      onTap: (int index) => setState(() => _currentIndex = index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: SizedBox(
          height: 200.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _showText("A "),
              _showText("T "),
              Atom(
                size: 75.25,
                orbitsColor: Colors.white,
                nucleusColor: Colors.white,
                electronsColor: Colors.white,
              ),
              _showText(" M"),
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }
}

class RandomAtoms extends StatefulWidget {
  @override
  _RandomAtomsState createState() => _RandomAtomsState();
}

class _RandomAtomsState extends State<RandomAtoms> {
  static final _rand = new Random();
  static int? _r, _g, _b;

  int _genRand(int min, int max) => min + _rand.nextInt(max - min);

  _genColor() {
    return Color.fromRGBO(
      _r!,
      _g!,
      _b!,
      1.0,
    );
  }

  _genRandColor() {
    _r = _genRand(0, 255);
    _g = _genRand(0, 255);
    _b = _genRand(0, 255);

    return _genColor();
  }

  Widget _atomGrid() {
    return GridTile(
      child: Atom(
        size: 129,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
        tooltip: "Randomize",
      ),
    );
  }
}

class AtomPlayground extends StatefulWidget {
  @override
  _AtomPlaygroundState createState() => _AtomPlaygroundState();
}

class _AtomPlaygroundState extends State<AtomPlayground> {
  double _scale = 200;
  double _nRadiusFactor = 1.0;
  double _oWidthFactor = 1.0;
  double _oAngle1 = 0.0;
  double _oAngle2 = 1.047198;
  double _oAngle3 = 5.235988;
  Color _nColor = Color(0xffffffff);
  Color _oColor = Color(0xffffffff);
  Color _eColor = Color(0xffffffff);
  Color _bgColor = Color(0xff1a1a1a);
  double _eSpeed1 = 1000.0;
  double _eSpeed2 = 2000.0;
  double _eSpeed3 = 3000.0;
  Duration _eDur1 = Duration(milliseconds: 1000);
  Duration _eDur2 = Duration(milliseconds: 2000);
  Duration _eDur3 = Duration(milliseconds: 3000);
  Widget? _centerW;

  int? _radioButton;

  void _changeNColor(Color colorNext) {
    setState(() => _nColor = colorNext);
  }

  void _changeOColor(Color colorNext) {
    setState(() => _oColor = colorNext);
  }

  void _changeEColor(Color colorNext) {
    setState(() => _eColor = colorNext);
  }

  void _changeBGColor(Color colorNext) {
    setState(() => _bgColor = colorNext);
  }

  _colorPicker(colorValue, colorFunction) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: colorValue,
                onColorChanged: colorFunction,
              ),
            ),
          );
        });
  }

  Widget _scaleSlider() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 10.0,
      children: [
        Text(
          "Scale :",
          style: TextStyle(color: Colors.white70),
        ),
        Container(
          width: 350.0,
          child: Slider(
            min: 21.5,
            max: 430,
            value: _scale,
            onChanged: (val) => setState(() => _scale = val),
          ),
        ),
      ],
    );
  }

  Widget _nRadiusSlider() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 10.0,
      children: [
        Text(
          "Nucleus Radius Factor :",
          style: TextStyle(color: Colors.white70),
        ),
        Container(
          width: 350.0,
          child: Slider(
            min: 0.1,
            max: 10.0,
            value: _nRadiusFactor,
            onChanged: (val) => setState(() => _nRadiusFactor = val),
          ),
        ),
      ],
    );
  }

  Widget _oWidthSlider() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 10.0,
      children: [
        Text(
          "Orbits Width Factor :",
          style: TextStyle(color: Colors.white70),
        ),
        Container(
          width: 350.0,
          child: Slider(
            min: 0.1,
            max: 10.0,
            value: _oWidthFactor,
            onChanged: (val) => setState(() => _oWidthFactor = val),
          ),
        ),
      ],
    );
  }

  Widget _oAngleSlider1() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 10.0,
      children: [
        Text(
          "Orbit 1 :",
          style: TextStyle(color: Colors.white70),
        ),
        Container(
          width: 350.0,
          child: Slider(
            min: 0.0,
            max: 2 * pi,
            divisions: 360,
            value: _oAngle1,
            onChanged: (val) => setState(() => _oAngle1 = val),
          ),
        ),
      ],
    );
  }

  Widget _oAngleSlider2() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 10.0,
      children: [
        Text(
          "Orbit 2 :",
          style: TextStyle(color: Colors.white70),
        ),
        Container(
          width: 350.0,
          child: Slider(
            min: 0.0,
            max: 2 * pi,
            divisions: 360,
            value: _oAngle2,
            onChanged: (val) => setState(() => _oAngle2 = val),
          ),
        ),
      ],
    );
  }

  Widget _oAngleSlider3() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 10.0,
      children: [
        Text(
          "Orbit 3 :",
          style: TextStyle(color: Colors.white70),
        ),
        Container(
          width: 350.0,
          child: Slider(
            min: 0.0,
            max: 2 * pi,
            divisions: 360,
            value: _oAngle3,
            onChanged: (val) => setState(() => _oAngle3 = val),
          ),
        ),
      ],
    );
  }

  Widget _colorSelectors() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 10.0,
        children: [
          Text(
            "Nucleus Color :",
            style: TextStyle(color: Colors.white70),
          ),
          VerticalDivider(),
          GestureDetector(
            onTap: () {
              _colorPicker(_nColor, _changeNColor);
            },
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(color: _nColor, shape: BoxShape.circle, border: Border.all(color: Colors.white)),
            ),
          ),
          VerticalDivider(),
          Text(
            "Orbits Color :",
            style: TextStyle(color: Colors.white70),
          ),
          VerticalDivider(),
          GestureDetector(
            onTap: () {
              _colorPicker(_oColor, _changeOColor);
            },
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(color: _oColor, shape: BoxShape.circle, border: Border.all(color: Colors.white)),
            ),
          ),
          VerticalDivider(),
          Text(
            "Electrons Color :",
            style: TextStyle(color: Colors.white70),
          ),
          VerticalDivider(),
          GestureDetector(
            onTap: () {
              _colorPicker(_eColor, _changeEColor);
            },
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(color: _eColor, shape: BoxShape.circle, border: Border.all(color: Colors.white)),
            ),
          ),
          VerticalDivider(),
          Text(
            "Backgroud Color :",
            style: TextStyle(color: Colors.white70),
          ),
          VerticalDivider(),
          GestureDetector(
            onTap: () {
              _colorPicker(_bgColor, _changeBGColor);
            },
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(color: _bgColor, shape: BoxShape.circle, border: Border.all(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _eSpeedSlider1() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 10.0,
      children: [
        Text(
          "ESpeed 1 :",
          style: TextStyle(color: Colors.white70),
        ),
        Container(
          width: 350.0,
          child: Slider.adaptive(
            min: 50,
            max: 6000,
            value: _eSpeed1,
            onChanged: (val) => setState(() {
              _eDur1 = Duration(milliseconds: val.toInt());
              _eSpeed1 = val;
            }),
          ),
        ),
      ],
    );
  }

  Widget _eSpeedSlider2() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 10.0,
      children: [
        Text(
          "ESpeed 2 :",
          style: TextStyle(color: Colors.white70),
        ),
        Container(
          width: 350.0,
          child: Slider(
            min: 50,
            max: 6000,
            value: _eSpeed2,
            onChanged: (val) => setState(() {
              _eDur2 = Duration(milliseconds: val.toInt());
              _eSpeed2 = val;
            }),
          ),
        ),
      ],
    );
  }

  Widget _eSpeedSlider3() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 10.0,
      children: [
        Text(
          "ESpeed 3 :",
          style: TextStyle(color: Colors.white70),
        ),
        Container(
          width: 350.0,
          child: Slider(
            min: 50,
            max: 6000,
            value: _eSpeed3,
            onChanged: (val) => setState(() {
              _eDur3 = Duration(milliseconds: val.toInt());
              _eSpeed3 = val;
            }),
          ),
        ),
      ],
    );
  }

  Widget _centerWidgetBar() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Text(
          "Center Widget :",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
        ),
        VerticalDivider(),
        Radio(
          value: 1,
          groupValue: _radioButton,
          onChanged: (dynamic val) {
            setState(() {
              _centerW = null;
              _radioButton = val;
            });
          },
        ),
        Text(
          "No",
          style: TextStyle(color: Colors.white70),
        ),
        VerticalDivider(width: 5.0),
        Radio(
          value: 2,
          groupValue: _radioButton,
          onChanged: (dynamic val) {
            setState(() {
              _centerW = Atom(
                size: 50,
                nucleusColor: _nColor,
                orbitsColor: _oColor,
                electronsColor: _eColor,
              );
              _radioButton = val;
            });
          },
        ),
        Text(
          "Atom",
          style: TextStyle(color: Colors.white70),
        ),
        VerticalDivider(width: 5.0),
        Radio(
          value: 3,
          groupValue: _radioButton,
          onChanged: (dynamic val) {
            setState(() {
              _centerW = Text(
                "Atom",
                style: TextStyle(color: _nColor),
              );
              _radioButton = val;
            });
          },
        ),
        Text(
          "Text",
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  void initState() {
    super.initState();
    _radioButton = 1;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Atom(
                  size: _scale,
                  nucleusRadiusFactor: _nRadiusFactor,
                  orbitsWidthFactor: _oWidthFactor,
                  orbit1Angle: _oAngle1,
                  orbit2Angle: _oAngle2,
                  orbit3Angle: _oAngle3,
                  nucleusColor: _nColor,
                  orbitsColor: _oColor,
                  electronsColor: _eColor,
                  animDuration1: _eDur1,
                  animDuration2: _eDur2,
                  animDuration3: _eDur3,
                  centerWidget: _centerW,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              _scaleSlider(),
                              Divider(thickness: 2.0),
                              _nRadiusSlider(),
                              _oWidthSlider(),
                              Divider(thickness: 2.0),
                              _oAngleSlider1(),
                              _oAngleSlider2(),
                              _oAngleSlider3(),
                              Divider(thickness: 2.0),
                              _colorSelectors(),
                              Divider(thickness: 2.0),
                              _eSpeedSlider1(),
                              _eSpeedSlider2(),
                              _eSpeedSlider3(),
                              Divider(thickness: 2.0),
                              _centerWidgetBar(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
