
import 'package:chatapp2/const/App_color.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.text
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.sco_color
      ),
      child: Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
    );
  }
}
