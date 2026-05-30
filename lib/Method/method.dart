  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> Register_method(String email, String password) async {
         UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
  }
  Future<void> login_method(String email, String password) async {
     UserCredential userCredential = await FirebaseAuth
        .instance
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        );
  }
  // void show_snackbar(BuildContext context,String text) {
  //    ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text(text)),
  //   );
  // }


void show_snackbar(BuildContext context, String text, {bool isError = false}) {
  // إخفاء أي SnackBar مفتوح حالياً قبل عرض الجديد
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      // محتوى السناك بار (أيقونة + نص)
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      // لون الخلفية بناءً على نوع الرسالة (خطأ أو نجاح)
      backgroundColor: isError ? Colors.redAccent : const Color(0xFF323232),
      
      // جعل السناك بار عائماً
      behavior: SnackBarBehavior.floating,
      
      // إضافة حواف دائرية
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      
      // تحديد الهوامش لإبعاده عن حواف الشاشة
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      
      // ظل السناك بار
      elevation: 6,
      
      // مدة العرض
      duration: const Duration(seconds: 3),
      
      // زر إجراء (اختياري)
      action: SnackBarAction(
        label: 'حسناً',
        textColor: isError ? Colors.white : Colors.tealAccent,
        onPressed: () {
          // يمكن إضافة أي إجراء هنا
        },
      ),
    ),
  );
}
