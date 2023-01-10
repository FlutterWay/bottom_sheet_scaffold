import 'package:bottom_sheet_scaffold/controllers/bottom_sheet_controller.dart';
import 'package:bottom_sheet_scaffold/models/sheet_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetBuilder extends StatelessWidget {
  final Widget Function(SheetStatus status, BuildContext context) builder;
  const BottomSheetBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetController>(builder: (controller) {
      return builder(
          SheetStatus(
              positionY: controller.positionY,
              height: controller.currentHeight,
              minHeight: controller.minHeight,
              maxHeight: controller.maxHeight),
          context);
    });
  }
}
