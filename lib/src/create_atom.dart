// Copyright 2020 Abhishek Dubey. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'dart:math';
import 'package:flutter/material.dart';

import 'electrons_anim.dart';

/// This widget creates a basic atom structure.
class Atom extends StatefulWidget {
  /// Size of atom's box.
  final double size;

  /* Dimensions */

  /// Size of the atom's container.
  /// Value is same as that of [size].
  final double containerSize;

  /// Size of atom's nucleus.
  ///
  /// Size factor - 0.0930
  final double nucleusSize;

  /// Size of atom's electron.
  ///
  /// Size factor - 0.0698
  final double electronSize;

  /// Width of atom's orbit.
  /// Calculation - orbitWidth = containerSize / 2.0
  ///
  /// Size factor - 0.5
  final double orbitWidth;

  /// Height of atoms's orbit.
  /// Calculation - orbitHeight = containerSize - (electronSize / 2.0)
  ///
  /// Size factor - 0.9651
  final double orbitHeight;

  /// Maximum height upto which electron's
  /// should travel in atom's container.
  /// This value is decided by keeping electron's
  /// radius and orbit's border width in mind.
  /// Calculation - orbitAnimEndHeight = containerSize - electronSize
  ///
  /// Size factor - 0.9302
  final double orbitAnimEndHeight;

  /// Maximum width upto which electron's
  /// should travel in atom's container.
  /// This value is decided by keeping electron's
  /// radius and orbit's border width in mind.
  /// Calculation - orbitAnimEndHeightFactor = orbitAnimEndHeight / 2.0
  ///
  /// Size factor - 0.4651
  final double orbitAnimEndHeightFactor;

  /* Angles */

  /// First orbit's angle in radians.
  final double orbit1Angle;

  /// Second orbit's angle in radians.
  final double orbit2Angle;

  /// Third orbit's angle in radians.
  final double orbit3Angle;

  /// Color of atom's nucleus.
  final Color nucleusColor;

  /// Color of atom orbits.
  final Color orbitsColor;

  /// Color of atom electrons.
  final Color electronsColor;

  /* Speed Durations */

  /// First electron's speed duration.
  final Duration animDuration1;

  /// Second electron's speed duration.
  final Duration animDuration2;

  /// Third electron's speed duration.
  final Duration animDuration3;

  /* Widgets */

  /// A Widget that get's displayed at center
  /// instead of nucleus according to user's choice.
  ///
  /// Note: If both the [nucleusColor] and [centerWidget]
  /// are set then [centerWidget] gets the preference.
  final Widget centerWidget;

  Atom({
    Key key,
    @required this.size,
    this.orbit1Angle = 0.0,
    this.orbit2Angle = pi / 3,
    this.orbit3Angle = -pi / 3,
    this.nucleusColor = Colors.black,
    this.orbitsColor = Colors.black,
    this.electronsColor = Colors.black,
    this.animDuration1 = const Duration(seconds: 1),
    this.animDuration2 = const Duration(seconds: 2),
    this.animDuration3 = const Duration(seconds: 3),
    this.centerWidget,
  })  : containerSize = size,
        nucleusSize = 0.0930 * size,
        electronSize = 0.0698 * size,
        orbitWidth = 0.5 * size,
        orbitHeight = 0.9651 * size,
        orbitAnimEndHeight = 0.9302 * size,
        orbitAnimEndHeightFactor = 0.4651 * size,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _AtomState();
}

/// State creation of atom's widget.
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

  /// Build implementation of atom's structure.
  ///
  /// Below is the sequence in which the atom's stack
  /// gets created.
  ///
  /// Custom Widget/Nucleus
  ///           🡓
  ///      First Orbit
  ///           🡓
  ///      Second Orbit
  ///           🡓
  ///      Third Orbit
  ///           🡓
  ///  First Electron Stack
  ///           🡓
  ///     First Electron
  ///           🡓
  ///  Second Electron Stack
  ///           🡓
  ///     Second Electron
  ///           🡓
  ///   Third Electron Stack
  ///           🡓
  ///     Third Electron
  ///
  /// All stacks are [Center] positioned and [Colors.transparent].
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
