import 'package:flutter/material.dart';
import 'package:flutter_hiv/model/books.dart';
import 'package:hive_flutter/adapters.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({Key? key}) : super(key: key);

  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  final _title = TextEditingController();
  final _author = TextEditingController();
  final box = Hive.box<Books>('booksBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Library'),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<Books> box, _) {
          if(box.values.isEmpty) const Center(child: Text('No books yet'),);
          return ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            padding: const EdgeInsets.all(16),
            itemCount: box.values.length,
            itemBuilder: (context, index){
              var book = box.getAt(index);
              return Card(
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(book!.title ?? 'No title'),
                    subtitle: Text(book.author ?? 'No author'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => box.deleteAt(index),
                    ),
                  ),
                ),
              );
            },
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewBook(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  // add alert dialog
  void _addNewBook(BuildContext context) {
    _title.text = box.get('title').toString();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Book'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _title,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: _author,
                decoration: const InputDecoration(
                  labelText: 'Author',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => _addBook(),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addBook() async{
    await box.put(
      DateTime.now().toString(),
      Books(
        title: _title.text,
        author: _author.text,
      )
    );
    _title.clear();
    _author.clear();
    Navigator.of(context).pop();
  }
}
