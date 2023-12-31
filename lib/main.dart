import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hlibrary/app_theme.dart';
import 'package:hlibrary/pages/app_pages/app_page.dart';
import 'package:hlibrary/pages/app_pages/main_pages/home_page.dart';
import 'package:hlibrary/pages/app_pages/user_page/edit_profile.dart';
import 'package:hlibrary/pages/app_pages/user_page/user_page.dart';
import 'package:hlibrary/pages/login_page/login_page.dart';
import 'package:hlibrary/splash_screen.dart';
import 'package:hlibrary/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
   await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
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
