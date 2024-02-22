import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());

class AppThemeState extends ChangeNotifier {
  bool _isDarkModeEnabled = false;

  // Getter to retrieve the current theme mode
  bool get isDarkModeEnabled => _isDarkModeEnabled;

  // Step 2: Implement methods to toggle the theme mode
  void toggleTheme() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    // Step 3: Update stored preference when the theme mode changes
    // Code to update stored preference goes here (e.g., using shared preferences)
    notifyListeners();
  }
  static of(BuildContext context) {}
}
