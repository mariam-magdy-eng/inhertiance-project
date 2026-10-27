class BankAccount {
  String _accountHolder;
  double _balance;
  BankAccount(this._accountHolder, this._balance);
  String get accountholder => _accountHolder;
  double get balance => _balance;
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: $amount. New balance: $_balance');
    } else {
      print('Invalid deposit amount. Must be greater than zero.');
    }
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Invalid withdrawal amount. Must be greater than zero.');
    } else if (amount > _balance) {
      print('Insufficient funds! Withdrawal exceeds current balance.');
    } else {
      _balance -= amount;
      print('Withdrew: $amount. New balance: $_balance');
    }
  }
}
