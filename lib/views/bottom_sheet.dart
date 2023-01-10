import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import '../controllers/bottom_sheet_controller.dart';

class DraggableBottomSheet extends StatelessWidget {
  final Smoothness smoothness;
  final double maxHeight, minHeight;
  final bool draggableBody, toggleVisibilityOnTap, canUserSwipe, autoSwipped;
  final Widget? header;
  final Widget body;
  final void Function()? onShow;
  final void Function()? onHide;
  const DraggableBottomSheet(
      {super.key,
      this.smoothness = Smoothness.low,
      this.maxHeight = 500,
      this.minHeight = 0,
      this.header,
      this.autoSwipped = true,
      this.draggableBody = true,
      this.toggleVisibilityOnTap = false,
      this.canUserSwipe = true,
      this.onHide,
      this.onShow,
      required this.body});

  @override
  Widget build(BuildContext context) {
    Get.find<BottomSheetController>().maxHeight = maxHeight;
    Get.find<BottomSheetController>().minHeight = minHeight;
    Get.find<BottomSheetController>().autoSwipped = autoSwipped;
    return SolidBottomSheet(
      controller: Get.find<BottomSheetController>().controller,
      draggableBody: draggableBody,
      smoothness: smoothness,
      toggleVisibilityOnTap: toggleVisibilityOnTap,
      canUserSwipe: canUserSwipe,
      onHide: onHide,
      onShow: onShow,
      autoSwiped: autoSwipped,
      maxHeight: maxHeight,
      minHeight: minHeight,
      headerBar: header ?? const SizedBox(),
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
