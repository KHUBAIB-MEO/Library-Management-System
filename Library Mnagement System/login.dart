import 'dart:io';

import 'books.dart';
import 'main.dart';

void login() {
  while (true) {
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        admin_login();
        break;

      case 2:
        break;

      case 3:
        break;

      case 0:
        print("Thankyou for visitng");
        exit(0);
      //break;

      default:
        print("Invalid choice");
    }
  }
}

void admin_login() {
  print("Enter Username");
  String User_name;
  while (true) {
    User_name = stdin.readLineSync()!;
    User_name = User_name.toLowerCase();
    if (User_name == "0") {
      main();
    }
    if (User_name == "khubaib") {
      print("Enter password");
      while (true) {
        String pass = stdin.readLineSync()!;
        if (pass == "0") {
          main();
        }
        if (pass == "15045") {
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
