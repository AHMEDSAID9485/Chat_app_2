import 'package:chatapp2/Method/method.dart';
import 'package:chatapp2/const/App_color.dart';
import 'package:chatapp2/pages/Register_page.dart';
import 'package:chatapp2/widgets/CustomButtom.dart';
import 'package:chatapp2/widgets/Custom_Text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.prim_color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/scholar.png'),
                  Text(
                    'Scholar Chat',
                    style: TextStyle(color: AppColor.sco_color, fontSize: 28),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: AppColor.sco_color,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Custom_Text_field_widget(
                    autofillHints: const [AutofillHints.email],
                    text: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this field can't be empty";
                      }
                      var reg = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      );

                      if (!reg.hasMatch(value)) {
                        return "valid_message";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  SizedBox(height: 5),
                  Custom_Text_field_widget(
                    text: 'password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this field can't be empty";
                      }
                      return null;
                    },
                    isPassword: true,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 10),
                  CustomButtom(
                    text: 'Sign In',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          await login_method(
                            emailController.text,
                            passwordController.text,
                          );

                          // رسالة النجاح داخل الـ try
                          show_snackbar(context, 'Login successful!');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            show_snackbar(
                              context,
                              'No user found for that email.',
                              isError: true,
                            );
                          } else if (e.code == 'wrong-password') {
                            show_snackbar(
                              context,
                              'Wrong password provided for that user.',
                              isError: true,
                            );
                          }
                          // الخطأ الخاص بالتحديثات الجديدة لفايربيز
                          else if (e.code == 'invalid-credential') {
                            show_snackbar(
                              context,
                              'Invalid email or password.',
                              isError: true,
                            );
                          } else {
                            show_snackbar(
                              context,
                              'Error: ${e.message}',
                              isError: true,
                            );
                          }
                        } catch (e) {
                          // التقاط الأخطاء العامة
                          show_snackbar(
                            context,
                            'Login failed: ${e.toString()}',
                            isError: true,
                          );
                        }
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: AppColor.sco_color,
                          fontSize: 15,
                        ),
                      ),

                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        ),
                        child: Text(
                          ' Register',
                          style: TextStyle(
                            color: AppColor.third_color,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
