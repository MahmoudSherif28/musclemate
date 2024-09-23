import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/models/tips_model.dart';

class TipRow extends StatelessWidget {
  final TipsModel tipsModel;
  final VoidCallback onPressed;
  final bool isActive;
  const TipRow(
      {super.key,
      required this.tipsModel,
      required this.isActive,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tipsModel.name,
              style: TextStyle(
                  color: isActive ? TColor.primary : TColor.secondaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Image.asset(
              "assets/img/next.png",
              width: 25,
              height: 25,
              color: isActive ? TColor.primary : TColor.secondaryText,
            )
          ],
        ),
      ),
    );
  }
}
