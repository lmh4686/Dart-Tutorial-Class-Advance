// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:meta/meta.dart';

void main(List<String> arguments) {
  final person = Person(age: 15, name: "John Doe");

  //Updating an age by creating a copy of the person directly
  final updatedPerson1 = Person(name: person.name, age: person.age + 1);

  //Or using a method defined in the class
  final updatedPerson2 = updatedPerson1.copyWith(name: 'a');
  print(updatedPerson2.name);
}

//'immutable' annotation from meta, produces err underline if final is not used in constructor
@immutable
class Person {
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  //Defining a method that returns a new Person to implement immutable update.
  Person copyWith({
    String? name,
    int? age,
  }) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  @override
  String toString() => 'Person(name: $name, age: $age)';

  //Compare two instances to see if they have the same values.
  @override
  //'covariant' is used to indicate the 'other' param is a subtype of 'person'
  bool operator ==(covariant Person other) {
    // identical() checks if two instances are the same object in memory. 
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.age == age;
  }

  //Generate a unique hash code based on its fields (name, age)
  //Two objects that are equal have the same hash code but the reverse is not always true since hash codes are not unique
  //The XOR operator (^) is used to combine the two hash codes 
  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
