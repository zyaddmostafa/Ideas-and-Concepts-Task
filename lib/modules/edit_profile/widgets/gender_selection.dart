import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CustomRadio(label: 'Male', selected: true),
        const SizedBox(width: 16),
        _CustomRadio(label: 'Female', selected: false),
      ],
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
