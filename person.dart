class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  String get name => _name;
  int get age => _age;

  set name(String name) => _name = name;
  set age(int age) {
    if (age > 0) {
      _age = age;
    } else {
      throw ArgumentError('Age must be positive');
    }
  }

  void displayInfo() {
    print('Name: $_name');
    print('Age: $_age');
  }
}

class Student extends Person {
  // Additional private attributes
  String _studentId;
  double _grade;

  Student(String name, int age, this._studentId, this._grade)
    : super(name, age);

  String get studentId => _studentId;
  double get grade => _grade;

  set studentId(String studentId) => _studentId = studentId;
  set grade(double grade) {
    if (grade >= 0 && grade <= 100) {
      _grade = grade;
    } else {
      throw ArgumentError('Grade must be between 0 and 100');
    }
  }
}

void main() {
  var student = Student('mariam', 20, 'S12345', 95.5);
  student.displayInfo();
}
