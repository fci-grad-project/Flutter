import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller, // ✅ إضافة الـ controller هنا
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.validator, // ✅ إضافة validator حتى يتمكن المستخدم من تمريره
    this.obscureText = false,
  });

  final TextEditingController? controller; // ✅ تعريف المتغير
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator; // ✅ تعريف validator بشكل مرن
  final bool obscureText;

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // ✅ استخدام الـ controller هنا
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator, // ✅ استخدام validator إذا تم تمريره
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.semiBold16.copyWith(
          color: const Color(0xFF949D9E),
        ),
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: _buildBorder(const Color(0xFFE6E9E9)), // اللون الافتراضي
        enabledBorder: _buildBorder(const Color(0xFFE6E9E9)), // عند عدم التركيز
        focusedBorder: _buildBorder(const Color(0xFF0c334b)), // اللون الأخضر عند التركيز
      ),
    );
  }
}
