import 'package:flutter/material.dart';
import 'package:graduation_project/Login&Signup_Page/widget/Custom_Dropdown_Form_Field.dart';
import 'package:graduation_project/Login&Signup_Page/widget/pick_image_widget.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_check_box.dart';
import 'package:graduation_project/Login&Signup_Page/widget/custom_text_field.dart';
import 'package:graduation_project/Login&Signup_Page/widget/have_an_account_widget.dart';
import 'package:graduation_project/Login&Signup_Page/widget/terms_and_conditions.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  // متغير لتخزين حالة الـ CheckBox
  bool isCheckBoxChecked = false;

  // متغير لتخزين نوع المستخدم
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            PickImageWidget(),
            const SizedBox(height: 30),
            CustomTextFormField(
              hintText: 'Full name',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Email Address',
              textInputType: TextInputType.emailAddress,
              suffixIcon: const Icon(Icons.email),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Password',
              textInputType: TextInputType.text,
              suffixIcon: const Icon(Icons.remove_red_eye_outlined),
            ),
            const SizedBox(height: 16),
            // Dropdown لاختيار نوع المستخدم
            CustomDropdownButtonFormField(
              hintText: '  Select Role',
              textInputType: TextInputType.text,
              

              items: const [
                DropdownMenuItem(
                  value: 'teacher',
                  child: Text('Teacher'),
                ),
                DropdownMenuItem(
                  value: 'student',
                  child: Text('Student'),
                ),
              ],
              onChanged: (value) {
                print('تم اختيار: $value');
                setState(() {
                  selectedRole = value;
                });
              },
              onSaved: (value) {
                print('القيمة المحفوظة: $value');
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                // CustomCheckBox مع التحديث
                CustomCheckBox(
                  isChecked: isCheckBoxChecked,
                  onChecked: (value) {
                    setState(() {
                      isCheckBoxChecked = value; // تحديث حالة الـ CheckBox
                    });
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                TermsAndConditionsWidgetState(),
              ],
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {
                if (selectedRole == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select a role'),
                    ),
                  );
                } else {
                  // أكشن عند الضغط على الزر (مثلاً إرسال البيانات)
                  print('Role: $selectedRole');
                }
              },
              text: 'Sign Up',
            ),
            const SizedBox(height: 26),
            HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
  }
