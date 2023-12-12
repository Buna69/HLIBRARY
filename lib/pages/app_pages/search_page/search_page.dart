import 'package:flutter/material.dart';
import 'package:hlibrary/pages/app_pages/search_page/widgets/search_bar_widget.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SearchTextField(),
      ),
      body: const Center(
        child: Text('Your page content goes here'),
      ),
    );
  }
}
