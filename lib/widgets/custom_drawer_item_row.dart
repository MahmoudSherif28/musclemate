import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/models/drawer_items_model.dart';

class CustomDrawerItemsRow extends StatelessWidget {
  final DrawerItemsModel drawerItemsModel;
  final bool isSelect;
  final VoidCallback onPressed;
  const CustomDrawerItemsRow(
      {super.key,
      required this.drawerItemsModel,
      this.isSelect = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Image.asset(
              drawerItemsModel.icon,
              width: 35,
              height: 35,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                drawerItemsModel.name,
                style: TextStyle(
                    color:
                        isSelect ? TColor.kPrimaryColor : TColor.secondaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            if (drawerItemsModel.rightIcon != "")
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Image.asset(
                  drawerItemsModel.rightIcon!,
                  width: 25,
                  height: 25,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
