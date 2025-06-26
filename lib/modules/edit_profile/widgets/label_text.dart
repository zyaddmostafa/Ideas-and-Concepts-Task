import 'package:flutter/material.dart';
import 'package:fluttertask/core/utils/app_text_styles.dart';

class LabelText extends StatelessWidget {
  final String text;
  const LabelText(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: AppTextStyles.font15Medium),
    );
  }
}
