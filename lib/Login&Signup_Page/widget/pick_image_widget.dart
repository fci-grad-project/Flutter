import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatefulWidget {
  final Function(File?) onImagePicked; // ✅ callback علشان نرجع الصورة

  const PickImageWidget({
    super.key,
    required this.onImagePicked,
  });

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  File? _profilePic;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profilePic = File(pickedFile.path);
      });
      widget.onImagePicked(_profilePic); // ✅ استدعاء الـ callback
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: _profilePic == null
          ? CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Stack(
                children: [
                  Center(child: Image.asset('assets/images/student.png')),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff0c334b),
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : CircleAvatar(
              backgroundImage: FileImage(_profilePic!),
            ),
    );
  }
}
