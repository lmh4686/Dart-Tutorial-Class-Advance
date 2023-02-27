void main(List<String> arguments) {}

//generic parameter T can also be used in function.
void myMethod<T>(T arg) {}

//Using generic parameter T instead of dynamic for better practice
abstract class DataReader<T> {
  T readData();
}

//implements must override all properties, methods, fields defined in the super class
//Used to create an interface
class IntegerDataReader implements DataReader<int> {
  @override
  int readData() {
    print('performing logic');
    return 12;
  }
}

class StringDataReader implements DataReader<String> {
  @override
  String readData() {
    print('performing logic');
    return 'hi';
  }
}


