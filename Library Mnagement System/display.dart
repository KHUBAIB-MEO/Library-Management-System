import 'dart:io';
import 'books.dart';
import 'main.dart';

void student_dispaly() {
  print("Enter 1 for show all books");
  print("Enter 2 for borrow books");
  print("Enter 0 for Log out");
  while (true) {
    var choice = stdin.readLineSync()!;
    switch (choice) {
      case "1":
        show_book_for_student();
        break;

      case "2":
        borrow_book();
        break;

      case "0":
        main();
        break;

      default:
        print("Invalid choice try again");
    }
  }
}
