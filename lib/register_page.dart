// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:tasks/login_page.dart';
import 'package:tasks/text_from_field_widget.dart';
import 'elevated_button_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isVisible = true;
  void passwordStatus() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipPath(
                clipper: WaveClipperTwo(flip: true),
                child: Container(
                  height: 250,
                  color: Colors.deepPurple,
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 3),
                child: TextFromFieldWidget(
                  label: 'Name \nMuhammad Khalf',
                  prefixIcon: Icons.person_2_outlined,
                  obscureText: false,
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 3),
                  child: TextFromFieldWidget(
                    label: 'Phone \n00201013168855',
                    prefixIcon: Icons.phone_android_outlined,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                  )),
              const Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 3),
                child: TextFromFieldWidget(
                  label: 'Email \ntest@gmail.com',
                  prefixIcon: Icons.email_outlined,
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 2, bottom: 3),
                child: TextFromFieldWidget(
                    obscureText: isVisible,
                    label: 'Password \n********',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: IconButton(
                        icon: Icon(isVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        color: Colors.deepPurple,
                        onPressed: passwordStatus)),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 3, bottom: 30),
                  child: TextFromFieldWidget(
                      obscureText: isVisible,
                      label: 'Confirm Password \n********',
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: IconButton(
                          icon: Icon(isVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: Colors.deepPurple,
                          onPressed: passwordStatus))),
              ElevatedbuttonWidget(
                backgroundColor: Colors.deepPurple,
                name: 'Register',
                textColor: Colors.white,
                onPressed: () {},
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              ElevatedbuttonWidget(
                backgroundColor: Colors.white,
                name: 'Log In',
                textColor: Colors.deepPurple,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
