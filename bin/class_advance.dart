import 'package:class_advance/class_advance.dart' as class_advance;
import 'package:meta/meta.dart';

void main(List<String> arguments) {
  final user = User.admin(true);
}

class User {
  final String _firstName;
  final String _lastName;

  User(this._firstName, this._lastName);

  factory User.admin(bool admin) {
    if (admin) {
      return Admin(
        specialAdminField: 12,
        firstName: 'a',
        lastName: 'b',
      );
    } else {
      return User('c', 'd');
    }
  }

  String get fullName => '$_firstName, $_lastName';

  @mustCallSuper
  void signOut() {
    print('Signing out');
  }
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
}
