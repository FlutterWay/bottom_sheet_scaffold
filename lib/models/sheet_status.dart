class SheetStatus {
  final double positionY, height, minHeight, maxHeight;

  const SheetStatus(
      {required this.positionY,
      required this.height,
      required this.minHeight,
      required this.maxHeight});
  bool get isOpened => height > minHeight;
  bool get isExpanded => height == maxHeight;
  bool get isCollapsed => height == minHeight;
}
