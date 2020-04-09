import 'dart:math';
import 'package:flutter/material.dart';
import 'create_atom.dart';

class ElectronsAnim extends StatefulWidget {
  final Atom _atom;

  ElectronsAnim(this._atom);

  @override
  State<StatefulWidget> createState() => _ElectronsAnimState();
}

class _ElectronsAnimState extends State<ElectronsAnim>
    with TickerProviderStateMixin {
  AnimationController _controller1, _controller2, _controller3;
  Animation<double> _animation1, _animation2, _animation3;
  double _animX1, _animX2, _animX3;
  double _animY1, _animY2, _animY3;
  bool _isAnimHalfDone1, _isAnimHalfDone2, _isAnimHalfDone3 = false;

  double _animY(isAnimHalfDone, animX) {
    return isAnimHalfDone
        ? -0.51 *
                sqrt(pow(widget._atom.orbitAnimEndHeightFactor, 2) -
                    pow(animX - widget._atom.orbitAnimEndHeightFactor, 2)) +
            widget._atom.orbitAnimEndHeightFactor
        : 0.51 *
                sqrt(pow(widget._atom.orbitAnimEndHeightFactor, 2) -
                    pow(animX - widget._atom.orbitAnimEndHeightFactor, 2)) +
            widget._atom.orbitAnimEndHeightFactor;
  }

  void _anim1() {
    _controller1 = AnimationController(
      duration: widget._atom.animDuration1,
      vsync: this,
    );

    _animation1 = Tween<double>(
            begin: 0.0, end: widget._atom.orbitAnimEndHeight)
        .animate(CurvedAnimation(parent: _controller1, curve: Curves.easeInOut))
          ..addListener(() {
            _animX1 = _animation1.value;
            _animY1 = _animY(_isAnimHalfDone1, _animX1);
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.forward) {
              _isAnimHalfDone1 = false;
            }
            if (status == AnimationStatus.reverse) {
              _isAnimHalfDone1 = true;
            }
          });
    _controller1.repeat(reverse: true);
  }

  void _anim2() {
    _controller2 = AnimationController(
      duration: widget._atom.animDuration2,
      vsync: this,
    );

    _animation2 = Tween<double>(
            begin: 0.0, end: widget._atom.orbitAnimEndHeight)
        .animate(CurvedAnimation(parent: _controller2, curve: Curves.easeInOut))
          ..addListener(() {
            _animX2 = _animation2.value;
            _animY2 = _animY(_isAnimHalfDone2, _animX2);
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.forward) {
              _isAnimHalfDone2 = false;
            }
            if (status == AnimationStatus.reverse) {
              _isAnimHalfDone2 = true;
            }
          });
    _controller2.repeat(reverse: true);
  }

  void _anim3() {
    _controller3 = AnimationController(
      duration: widget._atom.animDuration3,
      vsync: this,
    );

    _animation3 = Tween<double>(
            begin: 0.0, end: widget._atom.orbitAnimEndHeight)
        .animate(CurvedAnimation(parent: _controller3, curve: Curves.easeInOut))
          ..addListener(() {
            _animX3 = _animation3.value;
            _animY3 = _animY(_isAnimHalfDone3, _animX3);
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.forward) {
              _isAnimHalfDone3 = false;
            }
            if (status == AnimationStatus.reverse) {
              _isAnimHalfDone3 = true;
            }
          });
    _controller3.repeat(reverse: true);
  }

  @override
  void initState() {
    super.initState();
    _anim1();
    _anim2();
    _anim3();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  Widget electron() {
    return Center(
      child: Container(
        height: widget._atom.electronSize,
        width: widget._atom.electronSize,
        decoration: BoxDecoration(
          color: widget._atom.electronsColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget electronStack1(angle) {
    return Center(
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: widget._atom.containerSize,
          height: widget._atom.containerSize,
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: _animX1,
                left: _animY1,
                child: electron(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget electronStack2(angle) {
    return Center(
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: widget._atom.containerSize,
          height: widget._atom.containerSize,
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: _animX2,
                left: _animY2,
                child: electron(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget electronStack3(angle) {
    return Center(
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: widget._atom.containerSize,
          height: widget._atom.containerSize,
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: _animX3,
                left: _animY3,
                child: electron(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          electronStack1(widget._atom.orbit1Angle),
          electronStack2(widget._atom.orbit2Angle),
          electronStack3(widget._atom.orbit3Angle),
        ],
      ),
    );
  }
}
