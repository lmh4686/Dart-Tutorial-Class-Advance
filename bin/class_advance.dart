//Each file is considered as a package in dart
//Generally the private class is not accessible from another file
//But using part here and part of in new.dart, They're considered as a same package
part 'new.dart';

void main(List<String> arguments) {

}

class _PackagePrivateClass {
  final String _packagePrivateField;
  _PackagePrivateClass._(this._packagePrivateField);
}