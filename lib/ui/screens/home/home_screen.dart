import 'dart:io';

import 'package:contact/ui/screens/home/widgets/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_size_utils.dart';
import '../../../core/utils/app_styles.dart';
import '../../../models/contact_model.dart';
import 'widgets/show_model_content.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contacts = [];
  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Image.asset(AppAssets.appLogo),
      ),
      body:contacts.isEmpty ? Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.08,),
          Lottie.asset(AppAssets.emptyList),
          Text(
            "There is No Contacts Added Here",
            style: AppStyles.medium20beige,
          ),

        ],
      )
      :Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.018
        ),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              mainAxisSpacing: height * 0.018,
              crossAxisSpacing: width * 0.04,
              mainAxisExtent: height * 0.32
            ),
            itemBuilder: (context, index) {
              ContactModel contact = contacts[index];
              return ContactCard(
                contact: contact,
                onDelete: () {
                  contacts.removeAt(index);
                  setState(() {
                  });
                },
              );
            },
          itemCount: contacts.length,
        ),
      ),
      floatingActionButton: Column(
        spacing: height * 0.008,
        mainAxisSize: MainAxisSize.min,
        children: [
          if(contacts.isNotEmpty)
            FloatingActionButton(
              onPressed: () {
                contacts.removeLast();
                setState(() {

                });
              },
              backgroundColor: AppColors.red,

              child: const Icon(
                Icons.delete,
                color: AppColors.white,
              ),
            ),
          if(contacts.length < 6)
            FloatingActionButton(
              onPressed: () {
                onAddClick(context);
              },
              backgroundColor: AppColors.beige,

              child: const Icon(
                Icons.add,
                color: AppColors.darkBlue,
              ),
            ),
        ],
      )
    );
  }

  void onAddClick (BuildContext context){
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColors.darkBlue,
      context:  context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
              child: ShowModelContent(
                onContactAdd: (contact) {
                  contacts.add(contact);
                },
              )
          ),
        );
      },
    );
  }
}
