library create_atom;

import 'dart:math';
import 'package:flutter/material.dart';

import 'electrons_anim.dart';

class Atom extends StatefulWidget {
  // Size
  final double size;

  // Dimensions
  final double containerSize;
  final double nucleusSize;
  final double electronSize;
  final double orbitWidth;
  final double orbitHeight;
  final double orbitAnimEndHeight;
  final double orbitAnimEndHeightFactor;

  // Angles
  final double orbit1Angle;
  final double orbit2Angle;
  final double orbit3Angle;

  // Colors
  final Color nucleusColor;
  final Color orbitsColor;
  final Color electronsColor;

  // Durations
  final Duration animDuration1;
  final Duration animDuration2;
  final Duration animDuration3;

  // Widgets
  final Widget centerWidget;

  Atom({
    @required this.size,
    this.orbit1Angle = 0.0,
    this.orbit2Angle = pi / 3,
    this.orbit3Angle = -pi / 3,
    this.nucleusColor = Colors.black,
    this.orbitsColor = Colors.black,
    this.electronsColor = Colors.black,
    this.animDuration1 = const Duration(milliseconds: 1000),
    this.animDuration2 = const Duration(milliseconds: 2000),
    this.animDuration3 = const Duration(milliseconds: 3000),
    this.centerWidget,
  })  : containerSize = size,
        nucleusSize = 0.0930 * size,
        electronSize = 0.0698 * size,
        orbitWidth = 0.5 * size,
        orbitHeight = 0.9651 * size,
        orbitAnimEndHeight = 0.9302 * size,
        orbitAnimEndHeightFactor = 0.4651 * size;

  @override
  State<StatefulWidget> createState() => _AtomState();
}

class _AtomState extends State<Atom> {
  Widget _orbit() {
    return Center(
      child: Container(
        width: widget.orbitWidth,
        height: widget.orbitHeight,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.orbitsColor,
            width: widget.electronSize / 4.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.elliptical(widget.orbitWidth, widget.orbitHeight),
          ),
        ),
      ),
    );
  }

  Widget _nucleus() {
    return Container(
      width: widget.nucleusSize,
      height: widget.nucleusSize,
      decoration: BoxDecoration(
        color: widget.nucleusColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.containerSize,
      height: widget.containerSize,
      child: Stack(
        children: <Widget>[
          Center(
            child: widget.centerWidget == null
                ? _nucleus()
                : Transform.scale(
                    scale: 0.00465 * widget.containerSize,
                    child: widget.centerWidget,
                  ),
          ),
          Transform.rotate(
            angle: widget.orbit1Angle,
            child: _orbit(),
          ),
          Transform.rotate(
            angle: widget.orbit2Angle,
            child: _orbit(),
          ),
          Transform.rotate(
            angle: widget.orbit3Angle,
            child: _orbit(),
          ),
          ElectronsAnim(widget),
        ],
      ),
    );
  }
}
