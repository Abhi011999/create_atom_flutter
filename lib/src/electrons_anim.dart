// Copyright 2020 Abhishek Dubey. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'create_atom.dart';

class _ElectronsPainter extends CustomPainter {
  _ElectronsPainter(this.size, this.theta, this.color);

  double size, theta;
  Color color;

  @override
  void paint(Canvas c, Size s) {
    Offset center = Offset(s.width / 2, s.height / 2);

    /// This offset is the heart of the animation as it calculates
    /// the position of electrons through parametric equation of ellipse.
    ///
    /// This is a derived mathematical equation from the general equation
    /// of vertical ellipse. Electrons follow this path to revolve around
    /// the nucleus on the painted orbit.
    ///
    ///                       x²    y²
    /// General Equation ->   ─  +  ─  = 1
    ///                       b²    a²
    ///
    /// Parametric Equation ->  x = a * cos(θ) + a
    ///                         y = b * sin(θ) + b
    ///
    Offset eOffset = Offset(
      center.dx / 2 * math.cos(theta) + center.dx,
      center.dy * math.sin(theta) + center.dy,
    );

    Paint ePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    c.drawCircle(eOffset, size, ePaint);
  }

  @override
  bool shouldRepaint(_ElectronsPainter old) => true;
}

/// This widget creates and handles the animation
/// for each of the electrons in the [Atom].
class ElectronsAnim extends StatefulWidget {
  ElectronsAnim(this._atom);

  final Atom _atom;

  @override
  State<StatefulWidget> createState() => _ElectronsAnimState();
}

/// State creation of the electron's animation widget.
class _ElectronsAnimState extends State<ElectronsAnim> with TickerProviderStateMixin {
  /// Controllers for each electron.
  AnimationController _controller1, _controller2, _controller3;

  /// Animation type as [double] for each electron.
  Animation<double> _animation1, _animation2, _animation3;

  /// Initial and final angle for equation.
  double _beginRadians = (-1 / 2) * math.pi;
  double _endRadians = (3 / 2) * math.pi;

  /// Curve for electrons path.
  Curve _revolvingCurve = Curves.linear;

  /// Handles first electron's animation.
  void _anim1(bool didUpdate) {
    if (!didUpdate)
      _controller1 = AnimationController(
        duration: widget._atom.animDuration1,
        vsync: this,
      )..repeat();
    else
      _controller1
        ..stop()
        ..duration = widget._atom.animDuration1
        ..repeat();

    _animation1 = Tween<double>(
      begin: _beginRadians,
      end: _endRadians,
    ).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: _revolvingCurve,
      ),
    );
  }

  /// Handles second electron's animation.
  void _anim2(bool didUpdate) {
    if (!didUpdate)
      _controller2 = AnimationController(
        duration: widget._atom.animDuration2,
        vsync: this,
      )..repeat();
    else
      _controller2
        ..stop()
        ..duration = widget._atom.animDuration2
        ..repeat();

    _animation2 = Tween<double>(
      begin: _beginRadians,
      end: _endRadians,
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: _revolvingCurve,
      ),
    );
  }

  /// Handles third electron's animation.
  void _anim3(bool didUpdate) {
    if (!didUpdate)
      _controller3 = AnimationController(
        duration: widget._atom.animDuration3,
        vsync: this,
      )..repeat();
    else
      _controller3
        ..stop()
        ..duration = widget._atom.animDuration3
        ..repeat();

    _animation3 = Tween<double>(
      begin: _beginRadians,
      end: _endRadians,
    ).animate(
      CurvedAnimation(
        parent: _controller3,
        curve: _revolvingCurve,
      ),
    );
  }

  Widget _drawElectron(con, anim, size, angle) {
    return Transform.rotate(
      angle: angle,
      child: AnimatedBuilder(
        animation: con,
        builder: (context, child) => CustomPaint(
          size: size,
          painter: _ElectronsPainter(
            widget._atom.electronSize,
            anim.value,
            widget._atom.electronsColor,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _anim1(false);
    _anim2(false);
    _anim3(false);
  }

  @override
  void didUpdateWidget(ElectronsAnim oldWidget) {
    _anim1(true);
    _anim2(true);
    _anim3(true);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  /// Build method implementation
  Widget build(BuildContext context) {
    Size s = Size(widget._atom.size, widget._atom.size);

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _drawElectron(_controller1, _animation1, s, widget._atom.orbit1Angle),
        _drawElectron(_controller2, _animation2, s, widget._atom.orbit2Angle),
        _drawElectron(_controller3, _animation3, s, widget._atom.orbit3Angle),
      ],
    );
  }
}
