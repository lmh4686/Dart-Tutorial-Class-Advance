void main(List<String> arguments) {
  ChatBot bot = ChatBot('2');
  bot.sendElevatedMessage('Using method defined in the mixin');
  final admin = Admin(firstName: 'firstName', lastName: 'lastName', specialAdminField: 2);
  admin.sendElevatedMessage('Using method defined in the mixin');
}

class User {
  final String firstName;
  final String lastName;

  User(this.firstName, this.lastName);
}

//mixin doesn't perform any inheritance
//Only add methods into the classes
mixin ElevatedClient {
  void sendElevatedMessage(String text) {
    print('Sending a message with an elevated importance: $text');
  }
}

class Admin extends User with ElevatedClient {
  final double specialAdminField;

  Admin({
    required String firstName,
    required String lastName,
    required this.specialAdminField,
  }) : super(firstName, lastName);
}

class ChatBot with ElevatedClient {
  final String id;

  ChatBot(this.id);

  void sendElevatedMessage(String text) {
    print('Sending a message with an elevated importance: $text');
  }
}
