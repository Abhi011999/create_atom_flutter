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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Atoms",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(child: Atom(scale: 1.0)),
    );
  }
}
