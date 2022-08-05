import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/constants/color_constant.dart';
import 'package:medella_new/app/constants/constants.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';
import '../../../../main.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SafeArea(
            child: Obx(() {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  leading: InkWell(
                    onTap: () {
                      print(box.read(ArgumentConstant.token));
                    },
                    child: SizedBox(
                      height: MySize.getHeight(35),
                      width: MySize.getWidth(37),
                      child: Image.asset(imagePath + "medella_icon.png"),
                    ),
                  ),
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    "Medella",
                    style: TextStyle(
                        color: appTheme.primaryTheme,
                        fontWeight: FontWeight.bold,
                        fontSize: MySize.getHeight(24)),
                  ),
                ),
                body: (controller.hasData.isFalse)
                    ? Center(
                        child: CircularProgressIndicator(
                            color: appTheme.primaryTheme))
                    : (isNullEmptyOrFalse(controller.profileData))
                        ? Center(
                            child: Text("Some thing went wrong......"),
                          )
                        : Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(height: MySize.getHeight(20)),
                                Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      SingleChildScrollView(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 30, horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            //color: Colors.white,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  imagePath + "bg.jpeg"),
                                              fit: BoxFit.cover,
                                            ),

                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 3,
                                                offset: Offset(1.0, 1.0),
                                              )
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                      imagePath +
                                                          "white-logo.svg",
                                                      fit: BoxFit.contain,
                                                      height:
                                                          MySize.getHeight(40),
                                                      width:
                                                          MySize.getWidth(120),
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(height: 10),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                            child: Column(
                                                          children: [
                                                            Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: MyText(
                                                                    context,
                                                                    "Medella Code:",
                                                                    TextAlign
                                                                        .start,
                                                                    Colors
                                                                        .white,
                                                                    MySize
                                                                        .getHeight(
                                                                            15),
                                                                    FontWeight
                                                                        .w600)),
                                                            Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: MyText(
                                                                    context,
                                                                    controller
                                                                        .profileData!
                                                                        .medellaCode
                                                                        .toString(),
                                                                    TextAlign
                                                                        .start,
                                                                    Colors
                                                                        .white,
                                                                    MySize
                                                                        .getHeight(
                                                                            20),
                                                                    FontWeight
                                                                        .w800)),
                                                          ],
                                                        )),
                                                        ClipOval(
                                                          //borderRadius: BorderRadius.circular(999999),
                                                          child: Container(
                                                            height: MySize
                                                                .getHeight(100),
                                                            width:
                                                                MySize.getWidth(
                                                                    100),
                                                            color: Colors.white,
                                                            child: (isNullEmptyOrFalse(
                                                                    controller
                                                                        .profileData!
                                                                        .userImage))
                                                                ? SizedBox()
                                                                : getImageByLink(
                                                                    url: controller
                                                                        .profileData!
                                                                        .userImage!,
                                                                    boxFit: BoxFit
                                                                        .cover,
                                                                    height: MySize
                                                                        .getHeight(
                                                                            100),
                                                                    width: MySize
                                                                        .getWidth(
                                                                            100)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 15),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: MyText(
                                                          context,
                                                          controller
                                                              .profileData!
                                                              .userName
                                                              .toString(),
                                                          TextAlign.start,
                                                          Colors.white,
                                                          MySize.getHeight(15),
                                                          FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      height: controller
                                                              .isOpen.isTrue
                                                          ? MySize.getHeight(25)
                                                          : 0,
                                                    ),
                                                    // AnimatedContainer(
                                                    //     duration: const Duration(seconds: 2),
                                                    //     child:
                                                    //         !controller.isOpen.value
                                                    //             ?
                                                    //         SizedBox()
                                                    //     : ClipRRect(
                                                    //         borderRadius:
                                                    //             BorderRadius.circular(12),
                                                    //         child: Container(
                                                    //             margin: const EdgeInsets.only(
                                                    //                 top: 0),
                                                    //             padding:
                                                    //                 const EdgeInsets.all(15),
                                                    //             decoration: BoxDecoration(
                                                    //               borderRadius:
                                                    //                   BorderRadius.circular(
                                                    //                       12),
                                                    //               color: Colors.white,
                                                    //               boxShadow: const [
                                                    //                 BoxShadow(
                                                    //                     color: Colors.grey,
                                                    //                     blurRadius: 3,
                                                    //                     offset:
                                                    //                         Offset(1.0, 1.0))
                                                    //               ],
                                                    //             ),
                                                    //             child: Column(
                                                    //               crossAxisAlignment:
                                                    //                   CrossAxisAlignment
                                                    //                       .start,
                                                    //               children: [
                                                    //                 GFAccordion(
                                                    //                     showAccordion: true,
                                                    //                     expandedTitleBackgroundColor:
                                                    //                         Colors
                                                    //                             .transparent,
                                                    //                     margin:
                                                    //                         const EdgeInsets
                                                    //                             .all(0),
                                                    //                     titleChild: Column(
                                                    //                         crossAxisAlignment:
                                                    //                             CrossAxisAlignment
                                                    //                                 .start,
                                                    //                         children: [
                                                    //                           MyText(
                                                    //                               context,
                                                    //                               "Basic Information (Test Data)",
                                                    //                               TextAlign
                                                    //                                   .start,
                                                    //                               Colors
                                                    //                                   .black,
                                                    //                               14 * unit,
                                                    //                               FontWeight
                                                    //                                   .w900),
                                                    //                           Container(
                                                    //                             width: 50,
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child:
                                                    //                                 Divider(
                                                    //                               color:
                                                    //                                   bluecolor,
                                                    //                               height: 2,
                                                    //                               thickness:
                                                    //                                   3,
                                                    //                             ),
                                                    //                           ),
                                                    //                         ]),
                                                    //                     contentChild: Column(
                                                    //                       children: [
                                                    //                         Container(
                                                    //                           margin: const EdgeInsets
                                                    //                                   .symmetric(
                                                    //                               vertical:
                                                    //                                   5),
                                                    //                           child: Row(
                                                    //                             mainAxisAlignment:
                                                    //                                 MainAxisAlignment
                                                    //                                     .spaceBetween,
                                                    //                             children: [
                                                    //                               Expanded(
                                                    //                                 child:
                                                    //                                     MyText(
                                                    //                                   context,
                                                    //                                   "Age",
                                                    //                                   TextAlign
                                                    //                                       .start,
                                                    //                                   Colors
                                                    //                                       .black,
                                                    //                                   16 *
                                                    //                                       unit,
                                                    //                                   FontWeight
                                                    //                                       .w600,
                                                    //                                 ),
                                                    //                               ),
                                                    //                               Expanded(
                                                    //                                 child:
                                                    //                                     MyText(
                                                    //                                   context,
                                                    //                                   "$diff, Male",
                                                    //                                   TextAlign
                                                    //                                       .end,
                                                    //                                   Colors
                                                    //                                       .black87,
                                                    //                                   16 *
                                                    //                                       unit,
                                                    //                                   FontWeight
                                                    //                                       .w400,
                                                    //                                 ),
                                                    //                               )
                                                    //                             ],
                                                    //                           ),
                                                    //                         ),
                                                    //                         Container(
                                                    //                           margin: const EdgeInsets
                                                    //                                   .symmetric(
                                                    //                               vertical:
                                                    //                                   5),
                                                    //                           child: Row(
                                                    //                             mainAxisAlignment:
                                                    //                                 MainAxisAlignment
                                                    //                                     .spaceBetween,
                                                    //                             children: [
                                                    //                               Expanded(
                                                    //                                 child: MyText(
                                                    //                                     context,
                                                    //                                     "Blood Group",
                                                    //                                     TextAlign
                                                    //                                         .start,
                                                    //                                     Colors
                                                    //                                         .black,
                                                    //                                     16 *
                                                    //                                         unit,
                                                    //                                     FontWeight
                                                    //                                         .w600),
                                                    //                               ),
                                                    //                               Expanded(
                                                    //                                 child: MyText(
                                                    //                                     context,
                                                    //                                     "AB+",
                                                    //                                     TextAlign
                                                    //                                         .end,
                                                    //                                     Colors
                                                    //                                         .black87,
                                                    //                                     16 *
                                                    //                                         unit,
                                                    //                                     FontWeight
                                                    //                                         .w400),
                                                    //                               )
                                                    //                             ],
                                                    //                           ),
                                                    //                         ),
                                                    //                         Container(
                                                    //                           margin: const EdgeInsets
                                                    //                                   .symmetric(
                                                    //                               vertical:
                                                    //                                   5),
                                                    //                           child: Row(
                                                    //                             mainAxisAlignment:
                                                    //                                 MainAxisAlignment
                                                    //                                     .spaceBetween,
                                                    //                             children: [
                                                    //                               Expanded(
                                                    //                                 child:
                                                    //                                     MyText(
                                                    //                                   context,
                                                    //                                   "Phone",
                                                    //                                   TextAlign
                                                    //                                       .start,
                                                    //                                   Colors
                                                    //                                       .black,
                                                    //                                   16 *
                                                    //                                       unit,
                                                    //                                   FontWeight
                                                    //                                       .w600,
                                                    //                                 ),
                                                    //                               ),
                                                    //                               Expanded(
                                                    //                                 child:
                                                    //                                     MyText(
                                                    //                                   context,
                                                    //                                   mobileFormatter.maskText(profile!.mobile ??
                                                    //                                       "+19529763574"),
                                                    //                                   TextAlign
                                                    //                                       .end,
                                                    //                                   Colors
                                                    //                                       .black87,
                                                    //                                   15 *
                                                    //                                       unit,
                                                    //                                   FontWeight
                                                    //                                       .w400,
                                                    //                                 ),
                                                    //                               )
                                                    //                             ],
                                                    //                           ),
                                                    //                         ),
                                                    //                         Container(
                                                    //                           margin: const EdgeInsets
                                                    //                                   .symmetric(
                                                    //                               vertical:
                                                    //                                   5),
                                                    //                           child: Row(
                                                    //                             crossAxisAlignment:
                                                    //                                 CrossAxisAlignment
                                                    //                                     .start,
                                                    //                             mainAxisAlignment:
                                                    //                                 MainAxisAlignment
                                                    //                                     .spaceBetween,
                                                    //                             children: [
                                                    //                               Expanded(
                                                    //                                 child:
                                                    //                                     MyText(
                                                    //                                   context,
                                                    //                                   "Address",
                                                    //                                   TextAlign
                                                    //                                       .start,
                                                    //                                   Colors
                                                    //                                       .black,
                                                    //                                   16 *
                                                    //                                       unit,
                                                    //                                   FontWeight
                                                    //                                       .w600,
                                                    //                                 ),
                                                    //                               ),
                                                    //                               Expanded(
                                                    //                                 child:
                                                    //                                     MyText(
                                                    //                                   context,
                                                    //                                   "${profile!.city ?? ""}, ${profile!.state ?? ""}",
                                                    //                                   TextAlign
                                                    //                                       .end,
                                                    //                                   Colors
                                                    //                                       .black87,
                                                    //                                   16 *
                                                    //                                       unit,
                                                    //                                   FontWeight
                                                    //                                       .w400,
                                                    //                                 ),
                                                    //                               )
                                                    //                             ],
                                                    //                           ),
                                                    //                         ),
                                                    //                         Container(
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child: Row(
                                                    //                               crossAxisAlignment:
                                                    //                                   CrossAxisAlignment
                                                    //                                       .start,
                                                    //                               children: [
                                                    //                                 Expanded(
                                                    //                                   child:
                                                    //                                       MyText(
                                                    //                                     context,
                                                    //                                     "Emergency\nContact",
                                                    //                                     TextAlign
                                                    //                                         .start,
                                                    //                                     Colors
                                                    //                                         .black,
                                                    //                                     16 *
                                                    //                                         unit,
                                                    //                                     FontWeight
                                                    //                                         .w600,
                                                    //                                   ),
                                                    //                                 ),
                                                    //                                 Expanded(
                                                    //                                   child:
                                                    //                                       MyText(
                                                    //                                     context,
                                                    //                                     "Sofiya Brient\n+1 952 976 3574",
                                                    //                                     TextAlign
                                                    //                                         .end,
                                                    //                                     Colors
                                                    //                                         .black87,
                                                    //                                     16 *
                                                    //                                         unit,
                                                    //                                     FontWeight
                                                    //                                         .w400,
                                                    //                                   ),
                                                    //                                 )
                                                    //                               ],
                                                    //                             )),
                                                    //                       ],
                                                    //                     ),
                                                    //                     collapsedIcon:
                                                    //                         const Icon(
                                                    //                             Icons.add),
                                                    //                     expandedIcon:
                                                    //                         const Icon(Icons
                                                    //                             .minimize)),
                                                    //                 GFAccordion(
                                                    //                     expandedTitleBackgroundColor:
                                                    //                         Colors
                                                    //                             .transparent,
                                                    //                     margin:
                                                    //                         const EdgeInsets
                                                    //                             .all(0),
                                                    //                     titleChild: Column(
                                                    //                         crossAxisAlignment:
                                                    //                             CrossAxisAlignment
                                                    //                                 .start,
                                                    //                         children: [
                                                    //                           Container(
                                                    //                               alignment:
                                                    //                                   Alignment
                                                    //                                       .centerLeft,
                                                    //                               child: MyText(
                                                    //                                   context,
                                                    //                                   "Allergies",
                                                    //                                   TextAlign
                                                    //                                       .start,
                                                    //                                   Colors
                                                    //                                       .black,
                                                    //                                   14 *
                                                    //                                       unit,
                                                    //                                   FontWeight
                                                    //                                       .w900)),
                                                    //                           Container(
                                                    //                             width: 50,
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child:
                                                    //                                 Divider(
                                                    //                               color:
                                                    //                                   bluecolor,
                                                    //                               height: 2,
                                                    //                               thickness:
                                                    //                                   3,
                                                    //                             ),
                                                    //                           ),
                                                    //                         ]),
                                                    //                     contentChild: Column(
                                                    //                       children: [
                                                    //                         Container(
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child: Row(
                                                    //                               mainAxisAlignment:
                                                    //                                   MainAxisAlignment
                                                    //                                       .spaceBetween,
                                                    //                               children: [
                                                    //                                 Expanded(
                                                    //                                     flex:
                                                    //                                         1,
                                                    //                                     child: MyText(
                                                    //                                         context,
                                                    //                                         "Peanuts",
                                                    //                                         TextAlign.start,
                                                    //                                         Colors.black,
                                                    //                                         16 * unit,
                                                    //                                         FontWeight.w600)),
                                                    //                                 Expanded(
                                                    //                                     flex:
                                                    //                                         1,
                                                    //                                     child: Container(
                                                    //                                         alignment: Alignment.centerLeft,
                                                    //                                         child: const Icon(
                                                    //                                           Icons.warning,
                                                    //                                           color: Colors.redAccent,
                                                    //                                         )))
                                                    //                               ],
                                                    //                             )),
                                                    //                         Container(
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child: Row(
                                                    //                               mainAxisAlignment:
                                                    //                                   MainAxisAlignment
                                                    //                                       .spaceBetween,
                                                    //                               children: [
                                                    //                                 Expanded(
                                                    //                                     flex:
                                                    //                                         1,
                                                    //                                     child: MyText(
                                                    //                                         context,
                                                    //                                         "Wheat",
                                                    //                                         TextAlign.start,
                                                    //                                         Colors.black,
                                                    //                                         16 * unit,
                                                    //                                         FontWeight.w600)),
                                                    //                                 Expanded(
                                                    //                                     flex:
                                                    //                                         1,
                                                    //                                     child: Container(
                                                    //                                         alignment: Alignment.centerLeft,
                                                    //                                         child: const Icon(
                                                    //                                           Icons.warning,
                                                    //                                           color: Colors.yellow,
                                                    //                                         )))
                                                    //                               ],
                                                    //                             )),
                                                    //                         Container(
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child: Row(
                                                    //                               mainAxisAlignment:
                                                    //                                   MainAxisAlignment
                                                    //                                       .spaceBetween,
                                                    //                               children: [
                                                    //                                 Expanded(
                                                    //                                     flex:
                                                    //                                         1,
                                                    //                                     child: MyText(
                                                    //                                         context,
                                                    //                                         "Tree nuts",
                                                    //                                         TextAlign.start,
                                                    //                                         Colors.black,
                                                    //                                         16 * unit,
                                                    //                                         FontWeight.w600)),
                                                    //                                 Expanded(
                                                    //                                     flex:
                                                    //                                         1,
                                                    //                                     child:
                                                    //                                         Container(
                                                    //                                       alignment:
                                                    //                                           Alignment.centerLeft,
                                                    //                                     ))
                                                    //                               ],
                                                    //                             )),
                                                    //                       ],
                                                    //                     ),
                                                    //                     collapsedIcon:
                                                    //                         const Icon(
                                                    //                             Icons.add),
                                                    //                     expandedIcon:
                                                    //                         const Icon(Icons
                                                    //                             .minimize)),
                                                    //                 GFAccordion(
                                                    //                     expandedTitleBackgroundColor:
                                                    //                         Colors
                                                    //                             .transparent,
                                                    //                     margin:
                                                    //                         const EdgeInsets
                                                    //                             .all(0),
                                                    //                     titleChild: Column(
                                                    //                         crossAxisAlignment:
                                                    //                             CrossAxisAlignment
                                                    //                                 .start,
                                                    //                         children: [
                                                    //                           Container(
                                                    //                               alignment:
                                                    //                                   Alignment
                                                    //                                       .centerLeft,
                                                    //                               child: MyText(
                                                    //                                   context,
                                                    //                                   "Adverse Events",
                                                    //                                   TextAlign
                                                    //                                       .start,
                                                    //                                   Colors
                                                    //                                       .black,
                                                    //                                   14 *
                                                    //                                       unit,
                                                    //                                   FontWeight
                                                    //                                       .w900)),
                                                    //                           Container(
                                                    //                             width: 50,
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child:
                                                    //                                 Divider(
                                                    //                               color:
                                                    //                                   bluecolor,
                                                    //                               height: 2,
                                                    //                               thickness:
                                                    //                                   3,
                                                    //                             ),
                                                    //                           ),
                                                    //                         ]),
                                                    //                     contentChild: Column(
                                                    //                       crossAxisAlignment:
                                                    //                           CrossAxisAlignment
                                                    //                               .start,
                                                    //                       children: [
                                                    //                         Container(
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child: MyText(
                                                    //                                 context,
                                                    //                                 "Test Content",
                                                    //                                 TextAlign
                                                    //                                     .start,
                                                    //                                 Colors
                                                    //                                     .black87,
                                                    //                                 16 * unit,
                                                    //                                 FontWeight
                                                    //                                     .w400)),
                                                    //                       ],
                                                    //                     ),
                                                    //                     collapsedIcon:
                                                    //                         const Icon(
                                                    //                             Icons.add),
                                                    //                     expandedIcon:
                                                    //                         const Icon(Icons
                                                    //                             .minimize)),
                                                    //                 GFAccordion(
                                                    //                     expandedTitleBackgroundColor:
                                                    //                         Colors
                                                    //                             .transparent,
                                                    //                     margin:
                                                    //                         const EdgeInsets
                                                    //                             .all(0),
                                                    //                     titleChild: Column(
                                                    //                         crossAxisAlignment:
                                                    //                             CrossAxisAlignment
                                                    //                                 .start,
                                                    //                         children: [
                                                    //                           Container(
                                                    //                               alignment:
                                                    //                                   Alignment
                                                    //                                       .centerLeft,
                                                    //                               child: MyText(
                                                    //                                   context,
                                                    //                                   "Ambulatory Events",
                                                    //                                   TextAlign
                                                    //                                       .start,
                                                    //                                   Colors
                                                    //                                       .black,
                                                    //                                   14 *
                                                    //                                       unit,
                                                    //                                   FontWeight
                                                    //                                       .w900)),
                                                    //                           Container(
                                                    //                             width: 50,
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child:
                                                    //                                 Divider(
                                                    //                               color:
                                                    //                                   bluecolor,
                                                    //                               height: 2,
                                                    //                               thickness:
                                                    //                                   3,
                                                    //                             ),
                                                    //                           ),
                                                    //                         ]),
                                                    //                     contentChild: Column(
                                                    //                       crossAxisAlignment:
                                                    //                           CrossAxisAlignment
                                                    //                               .start,
                                                    //                       children: [
                                                    //                         Container(
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child: MyText(
                                                    //                                 context,
                                                    //                                 "Test Content",
                                                    //                                 TextAlign
                                                    //                                     .start,
                                                    //                                 Colors
                                                    //                                     .black87,
                                                    //                                 16 * unit,
                                                    //                                 FontWeight
                                                    //                                     .w400)),
                                                    //                       ],
                                                    //                     ),
                                                    //                     collapsedIcon:
                                                    //                         const Icon(
                                                    //                             Icons.add),
                                                    //                     expandedIcon:
                                                    //                         const Icon(Icons
                                                    //                             .minimize)),
                                                    //                 GFAccordion(
                                                    //                     expandedTitleBackgroundColor:
                                                    //                         Colors
                                                    //                             .transparent,
                                                    //                     margin:
                                                    //                         const EdgeInsets
                                                    //                             .all(0),
                                                    //                     titleChild: Column(
                                                    //                         crossAxisAlignment:
                                                    //                             CrossAxisAlignment
                                                    //                                 .start,
                                                    //                         children: [
                                                    //                           Container(
                                                    //                               alignment:
                                                    //                                   Alignment
                                                    //                                       .centerLeft,
                                                    //                               child: MyText(
                                                    //                                   context,
                                                    //                                   "Medical History",
                                                    //                                   TextAlign
                                                    //                                       .start,
                                                    //                                   Colors
                                                    //                                       .black,
                                                    //                                   14 *
                                                    //                                       unit,
                                                    //                                   FontWeight
                                                    //                                       .w900)),
                                                    //                           Container(
                                                    //                             width: 50,
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child:
                                                    //                                 Divider(
                                                    //                               color:
                                                    //                                   bluecolor,
                                                    //                               height: 2,
                                                    //                               thickness:
                                                    //                                   3,
                                                    //                             ),
                                                    //                           ),
                                                    //                         ]),
                                                    //                     contentChild: Column(
                                                    //                       crossAxisAlignment:
                                                    //                           CrossAxisAlignment
                                                    //                               .start,
                                                    //                       children: [
                                                    //                         Container(
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child: Row(
                                                    //                               mainAxisAlignment:
                                                    //                                   MainAxisAlignment
                                                    //                                       .spaceBetween,
                                                    //                               children: [
                                                    //                                 MyText(
                                                    //                                     context,
                                                    //                                     "#MC-0014",
                                                    //                                     TextAlign
                                                    //                                         .start,
                                                    //                                     Colors
                                                    //                                         .black,
                                                    //                                     16 *
                                                    //                                         unit,
                                                    //                                     FontWeight
                                                    //                                         .w600),
                                                    //                                 MyText(
                                                    //                                     context,
                                                    //                                     "Dental Filing",
                                                    //                                     TextAlign
                                                    //                                         .start,
                                                    //                                     Colors
                                                    //                                         .black87,
                                                    //                                     16 *
                                                    //                                         unit,
                                                    //                                     FontWeight
                                                    //                                         .w400)
                                                    //                               ],
                                                    //                             )),
                                                    //                         Container(
                                                    //                             margin: const EdgeInsets
                                                    //                                     .symmetric(
                                                    //                                 vertical:
                                                    //                                     5),
                                                    //                             child: Row(
                                                    //                               mainAxisAlignment:
                                                    //                                   MainAxisAlignment
                                                    //                                       .spaceBetween,
                                                    //                               children: [
                                                    //                                 MyText(
                                                    //                                     context,
                                                    //                                     "14 Nov 2020",
                                                    //                                     TextAlign
                                                    //                                         .start,
                                                    //                                     Colors
                                                    //                                         .black,
                                                    //                                     16 *
                                                    //                                         unit,
                                                    //                                     FontWeight
                                                    //                                         .w600),
                                                    //                                 MyText(
                                                    //                                     context,
                                                    //                                     "Dr. Ruby Perrin",
                                                    //                                     TextAlign
                                                    //                                         .start,
                                                    //                                     Colors
                                                    //                                         .black87,
                                                    //                                     16 *
                                                    //                                         unit,
                                                    //                                     FontWeight
                                                    //                                         .w400)
                                                    //                               ],
                                                    //                             )),
                                                    //                         Container(
                                                    //                             alignment:
                                                    //                                 Alignment
                                                    //                                     .centerRight,
                                                    //                             child:
                                                    //                                 Container(
                                                    //                                     alignment: Alignment
                                                    //                                         .center,
                                                    //                                     width: MediaQuery.of(context).size.width *
                                                    //                                         0.5,
                                                    //                                     margin: const EdgeInsets.only(
                                                    //                                         top:
                                                    //                                             25),
                                                    //                                     padding: const EdgeInsets.all(
                                                    //                                         15),
                                                    //                                     decoration:
                                                    //                                         BoxDecoration(
                                                    //                                       borderRadius:
                                                    //                                           BorderRadius.circular(12),
                                                    //                                       color:
                                                    //                                           bluecolor,
                                                    //                                       boxShadow: const [
                                                    //                                         BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(1.0, 1.0))
                                                    //                                       ],
                                                    //                                     ),
                                                    //                                     child: MyText(
                                                    //                                         context,
                                                    //                                         "See Prescriptions",
                                                    //                                         TextAlign.start,
                                                    //                                         Colors.white,
                                                    //                                         16 * unit,
                                                    //                                         FontWeight.w400))),
                                                    //                         Container(
                                                    //                             alignment:
                                                    //                                 Alignment
                                                    //                                     .center,
                                                    //                             //width: MediaQuery.of(context).size.width * 0.5,
                                                    //                             margin: const EdgeInsets
                                                    //                                     .only(
                                                    //                                 top: 25),
                                                    //                             padding: const EdgeInsets
                                                    //                                 .all(15),
                                                    //                             decoration:
                                                    //                                 BoxDecoration(
                                                    //                               borderRadius:
                                                    //                                   BorderRadius.circular(
                                                    //                                       12),
                                                    //                               color:
                                                    //                                   bluecolor,
                                                    //                               boxShadow: const [
                                                    //                                 BoxShadow(
                                                    //                                     color: Colors
                                                    //                                         .grey,
                                                    //                                     blurRadius:
                                                    //                                         3,
                                                    //                                     offset: Offset(
                                                    //                                         1.0,
                                                    //                                         1.0))
                                                    //                               ],
                                                    //                             ),
                                                    //                             child: Row(
                                                    //                                 mainAxisAlignment:
                                                    //                                     MainAxisAlignment
                                                    //                                         .spaceBetween,
                                                    //                                 children: [
                                                    //                                   MyText(
                                                    //                                       context,
                                                    //                                       "CT Scan",
                                                    //                                       TextAlign
                                                    //                                           .start,
                                                    //                                       Colors
                                                    //                                           .white,
                                                    //                                       16 *
                                                    //                                           unit,
                                                    //                                       FontWeight.w400),
                                                    //                                   MyText(
                                                    //                                       context,
                                                    //                                       "January 2021",
                                                    //                                       TextAlign
                                                    //                                           .start,
                                                    //                                       Colors
                                                    //                                           .white,
                                                    //                                       16 *
                                                    //                                           unit,
                                                    //                                       FontWeight.w400)
                                                    //                                 ]))
                                                    //                       ],
                                                    //                     ),
                                                    //                     collapsedIcon:
                                                    //                         const Icon(
                                                    //                             Icons.add),
                                                    //                     expandedIcon:
                                                    //                         const Icon(Icons
                                                    //                             .minimize)),
                                                    //               ],
                                                    //             )))
                                                    //     ),
                                                    SizedBox(
                                                      height: controller
                                                              .isOpen.value
                                                          ? 15
                                                          : 0,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 8),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                              boxShadow: const [
                                                // const BoxShadow(
                                                //   color: Colors.grey,
                                                // ),
                                                // const BoxShadow(
                                                //   color: Colors.grey,
                                                //   spreadRadius: -12.0,
                                                //   blurRadius: 12.0,
                                                // ),
                                              ],
                                            ),
                                            child: InkWell(
                                                onTap: () {
                                                  // controller.isOpen.toggle();
                                                },
                                                child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(controller
                                                              .isOpen.isTrue
                                                          ? "See Less"
                                                          : "See More"),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Icon(
                                                        controller.isOpen.value
                                                            ? Icons
                                                                .keyboard_arrow_up
                                                            : Icons
                                                                .keyboard_arrow_down,
                                                      )
                                                    ]))),
                                      )
                                    ]),
                                SizedBox(height: MySize.getHeight(35)),
                              ],
                            )),
              );
            }),
          );
        });
  }
}
