# Part G — Debugging log

The following three incorrect versions were deliberately tested as debugging exercises. The incorrect lines are retained as comments beside the corrected functions in `dart_basics.dart`. Each test shows the wrong result, the reason, and the corrected line.

## 1. Initials: invalid string index

**Incorrect draft line (B3, line 7 of the test snippet):**
```dart
result += '${names[i][names[i].length].toUpperCase()}.';
```

**Error:** `RangeError (index): Invalid value: Not in inclusive range 0..4: 5`

**Cause:** The first test name, `Wadah`, has five characters. String indexes are 0 through 4, so `names[i].length` attempts to read index 5, which is outside the string.

**Fix:**
```dart
result += '${names[i][0].toUpperCase()}.';
```

## 2. Vowel counter: counter increased by two

**Incorrect draft line (B2, line 7 of the test snippet):**
```dart
count += 2;
```

**Wrong output:** `Wadah Muzamil Gaafar Mohammed has 22 vowels`

**Cause:** The counter adds two for every vowel instead of adding one. The correct count for the full name is 11.

**Fix:**
```dart
count++;
```

## 3. MoMo fee: incorrect fee band

**Incorrect draft line (D2, line 5 of the test snippet):**
```dart
if (amount <= 150000) return 1500;
```

**Wrong output:** `Total fees: 16500 RWF`

**Cause:** All 11 receipt amounts for this registration number are between 10,001 and 150,000 RWF, so each should have a fee of 250 RWF. Returning 1,500 RWF makes the total 11 × 1,500 = 16,500 RWF instead of 2,750 RWF.

**Fix:**
```dart
if (amount <= 150000) return 250;
```

## Reflection

Part F required the most careful checking because several functions had to work together while preserving the balance after each transaction. Testing invalid amounts, insufficient balances, and PIN edge cases helped check that failed transactions did not change the balance.
