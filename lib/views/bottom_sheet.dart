import 'package:bottom_sheet_scaffold/bottom_sheet_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_sheet_controller.dart';

class DraggableBottomSheet extends StatelessWidget {
  final double maxHeight, minHeight;
  final bool draggableBody, headerVisibilityOnTap, autoSwipped, gradientOpacity;
  final Widget? header;
  final Widget body;
  final void Function()? onShow;
  final void Function()? onHide;
  final double radius;
  final Color? backgroundColor;
  DraggableBottomSheet(
      {super.key,
      this.maxHeight = 500,
      this.minHeight = 0,
      this.header,
      this.autoSwipped = true,
      this.draggableBody = true,
      this.gradientOpacity = true,
      this.headerVisibilityOnTap = true,
      this.backgroundColor = Colors.white,
      this.onHide,
      this.radius = 15,
      this.onShow,
      required this.body}) {
    if (!GetInstance().isRegistered<BottomSheetController>()) {
      Get.put(BottomSheetController());
    }
    Get.find<BottomSheetController>().maxHeight = maxHeight;
    Get.find<BottomSheetController>().minHeight = minHeight;
    if (minHeight > Get.find<BottomSheetController>().currentHeight) {
      Get.find<BottomSheetController>().currentHeight = minHeight;
    }
    Get.find<BottomSheetController>().autoSwipped = autoSwipped;
    Get.find<BottomSheetController>().onHide = onHide;
    Get.find<BottomSheetController>().onShow = onShow;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetController>(builder: (bottomSheetController) {
      return Positioned(
        bottom: bottomSheetController.currentHeight -
            bottomSheetController.maxHeight,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              if (headerVisibilityOnTap || !BottomSheetPanel.isExpanded)
                DraggableArea(child: header ?? const SizedBox()),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity:
                    !gradientOpacity ? 1 : bottomSheetController.percentHeight,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  width: MediaQuery.of(context).size.width,
                  height: bottomSheetController.maxHeight,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: header == null
                        ? BorderRadius.vertical(top: Radius.circular(radius))
                        : null,
                  ),
                  child: draggableBody ? DraggableArea(child: body) : body,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
