import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:my_app/Page/reward/application.dart';
import 'package:my_app/Page/reward/common_text_style.dart';
import 'ui_extension.dart';
import 'reward_manager.dart';
import 'confirm_purchase_page.dart';



class RewardsPage extends StatefulWidget {
  RewardsPage({Key? key,}) : super(key: key);

  @override
  RewardsPageState createState() => RewardsPageState();
}

class RewardsPageState extends State<RewardsPage> {

  @override
  void initState() {

    super.initState();
  }



  Widget setupGrid() {
    var rewardInfo = RewardManager.instance().rewardInfo;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      itemCount: rewardInfo.length,
      itemBuilder: (context, index) {
        String icon = rewardInfo[index]["icon"] as String;
        return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return ConfirmPurchasePage(rewardInfo: rewardInfo[index]);
                },
              );
            },
            child:
                Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF4E7CA),
                      borderRadius: BorderRadius.all(Radius.circular(15.kR)),
                    ),
                    child:Column(
                        children: [
                          Spacer(),
                          Image.asset(icon,height: 34.kW,),
                          Spacer(),
                          if ((rewardInfo[index]["rewardCount"] as int) > 0) (
                              Padding(padding: EdgeInsets.only(bottom: 5.kW),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("images/jifenguanli.png",width: 15.kW,),
                                    Text("${rewardInfo[index]["rewardCount"]}",style: ts_12CommonTextStyle(),)
                                  ],
                                ),)
                          )

                        ]
                ),
            )
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: setupTitle(),
      insetPadding:const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      titlePadding:const EdgeInsets.only(left: 24,right: 10,top: 10),
      content: SizedBox(
        height: Application.screenHeight  / 2,
        width: MediaQuery.of(context).size.width - 40,
        child: SingleChildScrollView(
            child: Column(
              children: [
                setupGrid()
              ],
            )),
      ),
    );
  }

  Widget setupTitle() {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pop(context, true);
                },
                child: const Icon(
                  Icons.close,
                ))
          ],
        ),
        Text(
          'Rewards',
          style: ts_24BoldTextStyle().copyWith(color: const Color(0xFF3F2D27)),
        ),
      ],
    );
  }
}
