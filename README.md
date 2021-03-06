# create_atom <span> | </span> <a href="https://pub.dev/packages/create_atom"><img src="https://img.shields.io/badge/pub.dev-v2.1.0-red?style=flat-square" alt="flutter"/></a> <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Built with-flutter-blue?style=flat-square" alt="flutter"/></a> <a href="https://dart.dev/"><img src="https://img.shields.io/badge/Language-Dart-purple?style=flat-square" alt="flutter"/></a>

An animated widget that displays atom with a three electrons revolving around a nucleus at its center.

<table>
  <tr>
    <th><img src="https://raw.githubusercontent.com/Abhi011999/create_atom_flutter/master/images/2.0x.gif" alt="2.0x"/></th>
    <th><img src="https://raw.githubusercontent.com/Abhi011999/create_atom_flutter/master/images/1.0x.gif" alt="1.0x"/></th>
    <th><img src="https://raw.githubusercontent.com/Abhi011999/create_atom_flutter/master/images/0.5x.gif" alt="0.5x"/></th>
  </tr>
  <tr>
    <td align="center"><code>size: 200</code></td>
    <td align="center"><code>size: 100</code></td>
    <td align="center"><code>size: 50</code></td>
  </tr>
</table>

## Some Famous logos using Atom

<table>
  <tr>
    <th align="center">Name</th>
    <th align="center">Code</th>
    <th align="center">Logo</th>
  </tr>
  <tr>
    <td align="center"><h2>React Logo</h2></td>
    <td>
      <pre lang="dart">
        Atom(
          size: 200.0,
          orbit1Angle: math.pi / 2,
          orbit2Angle: math.pi / 6,
          orbit3Angle: - math.pi / 6,
          orbitsColor: Color(0xFF00D8FF),
          electronsColor: Color(0xFF00D8FF),
          nucleusColor: Color(0xFF00D8FF),
        ),
        </pre>
    </td>
    <td><img src="https://raw.githubusercontent.com/Abhi011999/create_atom_flutter/master/images/react_logo.gif" alt="react-logo"/></td>
  </tr>
  <tr>
    <td align="center"><h2>Atom Text Editor Logo</h2></td>
    <td>
      <pre lang="dart">
        Container(
          width: 300.0,
          height: 300.0,
          color: Color(0xFF323232),
          child: Atom(
            size: 200.0,
            orbit1Angle: math.pi / 1.9,
            orbit2Angle: math.pi / 5,
            orbit3Angle: -math.pi / 7,
            orbitsColor: Color(0xFFEED9B7),
            electronsColor: Color(0xFFEED9B7),
            nucleusColor: Color(0xFFEED9B7),
          ),
        ),
        </pre>
    </td>
  <td><img src="https://raw.githubusercontent.com/Abhi011999/create_atom_flutter/master/images/atom_editor_logo.gif" alt="atom-editor-logo"/></td>
  </tr>
    <tr>
    <td align="center"><h2>Proton DB Logo</h2></td>
    <td>
      <pre lang="dart">
        Container(
          width: 300.0,
          height: 300.0,
          color: Color(0xFF1A2233),
          child: Atom(
            size: 200.0,
            nucleusRadiusFactor: 2.5,
            orbitsWidthFactor: 6.0,
            orbit1Angle: math.pi / 2,
            orbit2Angle: math.pi / 6,
            orbit3Angle: -math.pi / 6,
            orbitsColor: Color(0xFFF50057),
          ),
        ),
        </pre>
    </td>
  <td><img src="https://raw.githubusercontent.com/Abhi011999/create_atom_flutter/master/images/protonDB_logo.gif" alt="atom-editor-logo"/></td>
  </tr>
</table>

## Features

