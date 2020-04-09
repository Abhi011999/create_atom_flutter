# create_atom <span> | </span> <a href="https://pub.dev/packages/create_atom"> <img src="https://img.shields.io/badge/pub.dev-package-red?style=flat-square" alt="flutter"/> </a><a href="https://flutter.dev/"> <img src="https://img.shields.io/badge/Built with-flutter-blue?style=flat-square" alt="flutter"/> </a><a href="https://dart.dev/"> <img src="https://img.shields.io/badge/Language-Dart-purple?style=flat-square" alt="flutter"/> </a>

An animated widget that displays atom with a three electrons revolving around a nucleus at its center.

## Features

- Can be scaled upto any size
- Smooth animations with mathematically pre-derived ellipse path equation
- Transparent background for flexible usage with colors
- 3 electron orbits (support for more may come later)
- Orbits angle can be changed
- Orbits color can be changed (support for individual color may come later)
- Nucleus color can be changed
- Electrons color can be changed (support for individual color may come later)
- Individual electron's revolution duration can be changed

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```
dependencies:
  ...
  create_atom: ^1.0.0
```

In your library add the following import:

```
import 'package:create_atom/create_atom.dart';
```

After that run `flutter pub get`

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Usage

```
...
child: Atom()
...
```

Yeah, just like that.
**All variables are optional and you will get a black atom by default.**

## Variables

#### Definitions -

| Variable       | Definition                                 |
| -------------- | ------------------------------------------ |
| scale          | Defines scale of the atom container        |
| orbit1angle    | Defines 1st orbit's angle in degrees       |
| orbit2angle    | Defines 2nd orbit's angle in degrees       |
| orbit3angle    | Defines 3rd orbit's angle in degrees       |
| nucleusColor   | Defines Nucleus Color                      |
| orbitsColor    | Defines Orbits Color                       |
| electronsColor | Defines Electrons Color                    |
| animDuration1  | Defines Animation Duration of 1st electron |
| animDuration2  | Defines Animation Duration of 2nd electron |
| animDuration3  | Defines Animation Duration of 3rd electron |

#### Types and Initial Values -

| Variable       | Type       | Initial Value                  |
| -------------- | ---------- | ------------------------------ |
| scale          | `double`   | `1.0`                          |
| orbit1angle    | `double`   | `0.0`                          |
| orbit2angle    | `double`   | `45.0`                         |
| orbit3angle    | `double`   | `-45.0`                        |
| nucleusColor   | `Color`    | `Colors.black`                 |
| orbitsColor    | `Color`    | `Colors.black`                 |
| electronsColor | `Color`    | `Colors.black`                 |
| animDuration1  | `Duration` | `Duration(milliseconds: 1000)` |
| animDuration2  | `Duration` | `Duration(milliseconds: 2000)` |
| animDuration3  | `Duration` | `Duration(milliseconds: 3000)` |

## Changelog

See [CHANGELOG.md](https://github.com/Abhi011999/create_atom_flutter/blob/master/CHANGELOG.md) for recent changes.

## Contributions

You can be of great help if you want to improve or add anything !

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## License

> Project licensed under standard [MIT License](https://github.com/Abhi011999/create_atom_flutter/blob/master/LICENSE).
