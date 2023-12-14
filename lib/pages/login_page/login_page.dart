import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hlibrary/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:hlibrary/pages/forgot_passord_page/forgot_password_page.dart';
import 'package:hlibrary/pages/app_pages/app_page.dart';
import 'package:hlibrary/pages/sign_up_page/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isSigning = false ;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  final bool _passwordError = false;
  bool _isObscure = true;
  
   @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
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
                    Text("Login", style: TextStyle(color: Colors.white, fontSize: 40)),
                    SizedBox(height: 10),
                    Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
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
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    controller: _emailController,
                                    
                                    onChanged: (value) {
                                     
                                    },
                                    decoration: const InputDecoration(
                                      hintText: "Email",
                                      prefixIcon: Icon(Icons.email_outlined),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.background)),
                                  ),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    
                                    onChanged: (value) {
                                   
                                    },
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
                                      hintText: "Password",
                                      hintStyle: const TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                if (_passwordError)
                                  const Padding(
                                    padding: EdgeInsets.only(left: 30, bottom: 3, top: -1),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Incorrect password. Please try again.',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignUpPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 162, 0)),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const ForgotPasswordPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 162, 0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          MaterialButton(
                            onPressed: _signIn,
                            height: 50,
                            color: const Color(0xFFFFB800),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child:  Center(
                              child: _isSigning ? const CircularProgressIndicator(color: Color.fromARGB(255, 0, 0, 0)):
                              const Text("Sign In", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

void _signIn() async {

    setState(() {
      _isSigning =true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning =false;
    });


    if (user != null){
      debugPrint("Signed In");
      if (mounted) {
      Navigator.push(context, MaterialPageRoute(
              builder: (context) => const AppMain(),
              ),);
      }
    }else {
       debugPrint("some error occured"); 
    }

  }


}
