import 'package:flutter/material.dart';
import 'package:homework4_ex2/library/book.dart';
import 'package:homework4_ex2/library/user.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  TextEditingController studentController = TextEditingController();

  final List<Student> students = [
    Student(
      fullName: 'Nguyen Van A',
      books: [Book(bookTitle: 'Sách 01'), Book(bookTitle: 'Sách 02')],
    ),
    Student(
      fullName: 'Nguyen Van B',
      books: [Book(bookTitle: 'Sách 01')],
    ),
  ];

  List<Book> listBooks = [];

  void changeStudent() {
    String name = studentController.text.trim();

    if (name.isEmpty) {
      setState(() {
        listBooks = [];
      });
      return;
    }

    Student? selectedStudent = students.firstWhere(
          (s) => s.fullName.toLowerCase() == name.toLowerCase(),
      orElse: () => Student(fullName: '', books: []),
    );

    if (selectedStudent.fullName.isNotEmpty) {
      setState(() {
        listBooks = List.from(selectedStudent.books);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không tìm thấy sinh viên')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 12),
              Text(
                "Hệ thống\n Quản lý Thư viện",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sinh viên",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: studentController,
                        onSubmitted: (_) => changeStudent(),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: changeStudent,
                    child: Text(
                      "Thay đổi",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Danh sách sách',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  // borderRadius: BorderRadius.circular(12),
                ),
                child: listBooks.isEmpty
                    ? Text("Chưa có danh sách")
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: listBooks
                      .map((book) => Text('- ${book.bookTitle}'))
                      .toList(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 3,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController nameController = TextEditingController();
                      TextEditingController booksController = TextEditingController();

                      return AlertDialog(
                        title: Text('Thêm sinh viên mới'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(labelText: 'Tên sinh viên'),
                            ),
                            SizedBox(height: 12),
                            TextField(
                              controller: booksController,
                              decoration: InputDecoration(
                                  labelText: 'Danh sách sách (phân cách bằng dấu phẩy)'),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Huỷ')),
                          ElevatedButton(
                            onPressed: () {
                              String name = nameController.text.trim();
                              String bookText = booksController.text.trim();

                              if (name.isEmpty || bookText.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin')),
                                );
                                return;
                              }

                              List<Book> newBooks = bookText
                                  .split(',')
                                  .map((e) => Book(bookTitle: e.trim()))
                                  .toList();

                              setState(() {
                                students.add(Student(fullName: name, books: newBooks));
                              });

                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Đã thêm sinh viên')),
                              );
                            },
                            child: Text('Lưu'),
                          )
                        ],
                      );
                    },
                  );
                },

                child: Text('Thêm', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Quản lý'),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'DS Sách'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Sinh viên'),
      ]),
    );
  }
}
