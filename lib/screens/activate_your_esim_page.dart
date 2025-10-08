import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_strings.dart';
import '../../constants/dimens.dart';
import '../widgets/esim_setup_page.dart';
import 'widgets/section_header.dart';
import 'widgets/network_card.dart';
import 'widgets/video_player_with_play_button.dart';

class ActivateESimPage extends StatelessWidget {
  const ActivateESimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ESimSetupPage(
      onBottomButtonPressed: () {
        // Handle activation logic
      },
      content: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.pageHorizontalPadding.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppDimens.spacing15.h),
            SectionHeader(
              title: AppStrings.installationGuide,
              description: AppStrings.installationGuideSteps,
              descriptionMaxLines: 6,
              descriptionFontSize: AppDimens.fontSizeXS,
            ),
            SizedBox(height: AppDimens.spacing20.h),
            SectionHeader(
              title: AppStrings.step1Title,
              description: AppStrings.step1Description,
              descriptionFontSize: AppDimens.fontSizeS,
            ),
            SizedBox(height: AppDimens.spacing30.h),
            SectionHeader(
              title: AppStrings.step2Title,
              description: AppStrings.step2Description,
              descriptionMaxLines: 2,
            ),
            SizedBox(height: AppDimens.spacing15.h),
            const NetworkCard(),
            SizedBox(height: AppDimens.spaceXL.h),
            SectionHeader(
              title: AppStrings.setupInstructionsTitle,
              description: AppStrings.setupInstructionsSteps,
              descriptionMaxLines: 5,
              titleFontSize: AppDimens.fontSizeS,
              verticalSpacing: AppDimens.spaceXS,
            ),
            SizedBox(height: AppDimens.spacing64.h),
            SectionHeader(
              title: AppStrings.instructionVideo,
              description: '',
              titleMaxLines: 1,
            ),
            SizedBox(height: AppDimens.spaceXXL.h),
            const VideoPlayerWithPlayButton(),
            SizedBox(height: AppDimens.spacing100.h),
          ],
        ),
      ),
    );
  }
}
