class Student {
  String _name;
  int _age;
  double _grade;
  Student(this._name, this._age, this._grade);
  String get name => _name;
  int get age => _age;
  double get grade => _grade;
  set name(String name) => _name = name;

  set age(int age) {
    if (age > 0) {
      _age = age;
    } else {
      throw ArgumentError('Age must be positive');
    }
  }

  set grade(double grade) {
    if (grade >= 0 && grade <= 100) {
      _grade = grade;
    } else {
      throw ArgumentError('Grade must be between 0 and 100');
    }
  }
}
