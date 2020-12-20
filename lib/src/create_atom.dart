// Copyright 2020 Abhishek Dubey. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'electrons_anim.dart';

class _NucleusPainter extends CustomPainter {
  _NucleusPainter(this.size, this.color);

  double size;
  Color color;

  @override
  void paint(Canvas c, Size s) {
    Offset nOffset = Offset(s.width, s.height);

    Paint nPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    c.drawCircle(nOffset, size, nPaint);
  }

  @override
  bool shouldRepaint(_NucleusPainter old) => false;
}

class _OrbitsPainter extends CustomPainter {
  _OrbitsPainter(this.strokeWidth, this.strokeWidthFactor, this.color);

  double strokeWidth;
  double strokeWidthFactor;
  Color color;

  @override
  void paint(Canvas c, Size s) {
    Offset oOffset = Offset(s.width / 2, s.height / 2);

    Paint oPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidthFactor * (strokeWidth / 3.0);

    c.drawOval(
      Rect.fromCenter(
        center: oOffset,
        height: 2 * oOffset.dx,
        width: oOffset.dy,
      ),
      oPaint,
    );
  }

  @override
  bool shouldRepaint(_OrbitsPainter old) => false;
}

/// This widget creates a basic atom structure.
class Atom extends StatefulWidget {
  /* Dimensions */

  /// Size of atom's box.
  final double size;

  /// Size of atom's nucleus.
  ///
  /// Size factor -> 0.05
  final double nucleusSize;

  /// Radius factor of atom's nucleus.
  ///
  /// Default -> 1.0
  final double nucleusRadiusFactor;

  /// Size of atom's electron.
  ///
  /// Size factor -> 0.035
  final double electronSize;

  /// Width factor for orbits.
  ///
  /// Default -> 1.0
  final double orbitsWidthFactor;

  /* Angles */

  /// First orbit's angle in radians.
  final double orbit1Angle;

  /// Second orbit's angle in radians.
  final double orbit2Angle;

  /// Third orbit's angle in radians.
  final double orbit3Angle;

  /// Color of atom's nucleus.
  final Color nucleusColor;

  /// Color of atom's orbits.
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

  /* Widget */

  /// A Widget that get's displayed at center
  /// instead of nucleus according to user's choice.
  ///
  /// Note: If both the [nucleusColor] and [centerWidget]
  /// are set then [centerWidget] gets the preference.
  ///
  /// Scale factor -> 0.005
  final Widget? centerWidget;

  Atom({
    Key? key,
    required this.size,
    this.nucleusRadiusFactor = 1.0,
    this.orbitsWidthFactor = 1.0,
    this.orbit1Angle = 0.0,
    this.orbit2Angle = (1 / 3) * math.pi,
    this.orbit3Angle = (-1 / 3) * math.pi,
    this.nucleusColor = Colors.black,
    this.orbitsColor = Colors.black,
    this.electronsColor = Colors.black,
    this.animDuration1 = const Duration(seconds: 1),
    this.animDuration2 = const Duration(seconds: 2),
    this.animDuration3 = const Duration(seconds: 3),
    this.centerWidget,
  })  : assert(size > 0),
        nucleusSize = 0.05 * nucleusRadiusFactor * size,
        electronSize = 0.035 * size,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _AtomState();
}

/// State creation of atom's widget.
class _AtomState extends State<Atom> {
  Widget _drawOrbit(s, angle) {
    return Transform.rotate(
      angle: angle,
      child: CustomPaint(
        size: s,
        painter: _OrbitsPainter(widget.electronSize, widget.orbitsWidthFactor, widget.orbitsColor),
      ),
    );
  }

  /// Build method implementation of atom's structure.
  ///
  /// Below is the sequence in which the atom's stack
  /// gets created.
  ///
  /// Custom Widget/Nucleus
  ///           🡓
  ///      Orbits Stack
  ///           🡓
  ///      First Orbit
  ///           🡓
  ///      Second Orbit
  ///           🡓
  ///      Third Orbit
  ///           🡓
  ///    Electrons Stack
  ///           🡓
  ///     First Electron
  ///           🡓
  ///     Second Electron
  ///           🡓
  ///     Third Electron
  ///
  /// All stacks are [Center] positioned and [Colors.transparent].
  ///
  Widget build(BuildContext context) {
    Size s = Size(widget.size, widget.size);

    return SizedBox.fromSize(
      size: s,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          widget.centerWidget == null
              ? CustomPaint(painter: _NucleusPainter(widget.nucleusSize, widget.nucleusColor))
              : Transform.scale(
                  scale: 0.005 * widget.size,
                  child: widget.centerWidget,
                ),
          _drawOrbit(s, widget.orbit1Angle),
          _drawOrbit(s, widget.orbit2Angle),
          _drawOrbit(s, widget.orbit3Angle),
          ElectronsAnim(widget),
        ],
      ),
    );
  }
}
