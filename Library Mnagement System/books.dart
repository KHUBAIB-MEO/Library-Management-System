import 'dart:io';
import 'display.dart';
import 'main.dart';

void books() {
  print("Enter 1 for Add books");
  print("Enter 2 for Delete books");
  print("Enter 3 for Show books");
  print("Enter 4 for search books");
  print("Enter 0 for Log out");
  while (true) {
    int choice = int.parse(stdin.readLineSync()!);
    // FUNCTION CHOICE //
    switch (choice) {
      case 1:
        add_books();
        break;

      case 2:
        delete_books();
        break;

      case 3:
        show_books();
        break;

      case 4:
        search_books();
        break;

      case 0:
        main();
        break;

      default:
        print("Invalid choice");
    }
  }
}

//---------------------------------- ADD BOOKS FUNCTION ------------------------------------//
void add_books() {
  while (true) {
    // TAKE BOOK INFORMATION FROM USER //
    print("Enter books id");
    int id = int.parse(stdin.readLineSync()!);
    // CHECK IF ID IS ALREADY PRESENT //
    for (var check_id in info) {
      if (check_id.containsKey(id)) {
        print("Id is present already");
        print("Please enter new id");
        add_books();
      }
    }
    print("Enter books name");
    String book_name = stdin.readLineSync()!;
    print("Enter author name");
    String author_name = stdin.readLineSync()!;
    print("Enter published date");
    String published_date = stdin.readLineSync()!;
    print("Enter Quantity of books");
    int quantity = int.parse(stdin.readLineSync()!);

    // ADD DATA IN MAP //
    info.add({
      id: {
        "Name": book_name,
        "Author": author_name,
        "Published Date": published_date,
        "Quantity": quantity
      }
    });

    print("Enter 1 for add another book");
    print("Enter 0 for back");
    while (true) {
      int again = int.parse(stdin.readLineSync()!);
      // ADD ANOTHER BOOK //
      if (again == 1) {
        add_books();
      }
      // BACK //
      if (again == 0) {
        books();
      } else {
        print("Invalid input try again");
      }
    }
  }
}

//---------------------------------- SEARCH BOOKS FUNCTION ------------------------------------//
void search_books() {
  // CHECK IF MAP IS EMPTY OR NOT //
  if (info.isEmpty) {
    print("No book found");
  } else {
    // ID FOR SEARCH //
    print("Enter id of book you want search");
    var input = stdin.readLineSync()!;
    int? id = int.parse(input);
    // PRINT BOOK INFORMATION //
    for (var map in info) {
      if (map.containsKey(id)) {
        print("Book id is : $id");
        print("Book name is : ${map[id]!["Name"]}");
        print("Book's author name is : ${map[id]!["Author"]}");
        print("Book published date is : ${map[id]!["Published Date"]}");
        print("${map[id]!["Quantity"]} book are available");
        stdin.readLineSync();
        books();
      }
    }
    print("Book not found");
    stdin.readLineSync();
    books();
  }
  // BACK //
  print("Press 0 for back");
  while (true) {
    var choice = stdin.readLineSync()!;
    if (choice == 0 || choice == "0") {
      books();
    } else {
      print("Invalid input try again");
    }
  }
}

//---------------------------------- SHOW BOOKS FUNCTION ------------------------------------//
void show_books() {
  var id;
  // CHECK IF MAP IS EMPTY OR NOT //
  if (info.isEmpty) {
    print("No book found");
  } else {
    // PRINT BOOK INFORMATION //
    for (var map in info) {
      id = map.keys.first;
      var bookdetails = map[id];
      print("Book id is : $id");
      print("Book name is : ${bookdetails!["Name"]}");
      print("Book's author name is : ${bookdetails["Author"]}");
      print("Book published date is : ${bookdetails["Published Date"]}");
      print("${bookdetails["Quantity"]} book are available");
      print(
          "\n-------------------------------------------------------------------------------\n");
    }
  }
  // BACK //
  print("Press 0 for back");
  while (true) {
    var choice = stdin.readLineSync()!;
    if (choice == 0 || choice == "0") {
      books();
    } else {
      print("Invalid input try again");
    }
  }
}

