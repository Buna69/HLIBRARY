import 'package:flutter/material.dart';
import 'package:hlibrary/pages/main_pages/main_page/widgets/search_bar.dart';
class SearchBarWithClearButton extends StatefulWidget implements PreferredSizeWidget {

  const SearchBarWithClearButton({super.key});

  @override
  _SearchBarWithClearButtonState createState() =>
      _SearchBarWithClearButtonState();
       @override
  Size get preferredSize =>  const Size.fromHeight(kToolbarHeight);
}

class _SearchBarWithClearButtonState extends State<SearchBarWithClearButton> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _showClearButton = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      onChanged: (value) {
        setState(() {
          _showClearButton = value.isNotEmpty;
        });
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _showClearButton
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _textEditingController.clear();
                    _showClearButton = false;
                  });
                },
              )
            : null,
        hintText: 'Search',
        border: const OutlineInputBorder(),
      ),
    );
  }
}