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
final String kRewardIntegral = box.read('user').toString();
final String kSelectRewardInfoList = "${box.read('user')}selectRewardInfoList";

class RewardManager extends ChangeNotifier {

  static RewardManager? _single;
  RewardManager._(){

    print("kRewardIntegral --- ${SpUtil.getInt(kRewardIntegral)}");
    if(SpUtil.getInt(kRewardIntegral) > 0) {
      rewardIntegral = SpUtil.getInt(kRewardIntegral);
    }
    SpUtil.getObjList(kSelectRewardInfoList, (Map data) {
      print("data === ${data}");

      selectRewardInfoList.add(data as Map<String,dynamic>);
    });
  }

  static RewardManager instance(){
    return _single ??= RewardManager._();
  }

  int rewardIntegral = 8888;
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
      "rewardCount":88,
      "name":"彩色摇铃",
      "content":"多彩声音清脆悦耳",
    },
    {
      "icon":"images/bulb2.png",
      "rewardCount":2,
      "name":"泡泡光球",
      "content":"泡泡光球",
    },
    {
      "icon":"images/cactus.png",
      "rewardCount":30,
      "name":"仙人掌",
      "content":"沙漠仙人掌",
    },
    {
      "icon":"images/chair1.png",
      "rewardCount":50,
      "name":"森气小凳",
      "content":"森林里原生原长的木材制作而成",
    },
    {
      "icon":"images/chair2.png",
      "rewardCount":60,
      "name":"精美装饰",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/chair3.png",
      "rewardCount":70,
      "name":"精美装饰2",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/chair4.png",
      "rewardCount":0,
      "name":"精美装饰3",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/decoration1.png",
      "rewardCount":0,
      "name":"精美装饰4",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/decoration2.png",
      "rewardCount":0,
      "name":"精美装饰5",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/decoration3.png",
      "rewardCount":70,
      "name":"精美装饰6",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/decoration4.png",
      "rewardCount":0,
      "name":"精美装饰7",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/decoration5.png",
      "rewardCount":60,
      "name":"精美装饰8",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/decoration6.png",
      "rewardCount":100,
      "name":"精美装饰9",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/dining_table_1.png",
      "rewardCount":0,
      "name":"精美装饰10",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/dining_table_2.png",
      "rewardCount":0,
      "name":"精美装饰11",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/dining_table_3.png",
      "rewardCount":90,
      "name":"精美装饰12",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/fence1.png",
      "rewardCount":66,
      "name":"精美装饰13",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/game_machine_1.png",
      "rewardCount":0,
      "name":"精美装饰14",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/television1.png",
      "rewardCount":88,
      "name":"精美装饰15",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/television2.png",
      "rewardCount":0,
      "name":"精美装饰16",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/tent1.png",
      "rewardCount":10,
      "name":"精美装饰17",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/tree1.png",
      "rewardCount":0,
      "name":"精美装饰18",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/tree2.png",
      "rewardCount":50,
      "name":"精美装饰19",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/tree3.png",
      "rewardCount":20,
      "name":"精美装饰20",
      "content":"造型精致，色彩完美",
    },
    {
      "icon":"images/tree4.png",
      "rewardCount":0,
      "name":"精美装饰21",
      "content":"造型精致，色彩完美",
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
