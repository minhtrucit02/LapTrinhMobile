import 'book.dart';

class Student{
  Student({
    required this.fullName,
    required this.books,
});
  final String fullName;
  final List<Book> books;
}