import 'package:flutter/material.dart';

import 'package:hlibrary/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopBarWithSearch extends StatefulWidget implements PreferredSizeWidget {
  const TopBarWithSearch({Key? key}) : super(key: key);

  @override
  State<TopBarWithSearch> createState() => _TopBarWithSearchState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TopBarWithSearchState extends State<TopBarWithSearch> {
  final TextEditingController _searchController = TextEditingController();
  bool _showClearButton = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _buildSearchBar(),
      actions: const [
        DarkModeSwitch(),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _showClearButton = value.isNotEmpty;
              });
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              hintText: 'Search by Title, Author or Genre',
              suffixIcon: _showClearButton
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          _showClearButton = false;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

class DarkModeSwitch extends HookConsumerWidget {
  const DarkModeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return IconButton(
      icon: appThemeState.isDarkModeEnabled
          ? const Icon(Icons.nightlight_round)
          : const Icon(Icons.wb_sunny),
      onPressed: () {
        if (appThemeState.isDarkModeEnabled) {
          appThemeState.setLightTheme();
        } else {
          appThemeState.setDarkTheme();
        }
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TopBarWithSearch _topBarWithSearch; // Create a single instance

  @override
  void initState() {
    super.initState();
    _topBarWithSearch = const TopBarWithSearch(); // Initialize the instance
  }

  final List<Widget?> _pages = [
    null, // Placeholder for Container, replace with your actual widgets
    Container(
      color: Colors.amberAccent,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Ensure _currentIndex is within bounds
    if (_currentIndex < 0 || _currentIndex >= _pages.length) {
      throw RangeError('Invalid _currentIndex value: $_currentIndex');
    }

    return Scaffold(
      appBar: _currentIndex == 0 ? _topBarWithSearch : null,
      body: _pages[_currentIndex] ?? Container(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFFFB800),
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
