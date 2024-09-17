import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/helpers/tips_list.dart';
import 'package:musclemate/views/tips/tips_details_view.dart';
import 'package:musclemate/widgets/tip_row.dart';

class TipsView extends StatelessWidget {
  const TipsView({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.kPrimaryColor,
        centerTitle: true,
        elevation: 0.1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/black_white.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          "Tips",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index) {
            return TipRow(
              tipsModel: tipsDatails[index],
              isActive: index == 0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TipsDetailView(
                      tipsModel: tipsDatails[index],
                    ),
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black26,
              height: 1,
            );
          },
          itemCount: tipsDatails.length),
    );
  }
}
