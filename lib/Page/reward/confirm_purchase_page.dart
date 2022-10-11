import 'package:flutter/material.dart';
import 'package:my_app/Page/reward/application.dart';
import 'package:my_app/Page/reward/common_text_style.dart';
import 'ui_extension.dart';
import 'reward_manager.dart';
import 'toast_util.dart';



class ConfirmPurchasePage extends StatefulWidget {
  ConfirmPurchasePage({Key? key,required this.rewardInfo}) : super(key: key);
  Map<String,dynamic> rewardInfo = {};

  @override
  ConfirmPurchasePageState createState() => ConfirmPurchasePageState();
}

class ConfirmPurchasePageState extends State<ConfirmPurchasePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding:const EdgeInsets.all(40),
      shape: RoundedRectangleBorder(
          side:  BorderSide(color: const Color(0xFF765449),width: 3.kW,),
          borderRadius: BorderRadius.circular(20.kW),
      ),
      titlePadding:const EdgeInsets.only(left: 24,right: 10,top: 10),
      content: SizedBox(
        height: Application.screenHeight  / 2,
        width: MediaQuery.of(context).size.width - 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110.kW,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: const Color(0xFFC2B280),
                    width: 120.kW,
                    height: 100.kW,
                    child: Image.asset(widget.rewardInfo["icon"]),
                  ),
                  SizedBox(width: 10.kW,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.rewardInfo["name"],style: ts_18BoldTextStyle(),),
                      SizedBox(height: 5.kW,),
                      Expanded(child: Text(widget.rewardInfo["content"],style: ts_14CommonTextStyle().copyWith(color:const Color(0xFF8A7D7D)),maxLines: 2,)),
                      Expanded(child: Row(
                        children: [
                          Image.asset("images/jifenguanli.png",width: 20.kW,),
                          Text("${widget.rewardInfo["rewardCount"]}",style: ts_14CommonTextStyle(),)
                        ],
                      ))
                    ],
                  )),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context, true);
                  },
                  child: Container(
                    width: 120.kW,
                    height: 44.kW,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xFFD15E26),
                        borderRadius: BorderRadius.all(Radius.circular(15.kW)),
                        border:Border.all(color: Color(0xFF755547), width: 4.kW),
                        boxShadow: kBoxShadowStyle2
                    ),
                    child: Text("Cancel",style: ts_20BoldTextStyle().copyWith(color: Colors.white),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    if (RewardManager.instance().rewardIntegral < widget.rewardInfo["rewardCount"]) {
                      ToastUtil.showToast("Not enough credits to buy");
                      return;
                    }
                    setState(() {
                      RewardManager.instance().addRewardInfo(widget.rewardInfo);
                      RewardManager.instance().subtractRewardIntegral(widget.rewardInfo["rewardCount"]);
                    });

                    Navigator.pop(context, true);
                  },
                  child: Container(
                    width: 120.kW,
                    height: 44.kW,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xFFF6D16B),
                        borderRadius: BorderRadius.all(Radius.circular(15.kW)),
                        border:Border.all(color: Color(0xFF755547), width: 4.kW),
                        boxShadow: kBoxShadowStyle2
                    ),
                    child: Text("Purchase",style: ts_20BoldTextStyle(),),
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
