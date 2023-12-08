import 'package:flutter/material.dart';
import 'package:hlibrary/pages/forgot.passord_page/new.password_page.dart';
import 'package:hlibrary/pages/forgot.passord_page/otp_form.dart';

class ForgotPassword2Page extends StatefulWidget {
  const ForgotPassword2Page({Key? key}) : super(key: key);

  @override
  State<ForgotPassword2Page> createState() => _ForgotPassword2PageState();
}

class _ForgotPassword2PageState extends State<ForgotPassword2Page> {
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
                          
                        ),
                        const OtpForm(),
                        const SizedBox(height: 100),
                        MaterialButton(
                          onPressed: () {},
                          height: 50,
                          color: const Color(0xFFFFB800),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NewPasswordPage(),
                                ),
                              );
                            },
                            child: const Center(
                              child: Text("Recover Password", style: TextStyle(fontSize: 18, fontWeight:FontWeight.w600)),
                            ),
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
      ),
    );
  }
}
