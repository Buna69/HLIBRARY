import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hlibrary/global/common/add_data.dart';
import 'package:hlibrary/pages/app_pages/main_pages/home_page.dart';
import 'package:hlibrary/pages/app_pages/user_page/edit_profile_email.dart';
import 'package:hlibrary/pages/app_pages/user_page/edit_profile_username.dart';
import 'package:hlibrary/pages/app_pages/user_page/edit_profile_password.dart';
import 'package:hlibrary/pages/app_pages/user_page/user_page.dart';
import 'package:hlibrary/pages/app_pages/user_page/widgets/profile_menu_widget.dart';
import 'package:hlibrary/global/common/pick_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:hlibrary/global/common/add_data.dart';
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}
  


class _EditProfilePageState extends State<EditProfilePage> {
  Uint8List? _image;

void selectImage()async{
  Uint8List img = await pickImage(ImageSource.gallery);
  setState((){
    _image = img;
  });
}
void saveProfile()async {


}

final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
final email = FirebaseAuth.instance.currentUser?.email;
final username = FirebaseAuth.instance.currentUser?.displayName;
final TextEditingController _newNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(child:  Padding(
          padding: EdgeInsets.only(right: 55),
          child: Text('Edit Profile', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        )),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),      
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  if (_image != null) CircleAvatar(
                      radius: 65,
                      backgroundImage: MemoryImage(_image!),
                    ) else const CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage('assets/images/default.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 40, 
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFB800),
                        shape: BoxShape.circle, 
                      ),
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(LineAwesomeIcons.retro_camera),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              
              const SizedBox(height: 50),
              TextFormField(
                      controller: _newNameController,
                      onChanged: (value) {},
                      decoration:  InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        label: const Text("New Username"),
                        hintText: '$username',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      
                    ),
              const SizedBox(height: 10),
              ProfileMenuWidget(title: "Change Email", icon: Icons.email_outlined, onPress: () {
                Navigator.push(context, MaterialPageRoute(
              builder: (context) => const EditProfileEmailPage(),
              ),);
                         
              }),
              const SizedBox(height: 10),
              ProfileMenuWidget(title: "Change Password", icon: LineAwesomeIcons.lock, onPress: () {
                 Navigator.push(context, MaterialPageRoute(
              builder: (context) => const EditProfilePasswordPage(),
              ),);
              }),
              const SizedBox(height: 30,),
              SizedBox(
                    width: 200,
                    child: MaterialButton(
                                onPressed: saveProfile,
                                height: 50,
                                color: const Color(0xFFFFB800),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                  child: const Center(
                                    child: Text("Save Profile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                  ),
                                ),
                  ),
                  const SizedBox(height:230),
              Row(
                children: [
                  Text("$creationTime"),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: MaterialButton(
                                onPressed: () {
                                   
                                },
                                height: 50,
                                color: const Color.fromARGB(255, 255, 17, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                  child: const Center(
                                    child: Text("Delete", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                  ),
                                ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
