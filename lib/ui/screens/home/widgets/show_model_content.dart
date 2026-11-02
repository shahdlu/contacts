import 'dart:io';

import 'package:contact/models/contact_model.dart';
import 'package:contact/ui/screens/home/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size_utils.dart';
import '../../../../core/utils/app_styles.dart';
import 'text_field_widget.dart';

typedef OnContactAdd = Function(ContactModel contact);
class ShowModelContent extends StatefulWidget {
  final OnContactAdd onContactAdd;
  const ShowModelContent({super.key, required this.onContactAdd});

  @override
  State<ShowModelContent> createState() => _ShowModelContentState();
}

class _ShowModelContentState extends State<ShowModelContent> {
  File? chosenImage;
  ImagePicker imagePicker = ImagePicker();
  String name = "";
  String email = " ";
  String phone = " ";
  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.010,
        horizontal:width * 0.022 ,
      ),
      child: Column(
        spacing: height * 0.01,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: width * 0.04,
            children: [
              GestureDetector(
                onTap: _chooseImage,
                child: Container(
                  height: height * 0.167,
                  width: width * 0.355,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: AppColors.beige,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius:  BorderRadius.circular(28),
                    child: chosenImage == null ? Lottie.asset(AppAssets.imagePicker)
                    : Image.file(
                      chosenImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  spacing: height * 0.01,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppStyles.bold16beige,
                    ),
                    _buildDivider(context),
                    Text(
                      email,
                      style: AppStyles.bold16beige,
                    ),
                    _buildDivider(context),
                    Text(
                      phone,
                      style: AppStyles.bold16beige,
                    ),
                  ],
                ),
              )
            ],
          ),
          TextFieldWidget(
            hintText: "Enter User Name",
            onChanged: (text) {
                name = text;
              setState(() {

              });
            },
          ),
          TextFieldWidget(
            hintText: "Enter User Email",
            onChanged: (text) {
                email = text;
              setState(() {

              });
            },
          ),
          TextFieldWidget(
            hintText: "Enter User Phone",
            onChanged: (text) {
                phone = text;
              setState(() {

              });
            },
          ),
          ButtonWidget(
            onPressed: () {
              widget.onContactAdd(
                ContactModel(
                  chosenImage: chosenImage,
                  email: email,
                  name: name,
                  phone: phone
                )
              );
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context){
    return Divider(
      color: AppColors.beige,
      endIndent: context.width * 0.06,
    );
  }
  Future<void> _chooseImage () async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      chosenImage = File(image.path);
    }
    setState(() {
      
    });
  }
}
