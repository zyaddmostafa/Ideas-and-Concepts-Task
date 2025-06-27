import 'package:flutter/widgets.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/constants/app_constants.dart';
import 'package:fluttertask/core/widgets/profile_header.dart';
import 'package:fluttertask/data/models/user_model.dart';
import 'package:fluttertask/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditProfileHeaderGetxBuilder extends StatelessWidget {
  const EditProfileHeaderGetxBuilder({super.key, required this.argument});

  final UserModel argument;

  @override
  Widget build(BuildContext context) {
    return GetX<EditProfileController>(
      builder: (controller) {
        String img =
            controller.imageUrl.value.isNotEmpty
                ? controller.imageUrl.value
                : argument.imageUrl ?? AppConstants.defultProfileImageUrl;
        return ProfileHeader(
          userInfoVerticalSpace: 18,
          imageAndUserInfoVerticalSpace: 8,
          imageUrl: img,
          name: argument.name ?? 'no name',
          email: argument.email ?? 'no email',
          userInfoBackgroundColor: AppColor.beige,
          showCameraIcon: true,
          onImageTap: () {
            controller.pickAndUploadImage();
          },
        );
      },
    );
  }
}
