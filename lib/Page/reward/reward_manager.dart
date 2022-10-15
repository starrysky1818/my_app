import 'dart:core';
import 'dart:ffi';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'sp_util.dart';
import 'package:get_storage/get_storage.dart';

//const String kRewardIntegral = "rewardIntegral";
//const String kSelectRewardInfoList = "selectRewardInfoList";

final box = GetStorage();
String kRewardIntegral = box.read('user').toString();
String kSelectRewardInfoList = "${box.read('user')}selectRewardInfoList";


class RewardManager extends ChangeNotifier {

  static RewardManager? _single;

  RewardManager._(){
    String kRewardIntegral = box.read('user').toString();
    String kSelectRewardInfoList = "${box.read('user')}selectRewardInfoList";
    //print("kRewardIntegral --- ${SpUtil.getInt(kRewardIntegral)}");
    if(SpUtil.getInt(kRewardIntegral) > 0) {

      rewardIntegral = SpUtil.getInt(kRewardIntegral);
    }
    SpUtil.getObjList(kSelectRewardInfoList, (Map data) {
      //print("data === ${data}");
      selectRewardInfoList.add(data as Map<String,dynamic>);
    });
  }

  static RewardManager instance(){
    return _single ??= RewardManager._();
  }

  static RewardManager restart(){
    return _single = RewardManager._();
  }

  int rewardIntegral = 50;

  List<Map<String,dynamic>> selectRewardInfoList = [];
  final StreamController<List> _selectedListController = StreamController<List>.broadcast();
  Stream<List> get selectedListState => _selectedListController.stream;
  StreamSink<List> get selectedListSink => _selectedListController.sink;

  final StreamController<int> _rewardIntegralController = StreamController<int>.broadcast();
  Stream<int> get rewardIntegralState => _rewardIntegralController.stream;
  StreamSink<int> get rewardIntegralSink => _rewardIntegralController.sink;



  var rewardInfo = [
    {
      "icon":"images/bulb1.png",
      "rewardCount":15,
      "name":"Jingle Bell",
      "content":"Happy Christmas!",
    },
    {
      "icon":"images/bulb2.png",
      "rewardCount":20,
      "name":"Magic Wand",
      "content":"Magic! Magic! Here you are!",
    },
    {
      "icon":"images/cactus.png",
      "rewardCount":30,
      "name":"Cactus",
      "content":"I do not need water :)",
    },
    {
      "icon":"images/chair1.png",
      "rewardCount":15,
      "name":"Chair #1",
      "content":"",
    },
    {
      "icon":"images/chair2.png",
      "rewardCount":15,
      "name":"Chair #2",
      "content":"",
    },
    {
      "icon":"images/chair3.png",
      "rewardCount":15,
      "name":"Chair #3",
      "content":"",
    },
    {
      "icon":"images/chair4.png",
      "rewardCount":15,
      "name":"Chair #4",
      "content":"",
    },
    {
      "icon":"images/decoration1.png",
      "rewardCount":35,
      "name":"Fortune Cat",
      "content":"I can bring fortune cookies for you~",
    },
    {
      "icon":"images/decoration2.png",
      "rewardCount":55,
      "name":"Hobby Horse",
      "content":"",
    },
    {
      "icon":"images/decoration3.png",
      "rewardCount":55,
      "name":"Guardian",
      "content":"I protect your home",
    },
    {
      "icon":"images/decoration4.png",
      "rewardCount":80,
      "name":"Water Fountain",
      "content":"",
    },
    {
      "icon":"images/decoration5.png",
      "rewardCount":20,
      "name":"Flower in a Cup",
      "content":"",
    },
    {
      "icon":"images/decoration6.png",
      "rewardCount":25,
      "name":"Lily in the Valley",
      "content":"",
    },
    {
      "icon":"images/dining_table_1.png",
      "rewardCount":35,
      "name":"Dining Table #1",
      "content":"",
    },
    {
      "icon":"images/dining_table_2.png",
      "rewardCount":35,
      "name":"Dining Table #2",
      "content":"",
    },
    {
      "icon":"images/dining_table_3.png",
      "rewardCount":35,
      "name":"Dining Table #3",
      "content":"",
    },
    {
      "icon":"images/fence1.png",
      "rewardCount":10,
      "name":"Fence",
      "content":"",
    },
    {
      "icon":"images/game_machine_1.png",
      "rewardCount":20,
      "name":"Gaming Machine",
      "content":"",
    },
    {
      "icon":"images/television1.png",
      "rewardCount":50,
      "name":"Television #1",
      "content":"",
    },
    {
      "icon":"images/television2.png",
      "rewardCount":50,
      "name":"Televisio #2",
      "content":"",
    },
    {
      "icon":"images/tent1.png",
      "rewardCount":55,
      "name":"Tent",
      "content":"",
    },
    {
      "icon":"images/tree1.png",
      "rewardCount":10,
      "name":"Banana Tree",
      "content":"",
    },
    {
      "icon":"images/tree2.png",
      "rewardCount":25,
      "name":"Apple Tree",
      "content":"Issac Newton loves me",
    },
    {
      "icon":"images/tree3.png",
      "rewardCount":40,
      "name":"Sakura Tree",
      "content":"",
    },
    {
      "icon":"images/tree4.png",
      "rewardCount":20,
      "name":"Plumeria",
      "content":"",
    },
  ];

  addRewardInfo(Map<String,dynamic> rewardInfo) {
    selectRewardInfoList.add(rewardInfo);
    print("dd ${selectRewardInfoList}");
    selectedListSink.add(selectRewardInfoList);
    SpUtil.putObjectList(kSelectRewardInfoList, selectRewardInfoList);
  }

   updateRewardIntegral(int integral) {
    rewardIntegral = integral;
    rewardIntegralSink.add(rewardIntegral);
    SpUtil.putInt(kRewardIntegral, rewardIntegral);
  }

  addRewardIntegral(int integral) {
    rewardIntegral += integral;
    rewardIntegralSink.add(rewardIntegral);
    SpUtil.putInt(kRewardIntegral, rewardIntegral);
  }

  subtractRewardIntegral(int integral) {
   rewardIntegral -= integral;
    rewardIntegralSink.add(rewardIntegral);
    SpUtil.putInt(kRewardIntegral, rewardIntegral);
  }
}
