import 'package:flutter/material.dart';
import 'package:hlibrary/pages/main_pages/widgets/bot_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: MainPage(),
    );
  }
}
