import 'package:dharmalib/utils/app_icons.dart';
import 'package:dharmalib/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookListDashboard {
  final String image;
  final String title;
  final int trendingNumber;

  BookListDashboard(this.image, this.title, this.trendingNumber);
}

List<BookListDashboard> fetchDashTrending() {
  return [
    BookListDashboard(DummyImage.book1, 'The Crying Book', 1),
    BookListDashboard(DummyImage.book2, 'Hymns', 2),
    BookListDashboard(DummyImage.book3, 'Flutter Appretice', 3),
    BookListDashboard(DummyImage.book4, 'Huntrua', 4),
    BookListDashboard(DummyImage.book5, 'Gudnay', 5),
    BookListDashboard(DummyImage.book6, 'Hundrey Book', 6),
  ];
}

class BookListTrendingView extends StatelessWidget {
  const BookListTrendingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<BookListDashboard> book = fetchDashTrending();

    return ListView.builder(
        itemCount: book.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (content, index) {
          final books = book[index];
          return Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18.0,
            ),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  books.image,
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ]),
          );
        });
  }
}
