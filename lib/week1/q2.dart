
//* Old Code
// class UserModel {

// String name = '';
// int age = 0;
// String email = '';

// void updateUser(String name, int age, String email) {
// this.name = name;
// this.age = age;
// this.email = email;
// }

// void saveToFirestore() {
// print('Saving $name, $age, $email to Firestore');
// }
// }

//* Answer Code
//? the code violates the Encapsulation principle of OOP as the UserModel class exposes its internal state and methods directly.
//? To fix this, we can encapsulate the user data and provide methods to update and and access the data
//? We can also separate the persistence logic into a different class to follow the Single Responsibility Principle.

class UserModel {

  // making the fields private
  String _name;
  int _age;
  String _email;

  // constructor for initializing the user model
  UserModel({
    required String name,
    required int age,
    required String email,
  })  : _name = name,
        _age = age,
        _email = email;

  // Getters for accessing private fields
  String get name => _name;
  int get age => _age;
  String get email => _email;

  // Method to update user details 
  void updateUser({required String name, required int age, required String email}) {
    
    _name = name;
    _age = age;
    _email = email;

  }
}

// Separate persistence service
class FirestoreService {
  void saveUser(UserModel user) {
    
    print('Saving ${user.name}, ${user.age}, ${user.email} to Firestore');
  }
}
