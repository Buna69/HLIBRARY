import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hlibrary/global/common/toast.dart';
import 'package:hlibrary/pages/login_page/login_page.dart';
class EditProfilePasswordPage extends StatefulWidget {
  const EditProfilePasswordPage({super.key});

  @override
  State<EditProfilePasswordPage> createState() => _EditProfilePasswordPageState();
}



bool _isObscure = true;
TextEditingController _newPasswordController = TextEditingController();
class _EditProfilePasswordPageState extends State<EditProfilePasswordPage> {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
var newPassword = "";

@override
void dispose(){
  _newPasswordController.dispose();
  super.dispose();
}

final currentUser = FirebaseAuth.instance.currentUser;
changePassword() async{
  try{
    await currentUser!.updatePassword(newPassword);  
    FirebaseAuth.instance.signOut();
   if (context.mounted){Navigator.push(context, MaterialPageRoute(
              builder: (context) => const LoginPage(),
              ),);}
  showToastMsg(message: "Password Changed, Please login again");
  }catch(e){
    showToastMsg(message: "Error occured, Please log out and try again");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 55),
            child: Text('Change Password', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
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
                      controller: _newPasswordController,
                      onChanged: (value) {},
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          child: Icon(
                            _isObscure ? Icons.visibility_off : Icons.visibility,
                            color: const Color(0xFFFFB800),
                          ),
                        ),
                        label: const Text("New Password"),
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
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
                              newPassword = _newPasswordController.text;
                            });
                            changePassword();
                          }
                        },
                        height: 50,
                        color: const Color(0xFFFFB800),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text("Confirm", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
