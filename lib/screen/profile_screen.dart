import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/controller/profilescreen_controller.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

import '../utills/appcolor.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getUserImage();
    controller.getUserData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.keyboard_arrow_left)),
          centerTitle: true,
          title: Text(
            "profile".tr,
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: controller.userImage.isEmpty && controller.imagePath.isEmpty
                                ? Image.asset(
                                    "assets/image/userprofile.png",
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )
                                : controller.userImage.isNotEmpty
                                    ? Image.file(
                                        File(
                                          controller.userImage.value,
                                        ),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                    : controller.googleImage.isEmpty? Image.file(
                                        File(
                                          controller.imagePath.value,
                                        ),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ) : Image.network(controller.googleImage.value),
                          ),
                          Positioned(
                              right: 12,
                              bottom: 10,
                              child: GestureDetector(
                                  onTap: () {
                                    controller.getImageGallery();
                                  },
                                  child: const Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 25,
                                  ))),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.username.value,
                            style: GoogleFontsStyle.inter(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          Text(
                            controller.email.value,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.labelSmall,
                            softWrap: false,
                          ),
                        ],
                      )
                    ],
                  ),
                  _commonCard(
                      onTap: () {
                        Get.toNamed(NameRoutes.myOrderScreen);
                      },
                      title: "myOrder".tr,
                      desc: "alreadyOrder".tr),
                  _commonCard(
                      onTap: () {
                        Get.toNamed(NameRoutes.shippingAddressScreen);
                      },
                      title: "shipAddress".tr,
                      desc: "getAddress".tr),
                  _commonCard(
                      onTap: () {
                        Get.toNamed(NameRoutes.userLocationScreen);
                      },
                      title: "myLocation".tr,
                      desc: "getMyLocation".tr),
                  _commonCard(
                      title: "paymentMethod".tr,
                      desc: "haveCard".tr,
                      onTap: () {
                        Get.toNamed(NameRoutes.paymentMethodScreen);
                      }),
                  _commonCard(title: "myReviews".tr, desc: "reviewItem".tr),
                  _commonCard(
                      onTap: () {
                        Get.toNamed(NameRoutes.profileSettingScreen);
                      },
                      title: "setting".tr,
                      desc: "faqDesc".tr),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _commonCard(
      {required String title,
      required String desc,
      GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFontsStyle.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        desc,
                        style: GoogleFontsStyle.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColor.grey),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
