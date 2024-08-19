import 'dart:io';
import 'main.dart';

void books() {
  print("Enter 1 for Add books");
  print("Enter 2 for Delete books");
  print("Enter 3 for Show books");
  print("Enter 4 for Borrow books");
  print("Enter 5 for Show borrow  books");
  print("Enter 6 for search books");
  print("Enter 0 for Log out");
  int choice = int.parse(stdin.readLineSync()!);
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
      break;

    case 5:
      break;

    case 6:
      search_books();
      break;

    case 0:
      main();

    default:
      print("Invalid choice");
  }
}

//---------------------------------- ADD BOOKS FUNCTION ------------------------------------//
void add_books() {
  while (true) {
    print("Enter books id");
    int id = int.parse(stdin.readLineSync()!);
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
      if (again == 1) {
        add_books();
      }
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
  if (info.isEmpty) {
    print("No book found");
  } else {
    print("Enter id of book you want search");
    var input = stdin.readLineSync()!;
    int? id = int.parse(input);
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
  if (info.isEmpty) {
    print("No book found");
  } else {
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
  if (info.isEmpty) {
    print("No book is available to delete");
  } else {
    print("Enter book id ");
    int id = int.parse(stdin.readLineSync()!);
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
  }
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
