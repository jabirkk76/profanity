// ignore_for_file: unused_local_variable, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profanity_ckeck/controller/home_controller.dart';
import 'package:profanity_ckeck/helpers/app_colors.dart';
import 'package:profanity_ckeck/helpers/app_sizes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('PROFANITY'),
          backgroundColor: AppColors.primaryColor),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                controller: homeController.textController,
                decoration: const InputDecoration(
                  hintText: 'Enter the word',
                  border: OutlineInputBorder(),
                ),
              ),
              AppSizes.szd20,
              Consumer<HomeController>(
                builder: (context, value, child) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor),
                    onPressed: () {
                      value.profinityCheck(context);
                    },
                    child: const Text('Check')),
              ),
              AppSizes.szd20,
              Consumer<HomeController>(builder: (context, value, child) {
                if (value.image == null) {
                  return Container(
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Consumer<HomeController>(
                              builder: (context, value, child) => SizedBox(
                                height: 150,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        homeController.navigateBack(context);
                                        await value
                                            .pickImage(ImageSource.camera);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text('Camera'),
                                          Icon(Icons.camera_alt_outlined)
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        homeController.navigateBack(context);
                                        await value
                                            .pickImage(ImageSource.gallery);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text('Gallery'),
                                          Icon(Icons.image)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.camera_alt_rounded,
                          color: AppColors.whiteColor),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: AppColors.primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    height: 200,
                    width: 300,
                  );
                } else {
                  return Container(
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Consumer<HomeController>(
                                builder: (context, value, child) => SizedBox(
                                  height: 150,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          homeController.navigateBack(context);
                                          await value
                                              .pickImage(ImageSource.camera);
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('Camera'),
                                            Icon(Icons.camera_alt_outlined),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          homeController.navigateBack(context);
                                          await value
                                              .pickImage(ImageSource.gallery);
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('Gallery'),
                                            Icon(Icons.image)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.camera_alt_rounded,
                            color: AppColors.whiteColor)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(
                            File(value.image!.path),
                          ),
                          fit: BoxFit.fill),
                      border: Border.all(),
                      color: Colors.green,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    height: 200,
                    width: 300,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
