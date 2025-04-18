import 'package:flutter/material.dart';
import 'package:graduation_project/Login&Signup_Page/widget/custom_text_field.dart';

class CustomTextFormFieldPassowrd extends StatefulWidget {
  const CustomTextFormFieldPassowrd({
    required this.hintText,
    this.onSaved,
    super.key,
  });

  final String hintText;
  final void Function(String?)? onSaved;

  @override
  State<CustomTextFormFieldPassowrd> createState() => _CustomTextFormFieldPassowrdState();
}

class _CustomTextFormFieldPassowrdState extends State<CustomTextFormFieldPassowrd> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      hintText: widget.hintText,
      textInputType: TextInputType.text,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
      ),
    );
  }
}