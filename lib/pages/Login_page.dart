
import 'package:chatapp2/const/App_color.dart';
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
            CustomButtom()
          ],
        ),
      ),
    );
  }
}
