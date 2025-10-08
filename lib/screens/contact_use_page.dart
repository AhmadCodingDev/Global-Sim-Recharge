import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/dimens.dart';
import '../base_screen/base_screen.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  ContactUsState createState() => ContactUsState();
}

class ContactUsState extends State<ContactUs> {
  Widget _buildTitleSection() {
    return Padding(
      padding: EdgeInsets.only(left: AppDimens.contactTitleLeftPadding.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppStrings.contactQuestion,
            style: _boldTextStyle(AppDimens.fontSizeL.sp, color: AppColors.textPrimary),
            maxLines: 1,
            minFontSize: AppDimens.fontSizeS.sp.roundToDouble(),
            stepGranularity: 1,
          ),
          SizedBox(height: AppDimens.spaceS.h),
          SizedBox(
            width: 293.w,
            child: AutoSizeText(
              AppStrings.contactSubtitle,
              style: TextStyle(
                color: AppColors.textGray,
                fontSize: AppDimens.fontSizeS.sp,
                fontFamily: 'Afacad',
              ),
              maxLines: 2,
              minFontSize: (AppDimens.fontSizeS - 2).sp.roundToDouble(),
              stepGranularity: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactOption({
    required Widget icon,
    Widget? trailing,
    required String text,
    required double bottomMargin,
  }) {
    trailing ??= Icon(
      Icons.arrow_forward_ios,
      size: AppDimens.contactTrailingIconSize.w,
      color: AppColors.textGray,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radiusM.r),
        color: AppColors.backgroundLight,
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 26,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.contactCardVerticalPadding.h,
        horizontal: AppDimens.contactCardHorizontalPadding.w,
      ),
      margin: EdgeInsets.only(
        bottom: bottomMargin,
        left: AppDimens.contactCardMarginHorizontal.w,
        right: AppDimens.contactCardMarginHorizontal.w,
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: AppDimens.contactIconTextGap.w),
          Expanded(
            child: AutoSizeText(
              text,
              style: _boldTextStyle(AppDimens.fontSizeL.sp, color: AppColors.textGray),
              maxLines: 1,
              minFontSize: AppDimens.fontSizeS.sp.roundToDouble(),
              stepGranularity: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  TextStyle _boldTextStyle(double fontSize, {required Color color}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      fontFamily: 'Afacad',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppStrings.contactUsTitle,
      backgroundColor: AppColors.backgroundLight,
      toolbarPadding: EdgeInsets.only(
        left: AppDimens.contactHeaderLeftPadding.w,
        top: AppDimens.headerTopPadding.h,
        bottom: AppDimens.contactHeaderBottomPadding.h,
        right: AppDimens.contactHeaderRightPadding.w,
      ),
      // REMOVED SAFE AREA PROPERTIES
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimens.spaceS.h),
          _buildTitleSection(),
          SizedBox(height: AppDimens.spaceXL.h),
          _buildContactOption(
            icon: SvgPicture.asset(
              AppAssets.message2,
              width: AppDimens.contactIconSizeSmall.w,
              height: AppDimens.contactIconSizeSmall.h,
            ),
            text: AppStrings.openLiveChat,
            bottomMargin: AppDimens.spacingMediumSmall.h,
          ),
          _buildContactOption(
            icon: SvgPicture.asset(
              AppAssets.whatsapp,
              width: AppDimens.contactIconSizeMedium.w,
              height: AppDimens.contactIconSizeMedium.h,
            ),
            text: AppStrings.openWhatsapp,
            bottomMargin: AppDimens.spacingMediumSmall.h,
          ),
        ],
      ),
    );
  }
}
