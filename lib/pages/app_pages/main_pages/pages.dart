import 'package:flutter/material.dart';
import 'package:hlibrary/pages/app_pages/library_page/library_page.dart';
import 'package:hlibrary/pages/app_pages/main_pages/home_page.dart';
import 'package:hlibrary/pages/app_pages/main_pages/app_page.dart';
import 'package:hlibrary/pages/app_pages/search_page/widgets/search_bar_widget.dart';
import 'package:hlibrary/pages/app_pages/search_page/widgets/search_bar_with_animat.dart';
import 'package:hlibrary/pages/app_pages/user_page/user_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context); 
    
    
     return const Scaffold(
      body: HomeView(),);
  }

  @override
  bool get wantKeepAlive => true;
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> with AutomaticKeepAliveClientMixin {
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


class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context); 
    
    
    return const Scaffold(body:userPage());
  }

  @override
  bool get wantKeepAlive => true;
}


