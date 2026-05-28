

import 'package:chatapp2/const/App_color.dart';
import 'package:flutter/material.dart';

class Custom_Text_field_widget extends StatelessWidget {
  const Custom_Text_field_widget({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: text,  
        hintStyle: TextStyle(color: AppColor.sco_color,fontSize: 20),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: AppColor.sco_color
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColor.sco_color
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColor.sco_color
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}