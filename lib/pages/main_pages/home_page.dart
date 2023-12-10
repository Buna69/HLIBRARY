import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hlibrary/pages/main_pages/user_page/widgets/pages.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isStatusBarVisible = false;
  int _selectedItem = 0;
  final _pages = [FirstPage(), SecondPage(), ThirdPage()];
  final _pageController = PageController();
  Color? textColor;

  @override
  void initState() {
    super.initState();
    hideStatusBar();
  }

  void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: [
   
      SystemUiOverlay.top,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    setState(() {
      _isStatusBarVisible = false;
    });
  }

  void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    setState(() {
      _isStatusBarVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isStatusBarVisible) {
          hideStatusBar();
        } else {
          showStatusBar();
        }
      },
      child: Scaffold(
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              _selectedItem = index;
            });
          },
          controller: _pageController,
          children: _pages,
        ),
        bottomNavigationBar: SalomonBottomBar(
          items:  <SalomonBottomBarItem>[
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_outlined,size: 30,),
              title:  Text('Home',style:  Theme.of(context).textTheme.titleMedium?.apply(color: textColor)),
              selectedColor: Colors.amber,
              
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.menu_book_outlined,size: 30,),
              title: Text('Library',style:  Theme.of(context).textTheme.titleMedium?.apply(color: textColor)),
              selectedColor: Colors.amber,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person,size: 30,),
              title:  Text('User',style:  Theme.of(context).textTheme.titleMedium?.apply(color: textColor)),
              selectedColor: Colors.amber,
            )
          ],
          currentIndex: _selectedItem,
          onTap: (index) {
            setState(() {
              _selectedItem = index;
              _pageController.animateToPage(
                _selectedItem,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
              );
            });
          },
        ),
      ),
    );
  }
}
