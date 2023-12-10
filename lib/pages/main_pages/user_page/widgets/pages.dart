import 'package:flutter/material.dart';
import 'package:hlibrary/pages/main_pages/main_page/widgets/search_bar.dart';
import 'package:hlibrary/pages/main_pages/user_page/user_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearchBarWithClearButton(),
      body: Center(
        child: Text(
          'First Page',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Second Page',style: TextStyle(fontSize: 50.0),),),);
  }
}

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return const Scaffold(body: userPage());
  }
}

