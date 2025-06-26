import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:get/get.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditProfileController>();
    return Obx(
      () => Row(
        children: [
          GestureDetector(
            onTap: () => controller.isMale.value = true,
            child: _CustomRadio(
              label: 'Male',
              selected: controller.isMale.value,
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () => controller.isMale.value = false,
            child: _CustomRadio(
              label: 'Female',
              selected: !controller.isMale.value,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomRadio extends StatelessWidget {
  final String label;
  final bool selected;
  const _CustomRadio({required this.label, required this.selected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.beige,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.salamon, width: 2),
              color: selected ? AppColor.salamon : Colors.transparent,
            ),
            child:
                selected
                    ? const Center(
                      child: Icon(Icons.circle, size: 12, color: Colors.white),
                    )
                    : null,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
