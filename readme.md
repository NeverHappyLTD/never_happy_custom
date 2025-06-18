never_happy_custom

A collection of reusable Flutter widgets, base scaffolds, and UI utilities used across projects by Never Happy LTD.

This package includes:

- Custom base scaffolds for consistent layout
- Centralized color scheme and theme configuration
- Splash screen logic
- Modular widgets and utilities for rapid development

Installation

Add this to your pubspec.yaml in any Flutter project:

dependencies:
  never_happy_custom:
    git:
      url: https://github.com/NeverHappyLTD/never_happy_custom.git

Then run:

flutter pub get

Folder Structure (Example)

lib/
├── widgets/
│   ├── base_scaffold.dart
│   └── custom_button.dart
├── theme/
│   ├── colors.dart
│   └── app_theme.dart
├── splash/
│   └── splash_screen.dart

Usage

Import widgets as needed:

import 'package:never_happy_custom/widgets/base_scaffold.dart';
import 'package:never_happy_custom/theme/colors.dart';

Use your shared components like:

return BaseScaffold(
  title: 'Home',
  child: YourWidget(),
);

License & Use

Feel free to use the files in here — just include a credit to Never Happy LTD and let us know any feedback you may have. We'd love to hear how you're using it or how we can improve it.

About

Maintained by Never Happy LTD
https://neverhappy.net

Designed for internal reuse, but made public for the community.
