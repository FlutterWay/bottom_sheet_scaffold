import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../controllers/bottom_sheet_controller.dart';

class DraggableArea extends StatelessWidget {
  final Widget child;
  const DraggableArea({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: Get.find<BottomSheetController>().startDrag,
      onVerticalDragUpdate: Get.find<BottomSheetController>().updateDrag,
      onVerticalDragEnd: Get.find<BottomSheetController>().endDrag,
      child: child,
    );
  }
}
