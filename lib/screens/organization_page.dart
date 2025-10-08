import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../constants/dimens.dart';
import '../../constants/app_strings.dart';
import '../base_screen/base_screen.dart';
import 'widgets/title_section.dart';
import 'widgets/email_input.dart';
import 'widgets/verify_button.dart';
import 'widgets/footer_text.dart';

class Organization extends StatefulWidget {
  const Organization({super.key});

  @override
  OrganizationState createState() => OrganizationState();
}

class OrganizationState extends State<Organization> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _verifyAccount() {
    print('Verifying account with email: ${_emailController.text}');
  }

  TextStyle get _titleStyle => TextStyle(
    fontFamily: AppFonts.afacad,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
    fontSize: AppDimens.fontSizeLarge.sp,
  );

  TextStyle get _subtitleStyle => TextStyle(
    fontFamily: AppFonts.afacad,
    color: AppColors.textGray,
    fontSize: AppDimens.fontSizeSmall.sp,
  );

  TextStyle get _hintStyle => TextStyle(
    fontFamily: AppFonts.afacad,
    color: AppColors.textGray.withOpacity(0.6),
    fontSize: AppDimens.fontSizeLarge.sp,
    fontWeight: FontWeight.bold,
  );

  TextStyle get _inputStyle => TextStyle(
    fontFamily: AppFonts.afacad,
    color: AppColors.textGray,
    fontSize: AppDimens.fontSizeLarge.sp,
    fontWeight: FontWeight.bold,
  );

  TextStyle get _buttonStyle => TextStyle(
    fontFamily: AppFonts.afacad,
    fontSize: AppDimens.fontSizeLarge.sp,
    fontWeight: FontWeight.bold,
  );

  TextStyle get _footerStyle => TextStyle(
    fontFamily: AppFonts.afacad,
    color: AppColors.textGray,
    fontSize: AppDimens.fontSizeExtraSmall.sp,
  );

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.spacing31.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSection(
            title: AppStrings.connectYourAccount,
            subtitle: AppStrings.organizationInviteDescription,
            titleStyle: _titleStyle,
            subtitleStyle: _subtitleStyle,
            verticalSpacing: AppDimens.spacingSmall22.h,
          ),
          EmailInput(
            controller: _emailController,
            focusNode: _emailFocusNode,
            hintText: AppStrings.exampleEmail,
            hintStyle: _hintStyle,
            inputStyle: _inputStyle,
            bottomMargin: AppDimens.spacing19.h,
          ),
          VerifyButton(
            onPressed: _verifyAccount,
            text: AppStrings.verifyAccount,
            style: _buttonStyle,
          ),
          FooterText(
            text: AppStrings.organizationFooterText,
            style: _footerStyle,
            topMargin: AppDimens.spacing19.h,
            bottomMargin: AppDimens.spacing32.h,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppStrings.organizationTitle,
      child: _buildContent(),
    );
  }
}
