import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'application.dart';
import 'ui_extension.dart';
import 'common_text_style.dart';
import 'rewards_page.dart';
import 'reward_manager.dart';
import 'move_able_widget.dart';
import 'package:my_app/Bottom.dart';

/**
 * @Description  HomePage
 */

class SleepPlanteHomePage extends StatefulWidget {
  const SleepPlanteHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return  _SleepPlanteHomePageState();
  }
}

class _SleepPlanteHomePageState extends State<SleepPlanteHomePage> {
  AssetImage assetImage = const AssetImage("images/background.jpg");
  final GlobalKey stackKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      //在这里处理页面
      setState(() {
        assetImage = AssetImage("images/background.jpg");
        precacheImage(assetImage, context);
      });
    });
    super.initState();
  }

  List<Widget> setupRewardsWidget(selectRewardInfoList) {
    List<Widget> rewardsWidgets = [];
    for (int i = 0; i < selectRewardInfoList.length; i++) {
      var element = selectRewardInfoList[i];
      final icon = element["icon"] as String;
      final x_rand = i * Random().nextInt(100) + 50.0;
      final y_rand = i * Random().nextInt(100) + 50.0;

      rewardsWidgets.add(MoveAbleWidget(
        offsetX: min(100 + x_rand, Application.screenWidth - 80.kW),
        offsetY: min(100 + y_rand, Application.screenHeight - 80.kW),
        stackKey: stackKey,
        child: Image.asset(icon),
      ));
    }

    rewardsWidgets.add(setupRewardButton());
    rewardsWidgets.add(backButton());
    return rewardsWidgets;
  }

  Widget setupRewardButton() {
    return Positioned(
        bottom: Application.safeBottomPadding + 20.kW,
        left: 15.kW,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) {
                return RewardsPage();
              },
            );
          },
          child: Container(
            width: 120.kW,
            height: 60.kW,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFFFBF5EB),
                borderRadius: BorderRadius.all(Radius.circular(15.kW)),
                border: Border.all(color: Color(0xFF755547), width: 4.kW),
                boxShadow: kBoxShadowStyle2),
            child: Text(
              "Rewards",
              style: ts_20BoldTextStyle(),
            ),
          ),
        ));
  }

  Widget backButton() {
    return Positioned(
        bottom: Application.safeBottomPadding + 20.kW,
        right: 15.kW,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
            );
          },
          child: Container(
            width: 120.kW,
            height: 60.kW,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFFFBF5EB),
                borderRadius: BorderRadius.all(Radius.circular(15.kW)),
                border: Border.all(color: Color(0xFF755547), width: 4.kW),
                boxShadow: kBoxShadowStyle2),
            child: Text(
              "Back",
              style: ts_20BoldTextStyle(),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Application.configScreenUtil(context);
    return Container(
        width: Application.screenWidth,
        height: Application.screenHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF6CB48),
          image: DecorationImage(
            image: assetImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            leadingWidth: 120.kW,
            leading: StreamBuilder<int>(
                stream: RewardManager.instance().rewardIntegralState,
                initialData: RewardManager.instance().rewardIntegral,
                builder: (checkedContext, selceted) {
                  //print("rewardIntegral ==  ${selceted}");
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 30.kW,
                        margin: EdgeInsets.only(left: 15.kW),
                        padding: EdgeInsets.only(left: 5.kW, right: 10.kW),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15.kW)),
                            border: Border.all(color: Color(0xFF755547), width: 2.kW),
                            boxShadow: kBoxShadowStyle2),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/jifenguanli.png",
                              width: 24.kW,
                            ),
                            Text(
                              '${selceted.data}',
                              style: ts_16MediumTextStyle(),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
            backgroundColor: Colors.transparent,
          ),
          body: Center(
              child: StreamBuilder<List>(
                  stream: RewardManager.instance().selectedListState,
                  initialData: RewardManager.instance().selectRewardInfoList,
                  builder: (checkedContext, selceted) {
                    print("selceted ==  ${selceted}");
                    if (selceted.data!.isNotEmpty) {
                      return Stack(
                        key: stackKey,
                        children: setupRewardsWidget(selceted.data),
                      );
                    }else {
                      return Stack(
                        key: stackKey,
                        children: [
                          setupRewardButton(),
                          backButton()
                        ],
                      );
                    }
                  })),
        )));
  }
}
