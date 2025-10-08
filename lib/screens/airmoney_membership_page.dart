import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:esim_ui8/views/widgets/esim_card.dart';
import 'package:esim_ui8/views/airmoney_membership/widgets/promotion_banner.dart';
import 'package:esim_ui8/views/airmoney_membership/widgets/promotion_banner_2.dart';
import 'package:esim_ui8/views/airmoney_membership/widgets/voucher_section.dart';
import 'package:esim_ui8/views/airmoney_membership/widgets/membership_card.dart';
import 'package:esim_ui8/views/airmoney_membership/widgets/transaction_history.dart';
import 'package:esim_ui8/views/airmoney_membership/widgets/redeem_button.dart';

import '../../constants/app_strings.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/dimens.dart';
import '../base_screen/base_screen.dart';

class AirmoneyMembershipPage extends StatelessWidget {
  const AirmoneyMembershipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppStrings.airmoneyTitle,
      // REMOVED SAFE AREA PROPERTIES
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: AppColors.backgroundLight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PromotionBanner(),
              ESimCard(
                title: AppStrings.providerName,
                logo: AppAssets.item1,
                countries: AppStrings.countryName,
                dataPlan: AppStrings.dataPlan,
                validity: AppStrings.validity,
                price: "\$53.3",
                color: AppColors.esimCard,
                showActionButtons: false,
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimens.marginHorizontal.w,
                  vertical: AppDimens.marginVertical.h,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: AppDimens.cardPaddingVertical.h,
                  horizontal: AppDimens.cardPaddingHorizontal.w,
                ),
              ),
              const VoucherSection(),
              RedeemButton(
                onPressed: () => debugPrint('Redeem pressed'),
              ),
              const MembershipCard(),
              const PromotionBanner2(),
              const TransactionHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
