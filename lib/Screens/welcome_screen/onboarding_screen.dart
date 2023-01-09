import 'package:flutter/material.dart';
import 'package:medica/Const/app_color.dart';

import '../../sample_data/onboarding_info.dart';

class OnboardingScreen extends StatefulWidget {
  static const String route = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                              height: 400,
                              width: size.width,
                              //import '../../sample_data/onboarding_info.dart';
                              child: Image.asset(onboardingPages[index].image,
                              fit: BoxFit.cover,)),
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            width: size.width,
                            decoration:  BoxDecoration(
                                color: AppColor.secondaryColor,
                           ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              child: Column(
                                children: [
                                 
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    onboardingPages[index].title,
                                    style:  TextStyle(
                                        color: AppColor.textColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Text(
                                      onboardingPages[index].description,
                                      textAlign: TextAlign.center,
                                      style:  TextStyle(
                                          color: AppColor.textColor.withOpacity(.5),
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  index == 2
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                 _controller.animateToPage(2,
                                                 duration: const Duration(
                                                        milliseconds: 500),
                                                  curve: Curves.easeInOut);
                                              },
                                              child: Text(
                                                'Skip',
                                                style: TextStyle(
                                                    fontFamily: "Montserrat",
                                                    color:AppColor.whiteColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            FloatingActionButton(
                                              onPressed: () {
                                                _controller.nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.easeInOut);
                                              },
                                              child:  Icon(
                                                Icons
                                                    .keyboard_arrow_right_sharp,
                                                color:AppColor.primaryColor,
                                                size: 30,
                                              ),
                                              backgroundColor: Colors.white,
                                            )
                                          ],
                                        )
                                      : GestureDetector(
                                          onTap: (() {
                                           // Navigator.pushReplacementNamed(
                                                //context, WelcomeScreen.route);
                                          }),
                                          child: Container(
                                            height: 50,
                                            width: size.width * .7,
                                            decoration: BoxDecoration(
                                                color: AppColor.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child:  Center(
                                              child: Text(
                                                'Get started',
                                                style: TextStyle(
                                                    fontFamily: "Montserrat",
                                                    color:
                                                       AppColor.whiteColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })),
            Positioned(
              left: MediaQuery.of(context).size.width * .45,
              bottom:  MediaQuery.of(context).size.height * .15,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 9,
                            width: currentIndex == index ? 25 : 9,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: currentIndex == index
                                    ?AppColor.primaryColor
                                    :AppColor.greyColor),
                          ))),
            ),
          ],
        ),
      ),
    );
  }
}