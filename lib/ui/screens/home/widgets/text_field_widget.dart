import 'package:contact/core/utils/app_colors.dart';
import 'package:contact/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_size_utils.dart';

typedef OnChanged = Function(String)?;
class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final OnChanged onChanged;
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.name,
      cursorColor: AppColors.beige,
      style: AppStyles.medium16BabyBlue,
      decoration: InputDecoration(
        enabledBorder: _buildDecorationBorder(),
        focusedBorder: _buildDecorationBorder(),
        hintText: hintText,
        hintStyle: AppStyles.medium16BabyBlue,
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
  OutlineInputBorder _buildDecorationBorder (){
    return  OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: AppColors.beige,
          width: 2
        )
    );
  }
}
