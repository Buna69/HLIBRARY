
import 'package:flutter/material.dart';

class Book {
  final String name;
  final String imageUrl;

  Book({required this.name, required this.imageUrl});
}

class BookGrid extends StatelessWidget {
  final List<Book> books = [
    Book(name: 'Book 4', imageUrl: 'assets/images/1.jpg'),
    Book(name: 'Book 5', imageUrl: 'assets/images/2.jpg'),
    Book(name: 'Book 6', imageUrl: 'assets/images/3.jpg'),
    Book(name: 'Book 7', imageUrl: 'assets/images/4.jpg'),
    Book(name: 'Book 9', imageUrl: 'assets/images/5.jpg'),
    Book(name: 'Book 8', imageUrl: 'assets/images/6.jpg'),
    //loop hiine
  ];

  BookGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double width = screenWidth / 2; 
    double height = width * 1.5;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (width / height),
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: width,
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0), // Apply border radius
              child: GridTile(
                child: Stack(
                  children: [
                    Image.asset(
                      books[index].imageUrl,
                      fit: BoxFit.fill,
                      height: height,
                    ),
                    Positioned(
                    width: width-5,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      color: const Color.fromARGB(126, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          books[index].name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}