

import 'package:flutter/material.dart';
import 'package:flutter_hiv/model/books.dart';
import 'package:flutter_hiv/screen/my_books.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BooksAdapter());
  await Hive.openBox<Books>('booksBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyBooks(),
    );
  }
}
