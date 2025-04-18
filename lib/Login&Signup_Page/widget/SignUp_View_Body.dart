import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/Login&Signup_Page/server/auth/dio_helper.dart';
import 'package:graduation_project/Login&Signup_Page/widget/Custom_Dropdown_Form_Field.dart';
import 'package:graduation_project/Login&Signup_Page/widget/custom_text_field.dart';
import 'package:graduation_project/Login&Signup_Page/widget/have_an_account_widget.dart';
import 'package:graduation_project/Login&Signup_Page/widget/pick_image_widget.dart';
import 'package:graduation_project/Login&Signup_Page/widget/terms_and_conditions.dart';
import 'package:graduation_project/core/widgets/CustomTextFormFieldPassword.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_check_box.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _selectedRole;
  bool _isChecked = false;
  File? _pickedImage;
  bool _isLoading = false;

  void _submitSignUp() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedRole == null) {
      _showSnackBar('Please select a role.', ContentType.warning);
      return;
    }

    if (!_isChecked) {
      _showSnackBar('Please agree to terms and conditions.', ContentType.warning);
      return;
    }

    if (_pickedImage == null) {
      _showSnackBar('Please pick an image.', ContentType.warning);
      return;
    }

    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await DioHelper.postDataWithImage(
        url: '/auth/signup',
        data: {
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
          'role': _selectedRole,
        },
        imageFile: _pickedImage!,
        imageFieldName: 'profilePicture',
      );

      if (response.statusCode == 201) {
        _showSnackBar('Account created successfully!', ContentType.success);
      } else {
        _showSnackBar(response.data['message'] ?? 'Registration failed.', ContentType.failure);
      }
    } catch (e) {
      _showSnackBar('Error: ${e.toString()}', ContentType.failure);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackBar(String message, ContentType contentType) {
    final snackBar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: AwesomeSnackbarContent(
        title: contentType == ContentType.success ? 'Success' : 'Oops!',
        message: message,
        contentType: contentType,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                PickImageWidget(
                  onImagePicked: (file) {
                    _pickedImage = file;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  controller: _nameController,
                  hintText: 'Full name',
                  textInputType: TextInputType.name,
                  suffixIcon: const Icon(Icons.person),
                  validator: (value) => value!.isEmpty ? 'Name required' : null,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: _emailController,
                  hintText: 'Email Address',
                  textInputType: TextInputType.emailAddress,
                  suffixIcon: const Icon(Icons.email),
                  validator: (value) => value!.isEmpty ? 'Email required' : null,
                ),
                const SizedBox(height: 16),
                CustomTextFormFieldPassowrd(
                  hintText: 'Password',
                  onSaved: (value) => _passwordController.text = value!,
                ),
                const SizedBox(height: 16),
                CustomDropdownButtonFormField(
                  onSaved: (value) => _selectedRole = value,
                  hintText: '  Select Role',
                  textInputType: TextInputType.text,
                  items: const [
                    DropdownMenuItem(value: 'teacher', child: Text('Teacher')),
                    DropdownMenuItem(value: 'student', child: Text('Student')),
                  ],
                  onChanged: (value) => _selectedRole = value,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CustomCheckBox(
                      isChecked: _isChecked,
                      onChecked: (value) {
                        setState(() {
                          _isChecked = value;
                        });
                      },
                      onSaved: (value) {
                        _isChecked = value ?? false;
                      },
                    ),
                    const SizedBox(width: 16),
                    TermsAndConditionsWidgetState(),
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(
                  onPressed: _submitSignUp,
                  text: 'Sign Up',
                ),
                const SizedBox(height: 26),
                HaveAnAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
