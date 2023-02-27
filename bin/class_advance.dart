void main(List<String> arguments) {
  final x = 'hello'.duplicate();
  print(x);
  print(x.duplicated);
}

extension StringDuplication on String {
  //Add method to String class
  String duplicate() {
    return this + this;
  }

  //Add property to String class
  String get duplicated => this + this;
}
