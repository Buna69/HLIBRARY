import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hlibrary/pages/app_pages/user_page/edit_profile.dart';
import 'package:hlibrary/pages/login_page/login_page.dart';
import 'package:hlibrary/pages/app_pages/user_page/edit_profile_email.dart';
import 'package:hlibrary/pages/app_pages/user_page/widgets/profile_menu_widget.dart';
import 'package:hlibrary/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}
final currentUser = FirebaseAuth.instance.currentUser;
final email =currentUser!.email;
final username =currentUser!.displayName;
class _UserPageState extends State<UserPage> {

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
              SizedBox(
                width: 130,
                height: 130,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage('assets/images/default.png'))),
              ),
              const SizedBox(height: 10),
               if (username == null)
                Text('$email', style: const TextStyle(fontSize: 17,))
              else
                Text('$username', style: const TextStyle(fontSize: 17,)),
              const SizedBox(height: 10),
               Text('$email', style: const TextStyle(fontSize: 17,)),
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
        appThemeState.toggleTheme(); // Step 2: Toggle the theme mode
      },
      children: const [
        Icon(Icons.wb_sunny),
        Icon(Icons.nightlight_round),
      ],
    );
  }
}
