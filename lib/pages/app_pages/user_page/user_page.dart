import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hlibrary/pages/login_page/login_page.dart';
import 'package:hlibrary/pages/app_pages/user_page/edit_profile.dart';
import 'package:hlibrary/pages/app_pages/user_page/widgets/profile_menu_widget.dart';
import 'package:hlibrary/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class userPage extends StatefulWidget {
  const userPage({super.key});

  @override
  State<userPage> createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  final FirebaseAuth _auth =FirebaseAuth.instance;
  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          
          padding: const EdgeInsets.all(30),
          child:  Column(
            children: [
              const  DarkModeSwitch(),  
              const SizedBox(height: 10,),
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage('assets/images/logo.png'))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color(0xFFFFB800)),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Nickname", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              const Text("Email@email.com", style: TextStyle(fontSize: 17,)),
              const SizedBox(height: 20),


              SizedBox(
                width: 200,
                child: MaterialButton(
                            onPressed: () {
                               Navigator.push(context, MaterialPageRoute(
              builder: (context) => const EditProfilePage(),
              ),);
                            },
                            height: 50,
                            color: const Color(0xFFFFB800),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                              child: const Center(
                                child: Text("Edit Profile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                              ),
                            ),
              ),
              const SizedBox(height: 35),
              const Divider(),
              const SizedBox(height: 10),


              ProfileMenuWidget(title: "Download History", icon: LineAwesomeIcons.download, onPress: () {}),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(title: "About", icon: LineAwesomeIcons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {                   
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>const LoginPage()));
                    
                  }),
            ],
          ),
        ),
      ),
    );   
  }
}
//dark theme toggle
class DarkModeSwitch extends HookConsumerWidget {
  const DarkModeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final appThemeState = ref.watch(appThemeStateNotifier);

  return ToggleButtons(
    isSelected: [!appThemeState.isDarkModeEnabled, appThemeState.isDarkModeEnabled],
    onPressed: (int index) {
      if (index == 0) {
        appThemeState.setLightTheme();
      } else {
        appThemeState.setDarkTheme();
      }
    },
    children: const [
      Icon(Icons.wb_sunny),
      Icon(Icons.nightlight_round),
    ],
  );
}

}