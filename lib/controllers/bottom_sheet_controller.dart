import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class BottomSheetController extends GetxController {
  double positionY = -1;
  double diff = 0;
  double bodyHeight = 0;
  double maxHeight = 500, minHeight = 0;
  double currentHeight = 0;
  bool autoSwipped = true;
  get percentHeight => currentHeight / maxHeight;

  late SolidController controller;
  BottomSheetController() {
    controller = SolidController();
  }
  void updateBodyHeight(double height) {
    bodyHeight = height;
  }

  void startDrag(DragStartDetails details) {
    diff = 0;
    positionY = details.globalPosition.dy;
  }

  void updateDrag(DragUpdateDetails details) {
    diff = positionY - details.globalPosition.dy;
    double newHeight = controller.height + diff;
    if (newHeight > maxHeight) {
      newHeight = maxHeight;
    } else if (newHeight < minHeight) {
      newHeight = minHeight;
    }
    currentHeight = newHeight;
    controller.height = newHeight;
    positionY = details.globalPosition.dy;
    update();
  }

  void endDrag(DragEndDetails details) {
    if (autoSwipped) {
      if (diff > 0) {
        controller.height = maxHeight;
        currentHeight = maxHeight;
      } else {
        controller.height = minHeight;
        currentHeight = minHeight;
      }
    }
    positionY = -1;
    update();
  }

  void updateHeight(double height) {
    controller.height = height;
    currentHeight = height;
    update();
  }

  void open() {
    controller.height = maxHeight;
    currentHeight = maxHeight;
    update();
  }

  void close() {
    controller.height = minHeight;
    currentHeight = minHeight;
    update();
  }
}
