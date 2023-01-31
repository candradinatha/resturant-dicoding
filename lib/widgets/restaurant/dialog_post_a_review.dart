import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/data/controller/restaurant_detail_controller.dart';

import '../../constants/app_sizes.dart';
import '../../styles.dart';
import '../common/custom_text_field.dart';
import '../common/primary_button.dart';

class DialogPostAReview extends StatelessWidget {
  DialogPostAReview({super.key});

  final RestaurantDetailController controller = Get.find();
  final reviewerCtrl = TextEditingController();
  final reviewCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.p24),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.p24),
              color: colorBgDarkAccent,
            ),
            padding: const EdgeInsets.all(Sizes.p24),
            clipBehavior: Clip.hardEdge,
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Create a review",
                    style: Get.theme.textTheme.headline6,
                  ),
                  AppGaps.h24,
                  CustomTextForm(
                    controller: reviewerCtrl,
                    hint: "Reviewer Name",
                    isRequired: true,
                  ),
                  AppGaps.h16,
                  CustomTextForm(
                    controller: reviewCtrl,
                    hint: "Review",
                    isRequired: true,
                    textInputType: TextInputType.multiline,
                  ),
                  AppGaps.h24,
                  PrimaryButton(
                    title: "Submit",
                    onTap: () {
                      if (controller.formKey.currentState?.validate() == true) {
                        controller.postAReview(
                          reviewer: reviewerCtrl.value.text,
                          review: reviewCtrl.value.text,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
