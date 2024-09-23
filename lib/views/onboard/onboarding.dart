import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musclemate/views/login/login.dart';

import '../menu/menu_view.dart';

class FirstOnBoarding extends StatefulWidget {
  const FirstOnBoarding({super.key});

  @override
  State<FirstOnBoarding> createState() => _FirstOnBoardingState();
}

class _FirstOnBoardingState extends State<FirstOnBoarding> {
  Widget dotPageView() {
    return Builder(builder: ((context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: i == pagenumber ? 25 : 6,
              height: 6.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:
                      i == pagenumber ? const Color(0xff442712) : Colors.grey),
            ),
        ],
      );
    }));
  }

  PageController nextpage = PageController();
  int pagenumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffae6a46),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            pagenumber = value;
          });
        },
        controller: nextpage,
        children: [
          Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Image.asset("assets/img/new/on1.png"),
              SizedBox(
                height: 33.h,
              ),
              Text(
                "WECOME !",
                style: TextStyle(
                    color: Color(0xff442712),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "good morning\nlet's learn and make it part of your day",
                style: TextStyle(fontSize: 12.sp, color: Color(0xff442712)),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    nextpage.animateToPage(1,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeIn);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff442712),
                    ),
                    child: const Center(
                        child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              dotPageView(),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Image.asset("assets/img/new/on2.png"),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Unleash Your  Strength !",
                style: TextStyle(
                    color: Color(0xff442712),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "Push your limits, break your boundaries. Your fitness journey starts now!!",
                style: TextStyle(fontSize: 12.sp, color: Color(0xff442712)),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    nextpage.animateToPage(2,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeIn);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff442712),
                    ),
                    child: const Center(
                        child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              dotPageView(),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Image.asset("assets/img/new/on3.png"),
              SizedBox(
                height: 63.h,
              ),
              Text(
                "Transform Your Body !",
                style: TextStyle(
                    color: Color(0xff442712),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "Every workout counts. Step into a healthier, stronger you!",
                style: TextStyle(fontSize: 12.sp, color: Color(0xff442712)),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff442712),
                    ),
                    child: const Center(
                        child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              dotPageView(),
            ],
          ),
        ],
      ),
    );
  }
}
