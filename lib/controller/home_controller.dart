// ignore_for_file: body_might_complete_normally_nullable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profanity_ckeck/helpers/app_colors.dart';
import 'package:profanity_ckeck/utils/app_utils.dart';
import 'package:profanity_filter/profanity_filter.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends ChangeNotifier {
  File? image;
  final TextEditingController textController = TextEditingController();
  final filter = ProfanityFilter();
  profinityCheck(BuildContext context) {
    bool hasProfanity = filter.hasProfanity(textController.text);

    hasProfanity
        ? ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.redColor,
              content: const Center(
                child: Text('Avoid bad words'),
              ),
            ),
          )
        : ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.greenColor,
              content: const Center(
                child: Text('Verified'),
              ),
            ),
          );

    notifyListeners();
  }

  Future<File?> pickImage(ImageSource source) async {
    image = await AppUtils().pickImage(source);
    notifyListeners();
  }

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
