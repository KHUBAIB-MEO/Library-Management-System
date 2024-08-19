import 'dart:io';
import 'display.dart';
import 'books.dart';
import 'main.dart';

void login() {
  // CHOOSE FOR LOGIN //
  while (true) {
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        admin_login();
        break;

      case 2:
        student_login();
        break;

      case 0:
        print("Thankyou for visitng");
        exit(0);

      default:
        print("Invalid choice");
    }
  }
}

//--------------------------------------- ADMIN LOGIN FUNCTION ---------------------------------------//
void admin_login() {
  print("Enter Username");
  String User_name;
  while (true) {
    User_name = stdin.readLineSync()!;
    User_name = User_name.toLowerCase();
    if (User_name == "0") {
      // FOR GOING BACK //
      main();
    }
    if (User_name == "khubaib") {
      // USERNAME CHECK //
      print("Enter password");
      while (true) {
        String pass = stdin.readLineSync()!;
        if (pass == "0") {
          // FOR GOING BACK //
          main();
        }
        if (pass == "15045") {
          // PASSWORD CHECK //
          books();
        } else {
          print("Wrong password enter Password Again");
          print("Enter 0 for Exit");
        }
      }
    } else {
      print("Wrong username enter Username Again");
      print("Enter 0 for Exit");
    }
  }
}

//--------------------------------------- STUDENT LOGIN FUNCTION ---------------------------------------//
void student_login() {
  List<Map<String, int>> information_of_student = [
    {"HUZAIFA": 1111},
    {"UZAIR": 2222},
    {"MAZZ": 3333},
    {"UMER": 4444}
  ];
  print("Enter username");
  while (true) {
    String User_name = stdin.readLineSync()!;
    if (User_name == "0") {
      main();
    }
    User_name = User_name.toUpperCase();
    for (int i = 0; i < information_of_student.length; i++) {
      if (information_of_student[i].containsKey(User_name)) {
        print("Enter password");
        while (true) {
          int pass = int.parse(stdin.readLineSync()!);
          if (pass == 0) {
            main();
          }
          if (information_of_student[i].containsValue(pass)) {
            student_dispaly();
          } else {
            print("Wrong password");
            print("Enter password again or press 0 for back");
          }
        }
      }
    }
    print("Wrong username");
    print("Enter username again or press 0 for back");
  }
}
