import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medella_new/app/constants/color_constant.dart';
import 'package:medella_new/app/utilities/utilities.dart';

import '../../../constants/sizeConstant.dart';
import '../controllers/select_hospital_screen_controller.dart';

class SelectHospitalScreenView
    extends GetWidget<SelectHospitalScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Space.height(45),
              Center(
                child: Container(
                    height: MySize.getHeight(209),
                    width: MySize.getWidth(172),
                    child: Image.asset("assets/images/medella_logo.png")),
              ),
              Space.height(92),
              SizedBox(
                height: MySize.getHeight(42),
                width: MySize.getWidth(324),
                child: Text(
                  "Your registration needs to be completed by a Hospital, Please select your nearest hospital.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Space.height(79),
              InkWell(
                onTap: () {
                  openBottomSheet(context: context, controller: controller);
                },
                child: getButton(
                  title: "Select hospital",
                  borderColor: Colors.grey.shade300,
                  backColor: Colors.transparent,
                  color: appTheme.primaryTheme,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  openBottomSheet(
      {required BuildContext context,
      required SelectHospitalScreenController controller}) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(MySize.getHeight(10)),
                topRight: Radius.circular(MySize.getHeight(10)))),
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                        child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(top: MySize.getHeight(20)),
                        child: Column(
                          children: List.generate(controller.hospitals.length,
                              (index) {
                            return Row(
                              children: [
                                Checkbox(
                                    value: controller
                                        .hospitals[index].isSelected!.value,
                                    onChanged: (val) {
                                      controller.hospitals.forEach((element) {
                                        element.isSelected!.value = false;
                                      });
                                      controller.hospitals[index].isSelected!
                                          .value = true;
                                      setState(() {});
                                    }),
                                Text("${controller.hospitals[index].name}"),
                              ],
                            );
                          }),
                        ),
                      ),
                    )),
                  ),
                  Center(
                      child: InkWell(
                          onTap: () {
                            int id = 0;
                            controller.hospitals.forEach((element) {
                              if (element.isSelected!.value) {
                                id = element.id!;
                              }
                            });
                            controller.addHospital(context: context, id: id);
                          },
                          child: getButton(title: "Submit"))),
                  SizedBox(height: MySize.getHeight(20)),
                ],
              );
            },
          );
        });
  }
}
