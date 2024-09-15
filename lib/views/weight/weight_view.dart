import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/widgets/border_button.dart';

class WeightView extends StatefulWidget {
  const WeightView({super.key});

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  List myWeightArr = [
    {"name": "Sunday, AUG 19", "image": "assets/img/w_1.png"},
    {"name": "Sunday, AUG 26", "image": "assets/img/w_2.png"},
    {
      "name": "Sunday, AUG 26",
      "image": "assets/img/w_3.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.primary,
          centerTitle: true,
          elevation: 0.1,
          // leading: IconButton(
          // onPressed: () {
          //   Navigator.pop(context);
          // },
          // icon: Image.asset(
          //   "assets/img/black_white.png",
          //   width: 25,
          //   height: 25,
          // )),
          title: Text(
            "Check your process",
            style: TextStyle(
                color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: BorderButton(
                          title: "Check Process",
                          type: BorderButtonType.inactive,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: BorderButton(
                          title: "My Weight",
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text(
                  "Add more photo to control your process",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.secondaryText, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  width: media.width,
                  height: media.width * 0.9,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 0.5,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.65,
                        enlargeFactor: 0.4,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                    itemCount: myWeightArr.length,
                    itemBuilder:
                        (BuildContext context, int itemIndex, int index) {
                      var dObj = myWeightArr[index] as Map? ?? {};
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2)),
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(dObj["image"].toString(),
                              width: double.maxFinite,
                              height: double.maxFinite,
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/img/black_fo.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Sunday, AUG 26",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/img/next_go.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                width: 160,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: TColor.gray.withOpacity(0.5), width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "74 kg",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text(
                  ''' Our current cultural climate leads us to believe weight is the enemy. Whether we want to lose 10 lbs or 110 lbs, we’re not addressing the core questions: What are our bodies trying to teach us about our weight? What messages are our bodies sending us? Not all of us are meant to be rail thin just like not all of us can be curvy. Our DNA predetermines our weight set points, but it is up to us to keep our bodies happy in that range.

Most diseases and chronic ailments we experience are messages to us about how we have lived our lives. We can try to cover them up, treat just the symptoms, or ask ourselves a new question: What is this here to teach me about myself? Our beliefs and/or feelings about our weight are no different – we are presented with limiting beliefs so that we can grow, not get stuck in the belief.

The body is constantly communicating with us. Every day it is telling us what it needs. We just have to remember to listen.''',
                  style: TextStyle(color: TColor.secondaryText, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset("assets/img/menu_running.png",
                      width: 25, height: 25),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset("assets/img/menu_meal_plan.png",
                      width: 25, height: 25),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset("assets/img/menu_home.png",
                      width: 25, height: 25),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset("assets/img/menu_weight.png",
                      width: 25, height: 25),
                ),
                InkWell(
                  onTap: () {},
                  child:
                      Image.asset("assets/img/more.png", width: 25, height: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
