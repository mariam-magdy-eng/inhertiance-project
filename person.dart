class Person {
  // Private attributes
  String _name;
  int _age;

  // Constructor
  Person(this._name, this._age);

  // Getters
  String get name => _name;
  int get age => _age;

  // Setters
  set name(String name) => _name = name;
  set age(int age) {
    if (age > 0) {
      _age = age;
    } else {
      throw ArgumentError('Age must be positive');
    }
  }

  // Display function for Person info
  void displayInfo() {
    print('Name: $_name');
    print('Age: $_age');
  }
}

// 2. Derived Class (Student) inherits from Person
class Student extends Person {
  // Additional private attributes
  String _studentId;
  double _grade;

  // Constructor using 'super' to pass name and age to the base class
  Student(String name, int age, this._studentId, this._grade)
    : super(name, age);

  // Getters
  String get studentId => _studentId;
  double get grade => _grade;

  // Setters
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
