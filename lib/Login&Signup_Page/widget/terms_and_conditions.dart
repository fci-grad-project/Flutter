import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';

class TermsAndConditionsWidgetState extends StatelessWidget {
  const TermsAndConditionsWidgetState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'By creating an account, you agree to',
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF949D9E),
              ),
            ),
            const TextSpan(
              text: ' ',
              style: TextStyles.semiBold13,
            ),
            TextSpan(
              text: 'Terms and Conditions',
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
      
          ],
        ),
        // textAlign: TextAlign.right,
      ),
    );
  }
}