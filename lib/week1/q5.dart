
//* Old code
// class LocalNotificationService {
//   void send(String message) {
//     print('Sending local notification: $message');
//   }
// }

// class AppNotifier {
//   final LocalNotificationService service = LocalNotificationService();
//   void notifyUser(String message) {
//     service.send(message);
//   }
// }

//* Answer Code
//? the code violates the Dependency Inversion Principle (DIP) of OOP as the AppNotifier class depends directly on the concrete implementation of LocalNotificationService.
//? To fix this, we can use an abstraction for the notification service and make AppNotifier depend on that abstraction instead of the concrete class.

//? in simpler terms Now both high-level and low-level modules depend on the same Abstraction

// abstraction
abstract class NotificationService {
  void send(String message);
}

// low-level implementations depend on abstraction
class LocalNotificationService implements NotificationService {
  @override
  void send(String message) {
    print('Sending local notification: $message');
  }
}
// another low-level implementation
class FirebaseNotificationService implements NotificationService {
  @override
  void send(String message) {
    print('Sending Firebase notification: $message');
  }
}

// high-level module also depends on abstraction
class AppNotifier {
  final NotificationService service;

  AppNotifier(this.service); 

  void notifyUser(String message) {
    service.send(message);
  }
  
}