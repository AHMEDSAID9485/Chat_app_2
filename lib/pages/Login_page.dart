
import 'package:chatapp2/const/App_color.dart';
import 'package:chatapp2/pages/Register_page.dart';
import 'package:chatapp2/widgets/CustomButtom.dart';
import 'package:chatapp2/widgets/Custom_Text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.prim_color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/scholar.png'),
                Text('Scholar Chat',style: TextStyle(color: AppColor.sco_color,fontSize: 28),),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Sign In',style: TextStyle(color: AppColor.sco_color,fontSize: 20),),
                  ],
                ),
                SizedBox(height: 5,),
                Custom_Text_field_widget(text: 'Email',),
                SizedBox(height: 5,),
                Custom_Text_field_widget(text: 'password',),
                SizedBox(height: 10,),
                CustomButtom(text: 'Sign In',),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?',style: TextStyle(color: AppColor.sco_color,fontSize: 15),),
            
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterPage())),
                      child: Text(' Register',style: TextStyle(color: AppColor.third_color,fontSize: 15,fontWeight: FontWeight.bold),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
