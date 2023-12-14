import 'package:flutter/material.dart';
import 'package:hlibrary/pages/app_pages/library_page/library_page.dart';
import 'package:hlibrary/pages/app_pages/main_pages/home_page.dart';
import 'package:hlibrary/pages/app_pages/search_page/widgets/search_bar_with_animat.dart';
import 'package:hlibrary/pages/app_pages/user_page/user_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context); 
    
    
     return const Scaffold(
      body: HomePage(),);
  }

  @override
  bool get wantKeepAlive => true;
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context); 
    
    
   return  Scaffold(
    appBar: const SearchBarWithClearButton(),
    body: BookGrid(),);
  }

  @override
  bool get wantKeepAlive => true;
}


class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context); 
    
    
    return const Scaffold(body:UserPage());
  }

  @override
  bool get wantKeepAlive => true;
}


