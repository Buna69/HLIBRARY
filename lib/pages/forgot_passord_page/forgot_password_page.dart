import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hlibrary/pages/login_page/login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool emailSent = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      setState(() {
        emailSent = true;
      });

      
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Color(0xFFFFB800), Color.fromARGB(255, 172, 120, 0)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 80),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Forgot \nPassword", style: TextStyle(color: Colors.white, fontSize: 40)),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 47, 47, 47),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  )
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.background)),
                                    ),
                                    child: TextFormField(
                                      controller: _emailController,
                                      decoration: const InputDecoration(
                                        hintText: "Email",
                                        prefixIcon: Icon(Icons.email_outlined),
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      validator: (email) =>
                                      email != null && !EmailValidator.validate(email)
                                          ? 'Enter Valid Email'
                                          : null,
                                    ),
                                  ),
                                  Visibility(
                                    visible: emailSent,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Email has been sent',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 60),
                            MaterialButton(
                              onPressed: () {
                                passwordReset();
                              },
                              height: 50,
                              color: const Color(0xFFFFB800),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
                                child: Text("Recover Password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,               
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),              
            ),

          ],
        ),
      ),
    );
  }
}
