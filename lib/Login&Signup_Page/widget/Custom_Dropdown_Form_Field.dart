import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  const CustomDropdownButtonFormField({
    super.key,
    required this.hintText,
    required this.items,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.initialValue,
    required TextInputType textInputType,
  });

  final String hintText;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? initialValue;

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
    return DropdownButtonFormField<String>(
      value: initialValue,
      items: items,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
      decoration: InputDecoration(
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
