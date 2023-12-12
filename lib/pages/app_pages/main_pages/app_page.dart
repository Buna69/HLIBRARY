  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:hlibrary/pages/app_pages/main_pages/pages.dart';
  import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
  class AppMain extends StatefulWidget {
    const AppMain({Key? key}) : super(key: key);

    @override
    _AppMainState createState() => _AppMainState();
  }

 class _AppMainState extends State<AppMain> {
  bool _isStatusBarVisible = false;
  int _selectedItem = 0;
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
          children: const [
            FirstPage(key: PageStorageKey('FirstPage')),
            ThirdPage(key: PageStorageKey('ThirdPage')),
            FourthPage(key: PageStorageKey('FourthPage')),
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          backgroundColor: Theme.of(context).canvasColor,
          items: <SalomonBottomBarItem>[
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_outlined, size: 30),
              title: Text('Home', style: Theme.of(context).textTheme.titleMedium?.apply(color: textColor)),
              selectedColor: const Color(0xFFFFB800),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.menu_book_outlined, size: 30),
              title: Text('Library', style: Theme.of(context).textTheme.titleMedium?.apply(color: textColor)),
              selectedColor: const Color(0xFFFFB800),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person, size: 30),
              title: Text('User', style: Theme.of(context).textTheme.titleMedium?.apply(color: textColor)),
              selectedColor: const Color(0xFFFFB800),
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
