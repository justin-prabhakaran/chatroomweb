import 'package:flutter/material.dart';

import 'colors.dart';

class LoadingOverlay {
  static OverlayEntry? overlayEntry;

  static void show(BuildContext context) {
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Center(
        child: Container(
          width: 100.0, // Adjust according to your needs
          height: 100.0, // Adjust according to your needs
          decoration: BoxDecoration(
            color: AppColor.light,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  static void hide() {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}
