import 'package:contact/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final bool isDelete;
  final VoidCallback onPressed;
  const ButtonWidget({
    super.key,
    this.isDelete = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 0),
        backgroundColor: isDelete ? AppColors.red : AppColors.beige,
        foregroundColor: isDelete ? AppColors.white : AppColors.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: isDelete ? BorderRadiusGeometry.circular(8) : BorderRadiusGeometry.circular(16),
        ),
        textStyle: isDelete ?
        TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        )
            : TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        alignment:Alignment.center,
        overlayColor: AppColors.transparent,
        padding: isDelete ? EdgeInsets.all(8) : EdgeInsetsGeometry.all(16),
      ),
      child: isDelete ?
          Row(
            spacing: 6,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete),
              Text(
                  "Delete"
              )
            ],
          )
      : Text(
        "Enter user"
      ),
    );
  }
}
