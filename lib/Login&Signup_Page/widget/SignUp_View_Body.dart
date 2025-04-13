import 'package:flutter/material.dart';
import 'package:graduation_project/Login&Signup_Page/widget/Custom_Dropdown_Form_Field.dart';
import 'package:graduation_project/Login&Signup_Page/widget/pick_image_widget.dart';
import 'package:graduation_project/core/widgets/CustomTextFormFieldPassword.dart';
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


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              PickImageWidget(),
              const SizedBox(height: 30),
              CustomTextFormField(
                hintText: 'Full name',
                textInputType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Email Address',
                textInputType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldPassowrd(
                hintText: 'Password',
              ),
              const SizedBox(height: 16),
              // Dropdown لاختيار نوع المستخدم
              CustomDropdownButtonFormField(
                onSaved: (value) {
                  print(' Selected Role: $value');
                },
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
                  print(' Selected Role: $value');
              
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CustomCheckBox(
                    
                    onChecked: (value) {
              
                    },
                    onSaved: (value) {}, 
                    isChecked: false,
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
                  
                },
                text: 'Sign Up',
              ),
              const SizedBox(height: 26),
              HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}