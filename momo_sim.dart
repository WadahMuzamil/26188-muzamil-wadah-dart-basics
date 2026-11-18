// Student: Wadah Muzamil Gaafar Mohammed
// Reg no: 26188
const String regNo = '26188';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by WM
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by WM
String formatRwf(int amount) {
  String number = amount.abs().toString();
  String result = '';
  int i = 0;

  while (i < number.length) {
    result += number[i];

    int remaining = number.length - i - 1;
    if (remaining > 0 && remaining % 3 == 0) {
      result += ',';
    }

    i++;
  }

  if (amount < 0) result = '-$result';

  return '$result RWF';
}

// by WM
bool isValidPin(String pin) {
  if (pin.length != 5 || pin == '12345') return false;

  int i = 0;
  while (i < pin.length) {
    if (pin[i].compareTo('0') < 0 ||
        pin[i].compareTo('9') > 0) {
      return false;
    }
    i++;
  }

  if (pin == '00000' || pin == '11111' ||
      pin == '22222' || pin == '33333' ||
      pin == '44444' || pin == '55555' ||
      pin == '66666' || pin == '77777' ||
      pin == '88888' || pin == '99999') {
    return false;
  }

  return true;
}

// by WM
int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  balance -= amount + fee;

  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(balance)}');

  return balance;
}

// by WM
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  balance -= amount;
  print('Airtime bought: ${formatRwf(amount)}. New balance: ${formatRwf(balance)}');

  return balance;
}

// by WM
void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345')); // false
  print(isValidPin('77777')); // false
  print(isValidPin('4821'));  // false
  print(isValidPin('48a21')); // false
  print(isValidPin('48218')); // true

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  int amount = (d + 1) * 3000;

  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);

  balance = buyAirtime(balance, 1000);

  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  // Extra tests
  print(formatRwf(0));        // 0 RWF
  print(formatRwf(999));      // 999 RWF
  print(formatRwf(1000));     // 1,000 RWF
  print(formatRwf(-5000));    // -5,000 RWF
  print(formatRwf(1250000));  // 1,250,000 RWF
  print(isValidPin('11111')); // false
}
