abstract class Employee {
  String name;
  int employeeId;
  Employee(this.name, this.employeeId);
  double calculateSalary();
}

class FullTimeEmployee extends Employee {
  double monthlySalary;
  FullTimeEmployee(String name, int employeeId, this.monthlySalary)
    : super(name, employeeId);

  @override
  double calculateSalary() {
    // TODO: implement calculateSalary
    return monthlySalary;
  }
}

class PartTimeEmployee extends Employee {
  double hourlyRate;
  int hoursWorked;
  PartTimeEmployee(
    String name,
    int employeeId,
    this.hourlyRate,
    this.hoursWorked,
  ) : super(name, employeeId);

  @override
  double calculateSalary() {
    // TODO: implement calculateSalary
    return hourlyRate * hoursWorked;
  }
}

void main() {
  FullTimeEmployee fTime = FullTimeEmployee("rome", 1, 10000);
  print("Name: ${fTime.name}, Salary: ${fTime.calculateSalary()}");
  PartTimeEmployee pTime = PartTimeEmployee("ali", 3, 100, 12);
  print("Name: ${pTime.name}, Salary: ${pTime.calculateSalary()}");
}
