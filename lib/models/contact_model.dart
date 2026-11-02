import 'dart:io';

class ContactModel {
  File? chosenImage;
  String name;
  String email;
  String phone;
  ContactModel({
    required this.phone,
    required this.name,
    required this.email,
   required this.chosenImage,
});
}