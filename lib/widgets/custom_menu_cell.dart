import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/models/menu_cells_model.dart';

class CustomMenuCell extends StatelessWidget {
  final VoidCallback onPressed;
  final MenuCellsModel menuCellsModel;
  const CustomMenuCell(
      {super.key, required this.menuCellsModel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: TColor.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              menuCellsModel.image,
              width: 35,
              height: 35,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(menuCellsModel.name,
                style: TextStyle(
                    fontSize: 14,
                    color: TColor.secondaryText,
                    fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}
