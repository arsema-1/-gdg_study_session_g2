import 'dart:io';
import 'dart:math';

void main() {
  while (true) {
    // Get numbers first
    print('\nEnter the first number:');
    double? num1 = double.tryParse(stdin.readLineSync()!);

    print('Enter the second number:');
    double? num2 = double.tryParse(stdin.readLineSync()!);

    if (num1 == null || num2 == null) {
      print('Invalid input. Please enter valid numbers.');
      continue;
    }

    print('''
Choose an operation:
  1. Addition (+)
  2. Subtraction (-)
  3. Multiplication (*)
  4. Division (/)
  5. Modulus (%)
  6. Exponentiation (^)
  ''');

    print('Enter your choice:');
    String? choice = stdin.readLineSync();

    double result;
    switch (choice) {
      case '1':
        result = num1 + num2;
        print('Result: $num1 + $num2 = $result');
        break;
      case '2':
        result = num1 - num2;
        print('Result: $num1 - $num2 = $result');
        break;
      case '3':
        result = num1 * num2;
        print('Result: $num1 * $num2 = $result');
        break;
      case '4':
        if (num2 == 0) {
          print('Error: Division by zero is undefined.');
        } else {
          result = num1 / num2;
          print('Result: $num1 / $num2 = $result');
        }
        break;
      case '5':
        result = num1 % num2;
        print('Result: $num1 % $num2 = $result');
        break;
      case '6':
        result = pow(num1, num2).toDouble();
        print('Result: $num1 ^ $num2 = $result');
        break;
      default:
        print('Invalid choice. Please select a number from 1 to 6.');
    }

    print('\nDo you want to perform another calculation? (y/n)');
    String? again = stdin.readLineSync();
    if (again?.toLowerCase() != 'y') {
      print(' Goodbye!');
      break;
    }
  }
}
