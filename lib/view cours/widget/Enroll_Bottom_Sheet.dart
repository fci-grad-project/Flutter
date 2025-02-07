import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';
import 'package:graduation_project/view%20cours/widget/Custom_Icon_Button.dart';

class EnrollBottomSheet extends StatefulWidget {
  EnrollBottomSheet({super.key, required this.title});
  final String title;
  @override
  _EnrollBottomSheetState createState() => _EnrollBottomSheetState();
}

class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Row(
        children: [
          CustomIconButton(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            height: 45,
            width: 45,
            child: FaIcon(
              FontAwesomeIcons.heartCircleCheck,
              color: isFavorite ? Colors.red : Colors.grey,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: CustomIconButton(
              onTap: () {},
              color: AppColors.primaryColor,
              height: 45,
              width: 45,
              child: Text(
                widget.title,
                style: TextStyles.bold16.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
