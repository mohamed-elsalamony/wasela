import 'package:flutter/material.dart';

import '../style/colors.dart';

class DefultBorderButton extends StatelessWidget {
  late String title;

  late final VoidCallback? onPressed;
  double? size;
  final bool isOutline;

  DefultBorderButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.size = double.infinity,
    this.isOutline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: size,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: isOutline ? AppColors.kWhite : AppColors.kBlue,
          side: BorderSide(
            width: 1.5,
            color: AppColors.kBlue,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isOutline ? AppColors.kBlue : AppColors.kWhite,
            fontSize: 23,
          ),
        ),
      ),
    );
  }
}
