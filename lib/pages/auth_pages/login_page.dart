import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:tasks/pages/auth_pages/register_page.dart';
import 'package:tasks/widgets/text_from_field_widget.dart';
import '../../widgets/elevated_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipPath(
                  clipper: WaveClipperTwo(flip: true),
                  child: Container(
                    height: 320,
                    color: Colors.deepPurple,
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFromFieldWidget(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Epmty Email';
                      } else {
                        return null;
                      }
                    },
                    label: 'Email \ntest@gmail.com',
                    prefixIcon: Icons.email_outlined,
                    obscureText: false,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFromFieldWidget(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Epmty Password';
                        } else {
                          return null;
                        }
                      },
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                ElevatedbuttonWidget(
                  backgroundColor: Colors.deepPurple,
                  name: 'Log In',
                  textColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const HomePage()));
                    }
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                ElevatedbuttonWidget(
                  backgroundColor: Colors.white,
                  name: 'Register',
                  textColor: Colors.deepPurple,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
