library bottom_sheet_scaffold;

import 'package:bottom_sheet_scaffold/controllers/bottom_sheet_controller.dart';
import 'package:get/get.dart';
export 'views/bottom_sheet.dart';
export 'views/bottom_sheet_scaffold.dart';
export 'views/draggable_area.dart';
export 'views/bottom_sheet_builder.dart';

class BottomSheetPanel {
  static void open() {
    Get.find<BottomSheetController>().open();
  }

  static void close() {
    Get.find<BottomSheetController>().close();
  }

  static void updateHeight(double height) {
    Get.find<BottomSheetController>().updateHeight(height);
  }

  static bool get isOpen {
    return Get.find<BottomSheetController>().currentHeight >
        Get.find<BottomSheetController>().minHeight;
  }

  static bool get isExpanded {
    return Get.find<BottomSheetController>().currentHeight ==
        Get.find<BottomSheetController>().maxHeight;
  }

  static bool get isCollapsed {
    return Get.find<BottomSheetController>().currentHeight ==
        Get.find<BottomSheetController>().minHeight;
  }
}
