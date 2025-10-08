// base_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? trailing;
  final Color backgroundColor;
  final EdgeInsets? toolbarPadding;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool showBackButton;

  const BaseScreen({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
    this.backgroundColor = Colors.white,
    this.toolbarPadding,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // REMOVED SAFEAREA WRAPPER
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildToolbar(context),
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _buildToolbar(BuildContext context) {
    return Padding(
      padding: toolbarPadding ??
          EdgeInsets.only(
            left: 20.w,
            top: 26.h,
            bottom: 40.h,
            right: 20.w,
          ),
      child: Row(
        children: [
          if (showBackButton)
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                size: 24.w,
                color: const Color(0xFF252525),
              ),
            )
          else
            SizedBox(width: 24.w),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'AFacade',
                  color: const Color(0xFF252525),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          trailing ?? SizedBox(width: 24.w),
        ],
      ),
    );
  }
}
