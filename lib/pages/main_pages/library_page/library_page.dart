import 'package:flutter/material.dart';


class Book {
  final String name;
  final String imageUrl;

  Book({required this.name, required this.imageUrl});
}

class BookGrid extends StatelessWidget {
  final List<Book> books = [
    Book(name: 'Book 1', imageUrl: 'assets/book1.jpg'),
    Book(name: 'Book 2', imageUrl: 'assets/book2.jpg'),
    Book(name: 'Book 3', imageUrl: 'assets/book3.jpg'),
    // Add more books as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return GridTile(
          child: Column(
            children: [
              Image.asset(
                books[index].imageUrl,
                height: 150.0, // Set your desired image height
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8.0),
              Text(
                books[index].name,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
