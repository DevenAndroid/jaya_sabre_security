//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../models/onboarding_content_model.dart';
// import '../../resources/theme/app_theme.dart';
// import '../../router/my_router/my_router.dart';
// import '../../widgets/common_button.dart';
// import 'login.dart';
//
// class Onbording extends StatefulWidget {
//   @override
//   _OnbordingState createState() => _OnbordingState();
// }
//
// class _OnbordingState extends State<Onbording> {
//   int currentIndex = 0;
//   PageController? _controller;
//
//   @override
//   void initState() {
//     _controller = PageController(initialPage: 0);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var deviceWidth = MediaQuery
//         .of(context)
//         .size
//         .width * 0.65;
//     return Scaffold(
//       body: Column(
//         children: [
//           currentIndex == 0 ?
//               ///first page expanded
//           Expanded(
//             child: PageView.builder(
//               controller: _controller,
//               itemCount: contents.length,
//               onPageChanged: (int index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               itemBuilder: (_, i) {
//                 return Container(
//                   padding: EdgeInsets.only(top: 24, left: 14, bottom: 10),
//                   child: Column(
//                     children: [
//                       Container(
//                           padding: EdgeInsets.all(10),
//                           alignment: Alignment.topLeft,
//                           child: RichText(
//                             text: TextSpan(
//                               style: TextStyle(
//                                   color: Colors.black54, fontSize: 20),
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text: 'Skip',
//                                     style: TextStyle(
//                                     ),
//                                     recognizer: TapGestureRecognizer()
//                                       ..onTap = () {
//                                         Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (_) => LoginScreen(),
//                                           ),
//                                         );
//                                       }),
//                               ],
//                             ),
//                           ),
//                       ),
//                       const Divider(
//                         thickness: 1, // thickness of the line
//                         indent: 10, // empty space to the leading edge of divider.
//                         endIndent: 290, // empty space to the trailing edge of the divider.
//                         color: Colors.grey, // The color to use when painting the line.
//                         height: 0, // The divider's height extent.
//                       ),
//                       Image.asset(contents[i].image.toString(),
//                         width: MediaQuery
//                             .of(context)
//                             .size
//                             .width,
//                         height: 300,
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: List.generate(
//                             contents.length,
//                                 (index) => buildDot(index, context),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 60,
//                       ),
//                       Text(
//                         contents[i].title.toString(),
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       Text(
//                         contents[i].discription.toString(),
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       Container(
//                          child: Column(
//                            children: [
//                              const SizedBox(
//                                height: 20,
//                              ),
//                              //currentIndex != 2 ?
//                              ClipRRect(
//                                borderRadius: BorderRadius.circular(300.0),
//                                child: Container(
//                                  height: 60,
//                                  width: 60,
//                                  margin: EdgeInsets.all(30),
//                                  //width: double.infinity,
//                                  child: FlatButton(
//                                    onPressed: () {
//                                      // if (currentIndex == contents.length - 1) {
//                                      //   Navigator.pushReplacement(
//                                      //     context,
//                                      //     MaterialPageRoute(
//                                      //       builder: (_) => LoginScreen(),
//                                      //     ),
//                                      //   );
//                                      // }
//                                      if (currentIndex == 0) {
//                                        _controller!.animateToPage(
//                                          1,
//                                          duration: Duration(milliseconds: 1000),
//                                          curve: Curves.ease,
//                                        );
//                                      }
//                                      else if (currentIndex == 1) {
//                                        _controller!.animateToPage(
//                                          2,
//                                          duration: Duration(milliseconds: 1000),
//                                          curve: Curves.ease,
//                                        );
//                                      }
//                                    },
//                                    color: AppTheme.primaryColor,
//                                    textColor: Colors.white,
//                                    shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(50),
//                                    ),
//                                    child: currentIndex == contents.length - 1
//                                        ? Container(
//                                      //  height: 60,
//                                        margin: EdgeInsets.all(30),
//                                        child: FlatButton(
//                                            onPressed: () {
//                                              if (currentIndex ==
//                                                  contents.length - 1) {
//                                                Navigator.pushReplacement(
//                                                  context,
//                                                  MaterialPageRoute(
//                                                    builder: (_) => LoginScreen(),
//                                                  ),
//                                                );
//                                              }
//                                            },
//                                            color: AppTheme.primaryColor,
//                                            textColor: Colors.white,
//                                            shape: RoundedRectangleBorder(
//                                              borderRadius: BorderRadius.circular(
//                                                  20),
//                                            ),
//                                            child: Text('')
//                                        ))
//                                        :
//                                    Icon(Icons.arrow_forward_outlined),
//                                  ),
//                                ),
//                              ),
//                              //     :
//                              // ClipRRect(
//                              //   borderRadius: BorderRadius.circular(300.0),
//                              //   child: Container(
//                              //     //padding: EdgeInsets.only(bottom: 20),
//                              //     child: CommonButton('Get Started', () {
//                              //       Get.toNamed(MyRouter.loginScreen);
//                              //     }, deviceWidth),
//                              //   ),
//                              // ),
//
//                              SizedBox(
//                                height: 20,
//                              ),
//                              // currentIndex == 2 ?
//                              // Container(
//                              //   padding: EdgeInsets.all(12),
//                              //   child: Column(
//                              //     children: [
//                              //       Text(
//                              //         'By tapping ‘Get started’ and using the Sabre app. You’re',
//                              //         style: TextStyle(
//                              //           color: Colors.grey,
//                              //           fontSize: 12,
//                              //         ),
//                              //       ),
//                              //       RichText(
//                              //         text: TextSpan(
//                              //           style: TextStyle(
//                              //               color: AppTheme.primaryColor,
//                              //               fontSize: 12),
//                              //           children: [
//                              //             TextSpan(text: 'agreeing to our  ',
//                              //               style: TextStyle(
//                              //                 color: Colors.grey,
//                              //                 fontSize: 12,
//                              //               ),
//                              //             ),
//                              //             TextSpan(
//                              //                 text: 'Terms or services ',
//                              //                 style: TextStyle(
//                              //                   decoration: TextDecoration
//                              //                       .underline,
//                              //                 ),
//                              //                 recognizer: TapGestureRecognizer()
//                              //                   ..onTap = () {
//                              //                     Get.toNamed(
//                              //                         MyRouter.termsScreen);
//                              //                   }),
//                              //             TextSpan(text: ' and ',
//                              //               style: TextStyle(
//                              //                 color: Colors.grey,
//                              //                 fontSize: 12,
//                              //               ),
//                              //             ),
//                              //             TextSpan(
//                              //                 text: ' Privacy Policy ',
//                              //                 style: TextStyle(
//                              //                   decoration: TextDecoration
//                              //                       .underline,
//                              //                 ),
//                              //                 recognizer: TapGestureRecognizer()
//                              //                   ..onTap = () {
//                              //                     Get.toNamed(
//                              //                         MyRouter.privacyPolicyScreen
//                              //                     );
//                              //                   }),
//                              //           ],
//                              //         ),
//                              //       ),
//                              //     ],
//                              //   ),
//                              // ) : SizedBox(),
//                            ],
//                          ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ) :
//
//           Expanded(
//             child: PageView.builder(
//               controller: _controller,
//               itemCount: contents.length,
//               onPageChanged: (int index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               itemBuilder: (_, i) {
//                 return Container(
//                   child: Stack(
//                     children: [
//                       Image.asset(contents[i].image.toString(),
//                         width: MediaQuery
//                             .of(context)
//                             .size
//                             .width,
//                         height: 400,
//                       ),
//                       Container(
//                           padding: EdgeInsets.only(left: 20, top: 30),
//                           alignment: Alignment.topLeft,
//                           child: RichText(
//                             text: TextSpan(
//                               style: TextStyle(
//                                   color: currentIndex == 0? Colors.black54 : Colors.white , fontSize: 20),
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text: 'Skip',
//                                     style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                     ),
//                                     recognizer: TapGestureRecognizer()
//                                       ..onTap = () {
//                                         Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (_) => LoginScreen(),
//                                           ),
//                                         );
//                                       }),
//                               ],
//                             ),
//                           ),
//
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       // currentIndex == 0 ?
//                       // Container(
//                       //   height: 520,
//                       //   margin: EdgeInsets.only(top: 300),
//                       //   padding: EdgeInsets.all(20),
//                       //   decoration: BoxDecoration(
//                       //     color: Colors.white,
//                       //     borderRadius: BorderRadius.only(
//                       //         topRight: Radius.circular(40.0),
//                       //         bottomRight: Radius.circular(40.0),
//                       //         topLeft: Radius.circular(40.0),
//                       //         bottomLeft: Radius.circular(40.0)),
//                       //   ),
//                       //   child: Column(
//                       //     children: [
//                       //       const SizedBox(
//                       //         height: 40,
//                       //       ),
//                       //       Container(
//                       //         child: Row(
//                       //           mainAxisAlignment: MainAxisAlignment.center,
//                       //           children: List.generate(
//                       //             contents.length,
//                       //                 (index) => buildDot(index, context),
//                       //           ),
//                       //         ),
//                       //       ),
//                       //       const SizedBox(
//                       //         height: 40,
//                       //       ),
//                       //       Text(
//                       //         contents[i].title.toString(),
//                       //         textAlign: TextAlign.center,
//                       //         style: const TextStyle(
//                       //           fontSize: 22,
//                       //           fontWeight: FontWeight.w700,
//                       //           color: Colors.black,
//                       //         ),
//                       //       ),
//                       //       const SizedBox(
//                       //         height: 15,
//                       //       ),
//                       //       Text(
//                       //         contents[i].discription.toString(),
//                       //         textAlign: TextAlign.center,
//                       //         style: const TextStyle(
//                       //           fontSize: 14,
//                       //           color: Colors.grey,
//                       //         ),
//                       //       ),
//                       //       const SizedBox(
//                       //         height: 18,
//                       //       ),
//                       //       currentIndex != 2 ?
//                       //       ClipRRect(
//                       //         borderRadius: BorderRadius.circular(300.0),
//                       //         child: Container(
//                       //           height: 60,
//                       //           width: 60,
//                       //           margin: EdgeInsets.all(30),
//                       //           //width: double.infinity,
//                       //           child: FlatButton(
//                       //             onPressed: () {
//                       //               // if (currentIndex == contents.length - 1) {
//                       //               //   Navigator.pushReplacement(
//                       //               //     context,
//                       //               //     MaterialPageRoute(
//                       //               //       builder: (_) => LoginScreen(),
//                       //               //     ),
//                       //               //   );
//                       //               // }
//                       //               if (currentIndex == 0) {
//                       //                 _controller!.animateToPage(
//                       //                   1,
//                       //                   duration: Duration(milliseconds: 1000),
//                       //                   curve: Curves.ease,
//                       //                 );
//                       //               }
//                       //               else if (currentIndex == 1) {
//                       //                 _controller!.animateToPage(
//                       //                   2,
//                       //                   duration: Duration(milliseconds: 1000),
//                       //                   curve: Curves.ease,
//                       //                 );
//                       //               }
//                       //             },
//                       //             color: AppTheme.primaryColor,
//                       //             textColor: Colors.white,
//                       //             shape: RoundedRectangleBorder(
//                       //               borderRadius: BorderRadius.circular(50),
//                       //             ),
//                       //             child: currentIndex == contents.length - 1
//                       //                 ? Container(
//                       //               //  height: 60,
//                       //                 margin: EdgeInsets.all(30),
//                       //                 child: FlatButton(
//                       //                     onPressed: () {
//                       //                       if (currentIndex ==
//                       //                           contents.length - 1) {
//                       //                         Navigator.pushReplacement(
//                       //                           context,
//                       //                           MaterialPageRoute(
//                       //                             builder: (_) => LoginScreen(),
//                       //                           ),
//                       //                         );
//                       //                       }
//                       //                     },
//                       //                     color: AppTheme.primaryColor,
//                       //                     textColor: Colors.white,
//                       //                     shape: RoundedRectangleBorder(
//                       //                       borderRadius: BorderRadius.circular(
//                       //                           20),
//                       //                     ),
//                       //                     child: Text('')
//                       //                 ))
//                       //                 :
//                       //             Icon(Icons.arrow_forward_outlined),
//                       //           ),
//                       //         ),
//                       //       ) :
//                       //       // ClipRRect(
//                       //       //   borderRadius: BorderRadius.circular(300.0),
//                       //       //   child: Container(
//                       //       //     //padding: EdgeInsets.only(bottom: 20),
//                       //       //     child: CommonButton('Get Started', () {
//                       //       //       Get.toNamed(MyRouter.loginScreen);
//                       //       //     }, deviceWidth),
//                       //       //   ),
//                       //       // ),
//                       //       SizedBox(
//                       //         height: 18,
//                       //       ),
//                       //       // currentIndex == 2 ?
//                       //       // Container(
//                       //       //   padding: EdgeInsets.all(12),
//                       //       //   child: Column(
//                       //       //     children: [
//                       //       //       Text(
//                       //       //         'By tapping ‘Get started’ and using the Sabre app. You’re',
//                       //       //         style: TextStyle(
//                       //       //           color: Colors.grey,
//                       //       //           fontSize: 12,
//                       //       //         ),
//                       //       //       ),
//                       //       //       RichText(
//                       //       //         text: TextSpan(
//                       //       //           style: TextStyle(
//                       //       //               color: AppTheme.primaryColor,
//                       //       //               fontSize: 12),
//                       //       //           children: [
//                       //       //             TextSpan(text: 'agreeing to our  ',
//                       //       //               style: TextStyle(
//                       //       //                 color: Colors.grey,
//                       //       //                 fontSize: 12,
//                       //       //               ),
//                       //       //             ),
//                       //       //             TextSpan(
//                       //       //                 text: 'Terms or services ',
//                       //       //                 style: TextStyle(
//                       //       //                   decoration: TextDecoration
//                       //       //                       .underline,
//                       //       //                 ),
//                       //       //                 recognizer: TapGestureRecognizer()
//                       //       //                   ..onTap = () {
//                       //       //                     Get.toNamed(
//                       //       //                         MyRouter.termsScreen);
//                       //       //                   }),
//                       //       //             TextSpan(text: ' and ',
//                       //       //               style: TextStyle(
//                       //       //                 color: Colors.grey,
//                       //       //                 fontSize: 12,
//                       //       //               ),
//                       //       //             ),
//                       //       //             TextSpan(
//                       //       //                 text: ' Privacy Policy ',
//                       //       //                 style: TextStyle(
//                       //       //                   decoration: TextDecoration
//                       //       //                       .underline,
//                       //       //                 ),
//                       //       //                 recognizer: TapGestureRecognizer()
//                       //       //                   ..onTap = () {
//                       //       //                     Get.toNamed(
//                       //       //                         MyRouter.privacyPolicyScreen
//                       //       //                     );
//                       //       //                   }),
//                       //       //           ],
//                       //       //         ),
//                       //       //       ),
//                       //       //     ],
//                       //       //   ),
//                       //       // ) : SizedBox(),
//                       //     ],
//                       //   ),
//                       // ) :
//                       // Container(
//                       //   height: 500,
//                       //   margin: EdgeInsets.only(top: 350),
//                       //   padding: EdgeInsets.all(15),
//                       //   decoration: BoxDecoration(
//                       //     color: Colors.white,
//                       //     borderRadius: BorderRadius.only(
//                       //       topRight: Radius.circular(40.0),
//                       //       //  bottomRight: Radius.circular(40.0),
//                       //       topLeft: Radius.circular(40.0),
//                       //       // bottomLeft: Radius.circular(40.0)
//                       //     ),
//                       //   ),
//                       //   child: Column(
//                       //     children: [
//                       //       const SizedBox(
//                       //         height: 30,
//                       //       ),
//                       //       Container(
//                       //         child: Row(
//                       //           mainAxisAlignment: MainAxisAlignment.center,
//                       //           children: List.generate(
//                       //             contents.length,
//                       //                 (index) => buildDot(index, context),
//                       //           ),
//                       //         ),
//                       //       ),
//                       //       const SizedBox(
//                       //         height: 30,
//                       //       ),
//                       //       Text(
//                       //         contents[i].title.toString(),
//                       //         textAlign: TextAlign.center,
//                       //         style: const TextStyle(
//                       //           fontSize: 22,
//                       //           fontWeight: FontWeight.w700,
//                       //           color: Colors.black,
//                       //         ),
//                       //       ),
//                       //       const SizedBox(
//                       //         height: 15,
//                       //       ),
//                       //       Text(
//                       //         contents[i].discription.toString(),
//                       //         textAlign: TextAlign.center,
//                       //         style: const TextStyle(
//                       //           fontSize: 14,
//                       //           color: Colors.grey,
//                       //         ),
//                       //       ),
//                       //       const SizedBox(
//                       //         height: 20,
//                       //       ),
//                       //       currentIndex != 2 ?
//                       //       ClipRRect(
//                       //         borderRadius: BorderRadius.circular(300.0),
//                       //         child: Container(
//                       //           height: 50,
//                       //           width: 50,
//                       //           margin: EdgeInsets.all(30),
//                       //           //width: double.infinity,
//                       //           child: FlatButton(
//                       //             onPressed: () {
//                       //               // if (currentIndex == contents.length - 1) {
//                       //               //   Navigator.pushReplacement(
//                       //               //     context,
//                       //               //     MaterialPageRoute(
//                       //               //       builder: (_) => LoginScreen(),
//                       //               //     ),
//                       //               //   );
//                       //               // }
//                       //               if (currentIndex == 0) {
//                       //                 _controller!.animateToPage(
//                       //                   1,
//                       //                   duration: Duration(milliseconds: 1000),
//                       //                   curve: Curves.ease,
//                       //                 );
//                       //               }
//                       //               else if (currentIndex == 1) {
//                       //                 _controller!.animateToPage(
//                       //                   2,
//                       //                   duration: Duration(milliseconds: 1000),
//                       //                   curve: Curves.ease,
//                       //                 );
//                       //               }
//                       //             },
//                       //             color: AppTheme.primaryColor,
//                       //             textColor: Colors.white,
//                       //             shape: RoundedRectangleBorder(
//                       //               borderRadius: BorderRadius.circular(50),
//                       //             ),
//                       //             child: currentIndex == contents.length - 1
//                       //                 ? Container(
//                       //               //  height: 60,
//                       //                 margin: EdgeInsets.all(30),
//                       //                 child: FlatButton(
//                       //                     onPressed: () {
//                       //                       if (currentIndex ==
//                       //                           contents.length - 1) {
//                       //                         Navigator.pushReplacement(
//                       //                           context,
//                       //                           MaterialPageRoute(
//                       //                             builder: (_) => LoginScreen(),
//                       //                           ),
//                       //                         );
//                       //                       }
//                       //                     },
//                       //                     color: AppTheme.primaryColor,
//                       //                     textColor: Colors.white,
//                       //                     shape: RoundedRectangleBorder(
//                       //                       borderRadius: BorderRadius.circular(
//                       //                           20),
//                       //                     ),
//                       //                     child: Text('')
//                       //                 ))
//                       //                 :
//                       //             Icon(Icons.arrow_forward_outlined),
//                       //           ),
//                       //         ),
//                       //       ) : ClipRRect(
//                       //         borderRadius: BorderRadius.circular(300.0),
//                       //         child: Container(
//                       //           //padding: EdgeInsets.only(bottom: 20),
//                       //           child: CommonButton('Get Started', () {
//                       //             Get.toNamed(MyRouter.loginScreen);
//                       //           }, deviceWidth),
//                       //         ),
//                       //       ),
//                       //       SizedBox(
//                       //         height: 20,
//                       //       ),
//                       //       currentIndex == 2 ?
//                       //       Container(
//                       //         padding: EdgeInsets.all(12),
//                       //         child: Column(
//                       //           children: [
//                       //             Text(
//                       //               'By tapping ‘Get started’ and using the Sabre app. You’re',
//                       //               style: TextStyle(
//                       //                 color: Colors.grey,
//                       //                 fontSize: 12,
//                       //               ),
//                       //             ),
//                       //             RichText(
//                       //               text: TextSpan(
//                       //                 style: TextStyle(
//                       //                     color: AppTheme.primaryColor,
//                       //                     fontSize: 12),
//                       //                 children: [
//                       //                   TextSpan(text: 'agreeing to our  ',
//                       //                     style: TextStyle(
//                       //                       color: Colors.grey,
//                       //                       fontSize: 12,
//                       //                     ),
//                       //                   ),
//                       //                   TextSpan(
//                       //                       text: 'Terms or services ',
//                       //                       style: TextStyle(
//                       //                         decoration: TextDecoration
//                       //                             .underline,
//                       //                       ),
//                       //                       recognizer: TapGestureRecognizer()
//                       //                         ..onTap = () {
//                       //                           Get.toNamed(
//                       //                               MyRouter.termsScreen);
//                       //                         }),
//                       //                   TextSpan(text: ' and ',
//                       //                     style: TextStyle(
//                       //                       color: Colors.grey,
//                       //                       fontSize: 12,
//                       //                     ),
//                       //                   ),
//                       //                   TextSpan(
//                       //                       text: ' Privacy Policy ',
//                       //                       style: TextStyle(
//                       //                         decoration: TextDecoration
//                       //                             .underline,
//                       //                       ),
//                       //                       recognizer: TapGestureRecognizer()
//                       //                         ..onTap = () {
//                       //                           Get.toNamed(
//                       //                               MyRouter.privacyPolicyScreen
//                       //                           );
//                       //                         }),
//                       //                 ],
//                       //               ),
//                       //             ),
//                       //           ],
//                       //         ),
//                       //       ) : SizedBox(),
//                       //
//                       //
//                       //     ],
//                       //   ),
//                       // ),
//                       currentIndex == 2 ?
//                       Expanded(
//                         child: Container(
//                           height: 500,
//                           margin: EdgeInsets.only(top: 300),
//                           padding: EdgeInsets.all(15),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(40.0),
//                               //  bottomRight: Radius.circular(40.0),
//                               topLeft: Radius.circular(40.0),
//                               // bottomLeft: Radius.circular(40.0)
//                             ),
//                           ),
//                           child: Column(
//                             children: [
//                               const SizedBox(
//                                 height: 40,
//                               ),
//                               Container(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: List.generate(
//                                     contents.length,
//                                         (index) => buildDot(index, context),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 40,
//                               ),
//                               Text(
//                                 contents[i].title.toString(),
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               Text(
//                                 contents[i].discription.toString(),
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   letterSpacing: 2.0,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 60,
//                               ),
//                               // currentIndex != 2 ?
//                               // ClipRRect(
//                               //   borderRadius: BorderRadius.circular(300.0),
//                               //   child: Container(
//                               //     height: 60,
//                               //     width: 60,
//                               //     margin: EdgeInsets.all(30),
//                               //     //width: double.infinity,
//                               //     child: FlatButton(
//                               //       onPressed: () {
//                               //         // if (currentIndex == contents.length - 1) {
//                               //         //   Navigator.pushReplacement(
//                               //         //     context,
//                               //         //     MaterialPageRoute(
//                               //         //       builder: (_) => LoginScreen(),
//                               //         //     ),
//                               //         //   );
//                               //         // }
//                               //         if (currentIndex == 0) {
//                               //           _controller!.animateToPage(
//                               //             1,
//                               //             duration: Duration(milliseconds: 1000),
//                               //             curve: Curves.ease,
//                               //           );
//                               //         }
//                               //         else if (currentIndex == 1) {
//                               //           _controller!.animateToPage(
//                               //             2,
//                               //             duration: Duration(milliseconds: 1000),
//                               //             curve: Curves.ease,
//                               //           );
//                               //         }
//                               //       },
//                               //       color: AppTheme.primaryColor,
//                               //       textColor: Colors.white,
//                               //       shape: RoundedRectangleBorder(
//                               //         borderRadius: BorderRadius.circular(50),
//                               //       ),
//                               //       child: currentIndex == contents.length - 1
//                               //           ? Container(
//                               //         //  height: 60,
//                               //           margin: EdgeInsets.all(30),
//                               //           child: FlatButton(
//                               //               onPressed: () {
//                               //                 if (currentIndex ==
//                               //                     contents.length - 1) {
//                               //                   Navigator.pushReplacement(
//                               //                     context,
//                               //                     MaterialPageRoute(
//                               //                       builder: (_) => LoginScreen(),
//                               //                     ),
//                               //                   );
//                               //                 }
//                               //               },
//                               //               color: AppTheme.primaryColor,
//                               //               textColor: Colors.white,
//                               //               shape: RoundedRectangleBorder(
//                               //                 borderRadius: BorderRadius.circular(
//                               //                     20),
//                               //               ),
//                               //               child: Text('')
//                               //           ))
//                               //           :
//                               //       Icon(Icons.arrow_forward_outlined),
//                               //     ),
//                               //   ),
//                               // ) :
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(300.0),
//                                 child: Container(
//                                   //padding: EdgeInsets.only(bottom: 20),
//                                   child: CommonButton('Get Started', () {
//                                     Get.toNamed(MyRouter.loginScreen);
//                                   }, deviceWidth),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               currentIndex == 2 ?
//                               Container(
//                                 padding: EdgeInsets.all(12),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       'By tapping ‘Get started’ and using the Sabre app. You’re',
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                     RichText(
//                                       text: TextSpan(
//                                         style: TextStyle(
//                                             color: AppTheme.primaryColor,
//                                             fontSize: 12),
//                                         children: [
//                                           TextSpan(text: 'agreeing to our  ',
//                                             style: TextStyle(
//                                               color: Colors.grey,
//                                               fontSize: 12,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                               text: 'Terms or services ',
//                                               style: TextStyle(
//                                                 decoration: TextDecoration
//                                                     .underline,
//                                               ),
//                                               recognizer: TapGestureRecognizer()
//                                                 ..onTap = () {
//                                                   Get.toNamed(
//                                                       MyRouter.termsScreen);
//                                                 }),
//                                           TextSpan(text: ' and ',
//                                             style: TextStyle(
//                                               color: Colors.grey,
//                                               fontSize: 12,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                               text: ' Privacy Policy ',
//                                               style: TextStyle(
//                                                 decoration: TextDecoration
//                                                     .underline,
//                                               ),
//                                               recognizer: TapGestureRecognizer()
//                                                 ..onTap = () {
//                                                   Get.toNamed(
//                                                       MyRouter.privacyPolicyScreen
//                                                   );
//                                                 }),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                                   : SizedBox(),
//                             ],
//                           ),
//                         ),
//                       ) :
//
//                       Expanded(
//                         child: Container(
//                           height: 500,
//                           margin: const EdgeInsets.only(top: 300),
//                          // padding: EdgeInsets.all(15),
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(40.0),
//                               //  bottomRight: Radius.circular(40.0),
//                               topLeft: Radius.circular(40.0),
//                               // bottomLeft: Radius.circular(40.0)
//                             ),
//                           ),
//                           child: Column(
//                             children: [
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                               Container(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: List.generate(
//                                     contents.length,
//                                         (index) => buildDot(index, context),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 40,
//                               ),
//                               Text(
//                                 contents[i].title.toString(),
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 25,
//                               ),
//                               Text(
//                                 contents[i].discription.toString(),
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               currentIndex != 2 ?
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(300.0),
//                                 child: Container(
//                                   height: 60,
//                                   width: 60,
//                                   margin: EdgeInsets.all(30),
//                                   //width: double.infinity,
//                                   child: FlatButton(
//                                     onPressed: () {
//                                       // if (currentIndex == contents.length - 1) {
//                                       //   Navigator.pushReplacement(
//                                       //     context,
//                                       //     MaterialPageRoute(
//                                       //       builder: (_) => LoginScreen(),
//                                       //     ),
//                                       //   );
//                                       // }
//                                       if (currentIndex == 0) {
//                                         _controller!.animateToPage(
//                                           1,
//                                           duration: Duration(milliseconds: 1000),
//                                           curve: Curves.ease,
//                                         );
//                                       }
//                                       else if (currentIndex == 1) {
//                                         _controller!.animateToPage(
//                                           2,
//                                           duration: Duration(milliseconds: 1000),
//                                           curve: Curves.ease,
//                                         );
//                                       }
//                                     },
//                                     color: AppTheme.primaryColor,
//                                     textColor: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(50),
//                                     ),
//                                     child: currentIndex == contents.length - 1
//                                         ? Container(
//                                       //  height: 60,
//                                         margin: EdgeInsets.all(30),
//                                         child: FlatButton(
//                                             onPressed: () {
//                                               if (currentIndex ==
//                                                   contents.length - 1) {
//                                                 Navigator.pushReplacement(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (_) => LoginScreen(),
//                                                   ),
//                                                 );
//                                               }
//                                             },
//                                             color: AppTheme.primaryColor,
//                                             textColor: Colors.white,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius: BorderRadius.circular(
//                                                   20),
//                                             ),
//                                             child: Text('')
//                                         ))
//                                         :
//                                     Icon(Icons.arrow_forward_outlined),
//                                   ),
//                                 ),
//                               ) :
//                               // ClipRRect(
//                               //   borderRadius: BorderRadius.circular(300.0),
//                               //   // child: Container(
//                               //   //   //padding: EdgeInsets.only(bottom: 20),
//                               //   //   child: CommonButton('Get Started', () {
//                               //   //     Get.toNamed(MyRouter.loginScreen);
//                               //   //   }, deviceWidth),
//                               //   // ),
//                               // ),
//
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               // currentIndex == 2 ?
//                               // Container(
//                               //   padding: EdgeInsets.all(12),
//                               //   child: Column(
//                               //     children: [
//                               //       Text(
//                               //         'By tapping ‘Get started’ and using the Sabre app. You’re',
//                               //         style: TextStyle(
//                               //           color: Colors.grey,
//                               //           fontSize: 12,
//                               //         ),
//                               //       ),
//                               //       RichText(
//                               //         text: TextSpan(
//                               //           style: TextStyle(
//                               //               color: AppTheme.primaryColor,
//                               //               fontSize: 12),
//                               //           children: [
//                               //             TextSpan(text: 'agreeing to our  ',
//                               //               style: TextStyle(
//                               //                 color: Colors.grey,
//                               //                 fontSize: 12,
//                               //               ),
//                               //             ),
//                               //             TextSpan(
//                               //                 text: 'Terms or services ',
//                               //                 style: TextStyle(
//                               //                   decoration: TextDecoration
//                               //                       .underline,
//                               //                 ),
//                               //                 recognizer: TapGestureRecognizer()
//                               //                   ..onTap = () {
//                               //                     Get.toNamed(
//                               //                         MyRouter.termsScreen);
//                               //                   }),
//                               //             TextSpan(text: ' and ',
//                               //               style: TextStyle(
//                               //                 color: Colors.grey,
//                               //                 fontSize: 12,
//                               //               ),
//                               //             ),
//                               //             TextSpan(
//                               //                 text: ' Privacy Policy ',
//                               //                 style: TextStyle(
//                               //                   decoration: TextDecoration
//                               //                       .underline,
//                               //                 ),
//                               //                 recognizer: TapGestureRecognizer()
//                               //                   ..onTap = () {
//                               //                     Get.toNamed(
//                               //                         MyRouter.privacyPolicyScreen
//                               //                     );
//                               //                   }),
//                               //           ],
//                               //         ),
//                               //       ),
//                               //     ],
//                               //   ),
//                               // ) : SizedBox(),ssss
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Container buildDot(int index, BuildContext context) {
//     return Container(
//       height: 10,
//       width: currentIndex == index ? 25 : 10,
//       margin: EdgeInsets.only(right: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: currentIndex == index ? AppTheme.primaryColor : Colors.grey,
//       ),
//     );
//   }
// }