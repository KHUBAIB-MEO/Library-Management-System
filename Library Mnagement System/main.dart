import 'login.dart';

List<Map<int, Map>> info = [];
List<Map<String, Map>> information_of_student = [
  {
    "HUZAIFA": {"ID": 1111}
  },
  {
    "UZAIR": {"ID": 2222}
  },
  {
    "MAZZ": {"ID": 3333}
  },
  {
    "UMER": {"ID": 4444}
  }
];

void main() {
  print(
      "------------------------------Welcome to Library Managment System------------------------------");
  print("Enter 1 for Admin login");
  print("Enter 2 for Student login");
  print("Enter 0 for Exit");

  login(); // LOGIN FUNCTION FOR ADMIN AND STUDENT //
}
