// Student: Wadah Muzamil Gaafar Mohammed
// Reg no: 26188
const String regNo = '26188';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by WM
  text = text.toLowerCase();
  int count = 0;
  // Part G test variant (incorrect): count += 2;
  int i = 0;

  while (i < text.length) {
    if ('aeiou'.contains(text[i])) {
      count++;
    }
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by WM
  List<String> names = fullName.trim().split(RegExp(r'\s+'));
  String result = '';
  int i = 0;

  if (fullName.trim().isEmpty) return '';

  while (i < names.length) {
    // Part G test variant (incorrect): names[i][names[i].length]
    result += '${names[i][0].toUpperCase()}.';
    i++;
  }
  return result;
}

void drawTriangle(int height) {
  // by WM
  int row = 1;

  while (row <= height) {
    String line = '';
    int spaces = height - row;

    while (spaces > 0) {
      line += ' ';
      spaces--;
    }

    int i = 0;
    while (i < row) {
      line += row % 2 == 1 ? '*' : '#';
      i++;
    }

    print(line);
    row++;
  }
}

int momoFee(int amount) {
  // by WM
  // Part G test variant (incorrect): if (amount <= 150000) return 1500;
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by WM
  if (phone.length != 10) return 'INVALID';
  return '${phone.substring(0, 3)}*****${phone.substring(8)}';
}

void main() {
  // by WM
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = 'Wadah Muzamil Gaafar Mohammed';

  print('$fullName has ${countVowels(fullName)} vowels');

  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  int totalFees = 0;
  int i = 1;

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    totalFees += fee;

    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone('0788123456')}');
    i++;
  }

  print('Total fees: $totalFees RWF');
}