//---------------------------------- DELETE BOOKS FUNCTION ------------------------------------//
void delete_books() {
  // CHECK IF MAP IS EMPTY OR NOT //
  if (info.isEmpty) {
    print("No book is available to delete");
    stdin.readLineSync();
    books();
  } else {
    // ID FOR SEARCH //
    print("Enter book id ");
    int id = int.parse(stdin.readLineSync()!);
    // CODE FOR DELETE BOOK //
    print("Enter 1 for delete book");
    print("Enter 0 for back");
    while (true) {
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 0) {
        books();
      } else if (choice == 1) {
        for (int i = 0; i < info.length; i++) {
          if (info[i].containsKey(id)) {
            info.removeAt(i);
            print("Book is deleted");
            stdin.readLineSync();
            books();
          }
        }
        print("Book not found");
        stdin.readLineSync();
        books();
        // BACK //
        print("Press 0 for back");
        while (true) {
          var choice = stdin.readLineSync()!;
          if (choice == 0 || choice == "0") {
            books();
          } else {
            print("Invalid input try again");
          }
        }
      }
    }
  }
}

//---------------------------------- BORROW BOOKS FUNCTION ------------------------------------//
void borrow_book() {
  if (info.isEmpty) {
    print("No books available to borrow.");
    return;
  }

  print("Enter the ID of the book you want to borrow:");
  int id = int.parse(stdin.readLineSync()!);

  var bookDetails;
  for (var map in info) {
    if (map.containsKey(id)) {
      bookDetails = map[id];
      break;
    }
  }

  if (bookDetails == null) {
    print("Book not found.");
    stdin.readLineSync();
    student_dispaly();
  }

  print("Book id is: $id");
  print("Book name is: ${bookDetails["Name"]}");
  print("Book's author name is: ${bookDetails["Author"]}");
  print("Book published date is: ${bookDetails["Published Date"]}");
  print("\nPress 1 to borrow this book");
  print("Press 0 to go back");

  while (true) {
    var borrow_choice = stdin.readLineSync()!;
    if (borrow_choice == "1") {
      if (bookDetails["Quantity"] > 0) {
        print("How many copies do you want to borrow?");
        int borrow = int.parse(stdin.readLineSync()!);

        if (borrow <= bookDetails["Quantity"]) {
          bookDetails["Quantity"] -= borrow;
          print("Books borrowed successfully!");
          stdin.readLineSync(); // To pause the console output
          student_dispaly();
        } else {
          print("Only ${bookDetails["Quantity"]} books available.");
        }
        break;
      } else {
        print("Books are out of stock.");
        stdin.readLineSync(); // To pause the console output
        student_dispaly();
        break;
      }
    } else if (borrow_choice == "0") {
      student_dispaly();
      return;
    } else {
      print("Invalid input, try again.");
    }
  }

  print("Press 0 to go back");
  while (true) {
    var choice = stdin.readLineSync()!;
    if (choice == "0") {
      student_dispaly();
    } else {
      print("Invalid input, try again.");
    }
  }
}

//---------------------------------- SHOW BOOKS FOR STUDENT FUNCTION ------------------------------------//
void show_book_for_student() {
  var id;
  // CHECK IF MAP IS EMPTY OR NOT //
  if (info.isEmpty) {
    print("No book found");
  } else {
    // PRINT BOOK INFORMATION //
    for (var map in info) {
      id = map.keys.first;
      var bookdetails = map[id];
      print("Book id is : $id");
      print("Book name is : ${bookdetails!["Name"]}");
      print("Book's author name is : ${bookdetails["Author"]}");
      print("Book published date is : ${bookdetails["Published Date"]}");
      print("${bookdetails["Quantity"]} book are available");
      print(
          "\n-------------------------------------------------------------------------------\n");
    }
  }
  // BACK //
  print("Press 0 for back");
  while (true) {
    var choice = stdin.readLineSync()!;
    if (choice == 0 || choice == "0") {
      student_dispaly();
    } else {
      print("Invalid input try again");
    }
  }
}
