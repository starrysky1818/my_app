import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Page/reward//ui_extension.dart';
import 'application.dart';

class MoveAbleWidget extends StatefulWidget {
  final Widget child;
  final GlobalKey stackKey;
  final double offsetX;
  final double offsetY;

  const MoveAbleWidget(
      {Key? key,
        required this.child,
        required this.stackKey,
        this.offsetX = 0,
        this.offsetY = 0})
      : super(key: key);

  @override
  State<MoveAbleWidget> createState() => _MoveAbleWidgetState();
}

class _MoveAbleWidgetState extends State<MoveAbleWidget> {

  late double stackWidth;

  late double stackHeight;


  final GlobalKey _childKey = GlobalKey();

  late double childWidth;

  late double childHeight;


  late Offset initialOffset;
  var xPosition = 0.0.obs;
  var yPosition = 0.0.obs;

  @override
  void initState() {
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      RenderBox? stackRenderBox =
      widget.stackKey.currentContext?.findRenderObject() as RenderBox?;
      stackWidth = stackRenderBox?.size.width ?? 0;
      stackHeight = stackRenderBox?.size.height ?? 0;


      RenderBox? childRenderBox =
      _childKey.currentContext?.findRenderObject() as RenderBox?;
      childWidth = childRenderBox?.size.width ?? 0;
      childHeight = childRenderBox?.size.height ?? 0;


      Offset newOffset = configOffset(widget.offsetX, widget.offsetY);
      xPosition.value = newOffset.dx;
      yPosition.value = newOffset.dy;
    });
  }


  Offset configOffset(double childX, double childY) {
    double newX = childX;
    double newY = childY;

    if (newX < 0) {
      newX = 0;
    }

    if (newX > (stackWidth - childWidth)) {
      newX = stackWidth - childWidth;
    }

    if (newY < 0) {
      newY = 0;
    }

    if (newY > (stackHeight - max(childHeight - Application.safeBottomPadding, 88.kW))) {
      newY = stackHeight - max(childHeight - Application.safeBottomPadding, 88.kW);
    }

    return Offset(newX, newY);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Positioned(
        top: yPosition.value,
        left: xPosition.value,
        child: GestureDetector(
          child: Container(
            key: _childKey,
            child: widget.child,
          ),
          onPanUpdate: (DragUpdateDetails details) {

            Offset newOffset = configOffset(
              xPosition.value + details.delta.dx,
              yPosition.value + details.delta.dy,
            );
            xPosition.value = newOffset.dx;
            yPosition.value = newOffset.dy;
            // print('x: ${xPosition.value}  y: ${yPosition.value}');
          },
        ),
      );
    });
  }
}