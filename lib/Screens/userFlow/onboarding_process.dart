import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/onboarding_content_model.dart';
import '../../resources/theme/app_theme.dart';
import '../../router/my_router/my_router.dart';
import '../../widgets/common_button.dart';

class OnBoardingProcess extends StatefulWidget {
  const OnBoardingProcess({Key? key}) : super(key: key);

  @override
  State<OnBoardingProcess> createState() => _OnBoardingProcessState();
}

class _OnBoardingProcessState extends State<OnBoardingProcess> {
  @override
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var deviceWidth = MediaQuery.of(context).size.width * 0.65;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: PageView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Image.asset(
                      contents[i].image.toString(),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      fit: BoxFit.cover,
                    );
                  }),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              top: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      contents[currentIndex].title.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      contents[currentIndex].discription.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 1.20,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    currentIndex == 0
                        ? InkWell(
                            onTap: () {
                              if (currentIndex == 0) {
                                _controller!.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              }
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueAccent,
                              ),
                              padding: const EdgeInsets.all(5),
                              // margin: EdgeInsets.all(30),
                              //width: double.infinity,
                              child: const Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(300.0),
                            child: Container(
                              //padding: EdgeInsets.only(bottom: 20),
                              child: CommonButton('Get Started', () {
                                Get.offAllNamed(MyRouter.loginScreen);
                              }, deviceWidth),
                            ),
                          ),
                    SizedBox(height: 20),
                    currentIndex == 1
                        ? Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                const Text(
                                  'By tapping ‘Get started’ and using the Sabre app. You’re',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontSize: 12),
                                    children: [
                                      const TextSpan(
                                        text: 'agreeing to our  ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      TextSpan(
                                          text: 'Terms or services ',
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.toNamed(MyRouter.termsScreen);
                                            }),
                                      const TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      TextSpan(
                                          text: ' Privacy Policy ',
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.toNamed(
                                                  MyRouter.privacyPolicyScreen);
                                            }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 18,
              top: MediaQuery.of(context).size.height * 0.073,
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(MyRouter.loginScreen);
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6,
      width: currentIndex == index ? 28 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? AppTheme.primaryColor
            : Colors.grey.shade300,
      ),
    );
  }
}
