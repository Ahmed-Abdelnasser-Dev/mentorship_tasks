
//* Old code
// abstract class WidgetController {
//   void initState();
//   void dispose();
//   void handleAnimation();
//   void handleNetwork();
// }

// class SimpleButtonController implements WidgetController {
//   @override
//   void initState() => print('Init button');
//   @override
//   void dispose() => print('Dispose button');
//   @override
//   void handleAnimation() =>
//       throw UnimplementedError('No animation in simple button');

//   @override
//   void handleNetwork() => throw UnimplementedError('No network in button ');
// }

//* Answer Code
//? the code violates the Interface Segregation Principle (ISP) of OOP as the WidgetController interface forces implementing classes to define methods they do not use.
//? To fix this, we can split the WidgetController interface into smaller, more specific interfaces so that classes only need to implement the methods that are relevant to them.

// base button controller interface
abstract class BaseController {
  void initState();
  void dispose();
}

// Animation related button controller interface
abstract class AnimationController {
  void handleAnimation();
}

// Network related button controller interface
abstract class NetworkController {
  void handleNetwork();
}

//? IMPELEMETION EXAMPLES

// Simple button only needs base controller
class ButtonBaseController implements BaseController {
  @override
  void initState() => print('Init button');

  @override
  void dispose() => print('Dispose button');
}

// button that has animations
class AnimatedButtonController implements BaseController, AnimationController {
  @override
  void initState() => print('Init Animated button');

  @override
  void dispose() => print('Dispose Animated button');

  @override
  void handleAnimation() => print('Handle animation for Animated button');
}

// Widget with network needs
class NetworkWidgetController implements BaseController, NetworkController {
  @override
  void initState() => print('Init network widget');

  @override
  void dispose() => print('Dispose network widget');

  @override
  void handleNetwork() => print('Handle network call');
}
