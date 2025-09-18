import 'package:flutter/material.dart';


//* Old Code
// class Screen {
//   void navigate() {
//     print('Navigating to screen');
//   }
// }

// class HomeScreen extends Screen {
//   @override
//   void navigate() {
//     print('Navigating to home');
//   }
// }

// class SettingsScreen extends Screen {
//   @override
//   void navigate() {
//     throw Exception('Settings don\'t navigate this way!');
//   }
// }

// class NavigationButton extends StatelessWidget {
//   final Screen screen;
//   NavigationButton(this.screen);
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => screen.navigate(),
//       child: Text('Navigate'),
//     );
//   }
// }

//* Answer Code
//? the code violates the Liskov Substitution Principle (LSP) of OOP as the SettingsScreen class cannot be used in place of the Screen class without causing unexpected behavior.
//? To fix this, we can refactor the design to ensure that all subclasses of Screen can be used interchangeably without altering the correctness of the program.

// Abstract interface only for navigable screens
abstract class Navigable {
  void navigate();
}

// Base class for all screens (not all are navigable)
class Screen {

  // We cant but all the screens common properties and methods here so the other screens can inherit them
}

// HomeScreen IS navigable
class HomeScreen extends Screen implements Navigable {
  @override
  void navigate() {
    print('Navigating to home');
  }
}

// SettingsScreen is NOT navigable, so we don’t implement Navigable
class SettingsScreen extends Screen {
  void openSettings() {
    print('Opening settings (not via navigate)');
  }
}

// Button that only works with Navigable screens
class NavigationButton extends StatelessWidget {
  final Navigable screen;
  NavigationButton(this.screen);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => screen.navigate(),
      child: const Text('Navigate'),
    );
  }
}

