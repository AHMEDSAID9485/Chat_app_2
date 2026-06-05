import 'package:chatapp2/Method/method.dart';
import 'package:chatapp2/const/App_color.dart';
import 'package:chatapp2/pages/Login_page.dart';
import 'package:chatapp2/pages/chat_page.dart';
import 'package:chatapp2/widgets/CustomButtom.dart';
import 'package:chatapp2/widgets/Custom_Text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showSpinner = false;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
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
                          'Sign Up',
                          style: TextStyle(
                            color: AppColor.sco_color,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Custom_Text_field_widget(
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
                      autofillHints: const [AutofillHints.email],
                      text: 'Email',
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
                    ),
                    SizedBox(height: 10),
                    CustomButtom(
                      text: 'Register',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            // 1. محاولة إنشاء الحساب
                            await Register_method(
                              emailController.text,
                              passwordController.text,
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            // 3. التقاط أخطاء فايربيز الخاصة بالتسجيل
                            if (e.code == 'weak-password') {
                              show_snackbar(
                                context,
                                'The password provided is too weak.',
                                isError: true,
                              );
                            } else if (e.code == 'email-already-in-use') {
                              show_snackbar(
                                context,
                                'The account already exists for that email.',
                                isError: true,
                              );
                            } else {
                              // لالتقاط أي خطأ آخر من فايربيز
                              show_snackbar(
                                context,
                                'Error: ${e.message}',
                                isError: true,
                              );
                            }
                          } catch (e) {
                            // 4. التقاط الأخطاء العامة غير المتوقعة
                            show_snackbar(
                              context,
                              'Registration failed: ${e.toString()}',
                              isError: true,
                            );
                          }
                        }
                        setState(() {
                        showSpinner = false;
                      });
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: AppColor.sco_color,
                            fontSize: 15,
                          ),
                        ),

                        GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          ),
                          child: Text(
                            ' Sign In',
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
      ),
    );
  }
}
