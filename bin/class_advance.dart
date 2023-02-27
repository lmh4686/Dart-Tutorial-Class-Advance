import 'package:class_advance/class_advance.dart' as class_advance;
import 'package:meta/meta.dart';

void main(List<String> arguments) {
  final admin = Admin(
    specialAdminField: 11,
    firstName: 'firstName',
    lastName: 'lastName',
  );
  //Return error because of the abstract keyword
  // final user = User('a', 'b');

  //But this works
  admin as User;
}

//abstract doesn't allow initiate the class directly
abstract class User {
  final String _firstName;
  final String _lastName;

  User(this._firstName, this._lastName);

  String get fullName => '$_firstName, $_lastName';

  @mustCallSuper
  void signOut() {
    print('Signing out');
  }

  // Fine for User class (abstract only) but get error for Admin class(inherited)
  // To remove error, need override notation in Admin class
  void myMethod();
  //Same for property
  int get myProperty;
}

class Admin extends User {
  final double specialAdminField;

  Admin({
    required this.specialAdminField,
    required String firstName,
    required String lastName,
  }) : super(firstName, lastName);

  @override
  String get fullName => 'Admin: ${super.fullName}';

  @override
  void signOut() {
    print('Admin specific sign out');
    super.signOut();
  }

  @override
  void myMethod() {
    // TODO: implement myMethod
  }
  
  @override
  // TODO: implement myProperty
  int get myProperty => throw UnimplementedError();
}
