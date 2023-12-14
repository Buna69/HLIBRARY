import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hlibrary/global/common/toast.dart';
import 'package:hlibrary/pages/login_page/login_page.dart';

class EditProfileEmailPage extends StatefulWidget {
  const EditProfileEmailPage({super.key});

  @override
  State<EditProfileEmailPage> createState() => _EditProfileEmailPageState();
}

class _EditProfileEmailPageState extends State<EditProfileEmailPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newEmailController = TextEditingController();
  final email =FirebaseAuth.instance.currentUser!.email;
  var newEmail = "";

  @override
  void dispose() {
    _newEmailController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  changeEmail() async {
    try {
      await currentUser!.updateEmail(newEmail);
      
    
       
      showToastMsg(message: "Email Changed, Please login again");
    } catch (e) {
      showToastMsg(message: "Error occurred, Please log out and try again");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Email',
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
                    TextFormField(
                      controller: _newEmailController,
                      onChanged: (value) {},
                      decoration:  InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        label: const Text("New Email"),
                        hintText: '$email',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            setState(() {
                              newEmail = _newEmailController.text;
                            });
                            changeEmail();
                          }
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
