import 'package:flutter/material.dart';
import 'package:hlibrary/app_theme.dart';
import 'package:hlibrary/pages/forgot.passord_page/forgot.password_page.dart';
import 'package:hlibrary/splash_screen.dart';
import 'package:hlibrary/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: non_constant_identifier_names
    final AppThemeState = ref.watch(appThemeStateNotifier);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:
          AppThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
