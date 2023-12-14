import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hlibrary/global/common/toast.dart';
import 'package:hlibrary/pages/app_pages/app_page.dart';
import 'package:hlibrary/pages/app_pages/user_page/user_page.dart';
import 'package:hlibrary/pages/login_page/login_page.dart';

class EditProfileUsernamePage extends StatefulWidget {
  const EditProfileUsernamePage({super.key});

  @override
  State<EditProfileUsernamePage> createState() => _EditProfileUsernamePageState();
}

class _EditProfileUsernamePageState extends State<EditProfileUsernamePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newNameController = TextEditingController();
  final username =FirebaseAuth.instance.currentUser!.displayName;
  var newName = "";

  @override
  void dispose() {
    _newNameController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  changeUsername() async {
    try {
      await currentUser!.updateDisplayName(newName);      
       if (context.mounted){ Navigator.pop(context);}
      showToastMsg(message: "Username Changed.");
    } catch (e) {
      showToastMsg(message: "Error occurred, Please log out and try again");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Username',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
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
              const SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            setState(() {
                              newName = _newNameController.text;
                            
                            changeUsername();});
                          }
                          setState(() {username;});
                        },
                        height: 50,
                        color: const Color(0xFFFFB800),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            "Confirm",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
