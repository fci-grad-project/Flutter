import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Login&Signup_Page/widget/Custom_Dropdown_Form_Field.dart';
import 'package:graduation_project/Login&Signup_Page/widget/pick_image_widget.dart';
import 'package:graduation_project/core/widgets/CustomTextFormFieldPassword.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_check_box.dart';
import 'package:graduation_project/Login&Signup_Page/widget/custom_text_field.dart';
import 'package:graduation_project/Login&Signup_Page/widget/have_an_account_widget.dart';
import 'package:graduation_project/Login&Signup_Page/widget/terms_and_conditions.dart';
import 'package:graduation_project/features/cubits/cubit/sign_up_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  // متغير لتخزين حالة الـ CheckBox
  bool isCheckBoxChecked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  // متغير لتخزين نوع المستخدم
  late String? selectedRole;
  late String? _email;
  late String? _password;
  late String? _name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              PickImageWidget(),
              const SizedBox(height: 30),
              CustomTextFormField(
                onSaved: (value) => _name = value,
                hintText: 'Full name',
                textInputType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) => _email = value,
                hintText: 'Email Address',
                textInputType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldPassowrd(
                onSaved: (value) => _password = value,
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
                  setState(() {
                    selectedRole = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  // CustomCheckBox مع التحديث
                  CustomCheckBox(
                    // onSaved: (value) => _isTermsAccepted = value,
                    isChecked: isCheckBoxChecked,
                    onChecked: (value) {
                      setState(() {
                        isCheckBoxChecked = value; // تحديث حالة الـ CheckBox
                      });
                    },
                    onSaved: (value) {},
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
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<SignUpCubit>().createUserWithEmailAndPassword(
                        _email!, _password!, _name!, selectedRole!);
                    // استخدم selectedRole هنا للوصول إلى القيمة المحددة
                    print('Selected Role: $selectedRole');
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
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
