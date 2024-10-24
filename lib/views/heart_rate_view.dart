import 'package:flutter/material.dart';
import 'package:heart_bpm/heart_bpm.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/generated/l10n.dart';

class HeartRateView extends StatefulWidget {
  const HeartRateView({super.key});

  @override
  State<HeartRateView> createState() => _HeartRateViewState();
}

class _HeartRateViewState extends State<HeartRateView> {
  List<SensorValue> data = [];
  int? bpmValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
        centerTitle: true,
        backgroundColor: TColor.kPrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(S.of(context).coverCamera),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 88,
                ),
                SizedBox(
                  width: 16,
                ),
                HeartBPMDialog(
                  context: context,
                  onRawData: (value) {
                    setState(() {
                      if (data.length == 100) {
                        data.removeAt(0);
                      }
                      data.add(value);
                    });
                  },
                  onBPM: (value) => setState(() {
                    bpmValue = value;
                  }),
                  child: Text(
                    bpmValue?.toString() ?? "-",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
