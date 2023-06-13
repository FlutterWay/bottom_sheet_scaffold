import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottom_sheet_controller.dart';
import 'bottom_sheet_builder.dart';

class BarrierViewer extends StatelessWidget {
  final Widget? child;
  const BarrierViewer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return BottomSheetBuilder(
      builder: (status, context) {
        return AnimatedContainer(
            duration: Get.find<BottomSheetController>().animationDuration,
            width: double.infinity,
            height: double.infinity,
            color: status.isOpened
                ? Get.find<BottomSheetController>()
                    .barrierColor
                    .withOpacity(0.5)
                : Colors.transparent,
            child: child);
      },
    );
  }
}
