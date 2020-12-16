## [2.0.0-nullsafety.0] - 2020-12-16

- #### package -
    - Migrated to NullSafety

- #### example app -
    - Migrated to NullSafety

## [2.0.0] - 2020-06-13

- #### package -
    - Now the Atom's stack uses flutter's painter library implementation to draw the atom and its animations.
    - Painter library uses Skia graphics renderer to render graphical entities, so performance boosted by a factor 10 !
    - Some size and scaling factors slightly reduced.
    - Reduced many widgets in the Atom's build implementation to make it more performant.
    - Heavy code-refactor and reduced LOC.
    - Implemented dual EaseInOut curve in a single curved path using `CatmullRomCurve`.
    - Tried my best to mimic the original EaseInOut curve for both halves of the electron path.
    - You can find more details here - https://api.flutter.dev/flutter/animation/CatmullRomCurve-class.html.

- #### example app -
    - Updated example app with `centerWidget` property and other v2 changes.
    - App demo is now live at - http://abhi011999.github.io/create_atom_flutter/.

## [1.4.0] - 2020-04-25 (BREAKING CHANGE)

- #### package -
    - Replaced `scale` property with `size` property by implementing new logic
      of creating atom stack.
    
        **For users below v1.4.0 -**
        Replace `scale` property with `size` in your corresponding code and set the
        value of `size` in accordance with this example -
        - If suppose `scale` is 1.0 then `size` will be 215.0 * 1.0 = 215
        - If suppose `scale` is 0.3 then `size` will be 215.0 * 0.3 = 64.5
        Because 215.0 was hard-coded value by default.

    - Fixed centerWidget scaling issue, now it scales with the atom
    - Added extensive code documentation
    - Re-factored and re-structured the libraries

- #### example app - 
    - Updated app with the breaking change

## [1.3.0] - 2020-04-21

- #### package -
    - Added a new `centerWidget` property and feature
    - Corrected orbit angles in degrees
    - Fixed orbits scale clipping above 2.0x
    - Electron paths are now dynamically updated when the parent widget updates

- #### example app -
    - Added a new playground mode (web support will be added soon)

## [1.2.0] - 2020-04-10

- Added example app for demonstration
- Updated documentation
- Removed un-used test file (tests can be added in future)

## [1.1.0] - 2020-04-10

- Added documentation and example project.

## [1.0.0] - 2020-04-09

- Initial release, go create some atoms !!