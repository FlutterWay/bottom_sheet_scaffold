import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  double positionY = -1;
  int pointers = 0;
  double diff = 0;
  double bodyHeight = 0;
  double maxHeight = 500, minHeight = 0;
  double currentHeight = 0;
  late Duration animationDuration;
  bool autoSwipped = true;
  bool fromTwoFinger = false;
  bool oneFingerScrolling = false;
  bool updated = false;
  bool get oneFinger => pointers == 1;
  get percentHeight => (currentHeight - minHeight).abs() / maxHeight;
  void Function()? onHide, onShow;
  void updateBodyHeight(double height) {
    bodyHeight = height;
  }

  void startDrag(DragStartDetails details) {
    diff = 0;
    positionY = details.globalPosition.dy;
  }

  void updateDrag(DragUpdateDetails details) {
    if ((pointers == 1 && !fromTwoFinger) || updated || !oneFingerScrolling) {
      diff = positionY - details.globalPosition.dy;
      double newHeight = currentHeight + diff;
      if (newHeight > maxHeight) {
        newHeight = maxHeight;
      } else if (newHeight < minHeight) {
        newHeight = minHeight;
      }
      currentHeight = newHeight;
      positionY = details.globalPosition.dy;
      updated = true;
      update();
    }
  }

  void addPointer() {
    pointers++;
    if (pointers == 1) {
      fromTwoFinger = false;
    }
  }

  void removePointer() {
    pointers--;
    if (pointers == 1) {
      fromTwoFinger = true;
    }
  }

  void endDrag(DragEndDetails details) {
    if (updated) {
      if (autoSwipped) {
        if (diff > 0) {
          currentHeight = maxHeight;
          if (onShow != null) {
            onShow!();
          }
        } else {
          currentHeight = minHeight;
          if (onHide != null) {
            onHide!();
          }
        }
      }
      positionY = -1;
      updated = false;
      update();
    }
  }

  void updateHeight(double height) {
    currentHeight = height;
    update();
  }

  void open() {
    currentHeight = maxHeight;
    if (onShow != null) {
      onShow!();
    }
    update();
  }

  void close() {
    currentHeight = minHeight;
    if (onHide != null) {
      onHide!();
    }
    update();
  }
}
