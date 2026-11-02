import 'package:contact/core/utils/app_assets.dart';
import 'package:contact/core/utils/app_colors.dart';
import 'package:contact/core/utils/app_styles.dart';
import 'package:contact/ui/screens/home/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_size_utils.dart';
import '../../../../models/contact_model.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback onDelete;

  const ContactCard({super.key, required this.contact, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.beige,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentGeometry.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.file(
                    contact.chosenImage!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.008,
                    horizontal: width * 0.01,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: width * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.beige,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text(
                      contact.name,
                      style: AppStyles.medium14DarkBlue,
                    ),
                  ),
                )
              ],
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    spacing: width * 0.04,
                    children: [
                      Icon(Icons.mail, color: AppColors.darkBlue),
                      Text(contact.email, style: AppStyles.medium10DarkBlue),
                    ],
                  ),
                  Row(
                    spacing: width * 0.04,
                    children: [
                      Icon(Icons.phone_in_talk, color: AppColors.darkBlue),
                      Text(contact.phone, style: AppStyles.medium10DarkBlue),
                    ],
                  ),
                  ButtonWidget(onPressed: onDelete, isDelete: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
