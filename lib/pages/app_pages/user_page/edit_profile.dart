import 'package:flutter/material.dart';
import 'package:hlibrary/pages/app_pages/user_page/user_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

bool _isObscure = true;
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(child:  Padding(
          padding: EdgeInsets.only(right: 55),
          child: Text('EditProfile', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage('assets/images/logo.png')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xFFFFB800),
                      ),
                      child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Nickname'),
                        prefixIcon: Icon(LineAwesomeIcons.user),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _emailController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email_outlined),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        label: const Text("Password"),
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 50),

                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: MaterialButton(
                            onPressed: () {
                               Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const userPage(),
                                ),);
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