- Can be scaled upto any size within parent widget boundaries
- Smooth animations with mathematically pre-derived ellipse path equation
- Transparent background for flexible usage with colors
- 3 electron orbits (support for more may come later)
- Orbits angle can be changed
- Orbits color can be changed (support for individual color may come later)
- Orbits width can be changed
- Nucleus size can be changed
- Nucleus color can be changed
- Electrons color can be changed (support for individual color may come later)
- Individual electron's revolution duration can be changed
- Any widget can be added in the center instead of nucleus

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  create_atom: ^2.1.0-nullsafety
```

In your library add the following import:

```dart
import 'package:create_atom/create_atom.dart';
```

After that run `flutter pub get`

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Usage

```dart
...
child: Atom(
  size: 100.0,
),
...
```

Yeah, just like that.

- All properties are optional except `size` property.
- You will get a black atom by default.

#### centerWidget property usage -

Assign `centerWidget` with any widget to display that Widget instead of nucleus.

```dart
...
child: Atom(
  size: 100.0,
  centerWidget: Text("At Center"),
),
...
```

**Note:** If both `nucleusColor` and `centerWidget` are set then the `centerWidget` will get preference.

## Properties

#### Definitions -

| Property            | Definition                                 |
| ------------------- | ------------------------------------------ |
| size                | Defines size of the atom's container       |
| nucleusRadiusFactor | Defines radius size factor of nucleus      |
| orbitsWidthFactor   | Defines width factor of the orbits         |
| orbit1angle         | Defines 1st orbit's angle in radians       |
| orbit2angle         | Defines 2nd orbit's angle in radians       |
| orbit3angle         | Defines 3rd orbit's angle in radians       |
| nucleusColor        | Defines Nucleus Color                      |
| orbitsColor         | Defines Orbits Color                       |
| electronsColor      | Defines Electrons Color                    |
| animDuration1       | Defines Animation Duration of 1st electron |
| animDuration2       | Defines Animation Duration of 2nd electron |
| animDuration3       | Defines Animation Duration of 3rd electron |
| centerWidget        | Defines a widget to display at center      |

#### Types and Initial Values -

| Property            | Type       | Initial Value                        |
| ------------------- | ---------- | ------------------------------------ |
| size                | `double`   | `null` (required)                    |
| nucleusRadiusFactor | `double`   | `1.0`                                |
| orbitsWidthFactor   | `double`   | `1.0`                                |
| orbit1angle         | `double`   | `0.0` (Radians), `0.0` (Degrees)     |
| orbit2angle         | `double`   | `pi/3` (Radians), `60.0` (Degrees)   |
| orbit3angle         | `double`   | `-pi/3` (Radians), `-60.0` (Degrees) |
| nucleusColor        | `Color`    | `Colors.black`                       |
| orbitsColor         | `Color`    | `Colors.black`                       |
| electronsColor      | `Color`    | `Colors.black`                       |
| animDuration1       | `Duration` | `Duration(seconds: 1)`               |
| animDuration2       | `Duration` | `Duration(seconds: 2)`               |
| animDuration3       | `Duration` | `Duration(seconds: 3)`               |
| centerWidget        | `Widget`   | `null`                               |

## Example App

### Checkout here - https://abhi011999.github.io/create_atom_flutter/

<img src="https://raw.githubusercontent.com/Abhi011999/create_atom_flutter/master/images/example_random.gif" width="49%" alt="Random Atoms"/> <img src="https://raw.githubusercontent.com/Abhi011999/create_atom_flutter/master/images/example_playground.gif" width="49%" alt="Atoms Playground"/>

**[Code](https://github.com/Abhi011999/create_atom_flutter/blob/master/example/lib/main.dart)**

## Changelog

### Breaking Changes after the nullsafety migration from v2.0.0-nullsafety.0, see changelog for more info -

See [CHANGELOG.md](https://github.com/Abhi011999/create_atom_flutter/blob/master/CHANGELOG.md) for recent changes.

## Contributions

You can be of great help if you want to improve or add anything !

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## License

> Package and all code within licensed under [MIT License](https://github.com/Abhi011999/create_atom_flutter/blob/master/LICENSE).
