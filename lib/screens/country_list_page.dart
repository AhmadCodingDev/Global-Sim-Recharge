import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:esim_ui8/views/widgets/custom_bottom_navbar.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/dimens.dart';
import '../base_screen/base_screen.dart';

class CountryListPage extends StatefulWidget {
  const CountryListPage({Key? key}) : super(key: key);

  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  static const String _fontFamily = 'Afacad';
  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() => _currentIndex = index);
  }

  final List<Map<String, String>> _countries = const [
    {'name': 'United Kingdom', 'flag': AppAssets.unitedKingdomFlag},
    {'name': 'Romania',        'flag': AppAssets.romaniaFlag},
    {'name': 'Argentina',      'flag': AppAssets.argentinaFlag},
    {'name': 'Bahrain',        'flag': AppAssets.bahrainFlag},
    {'name': 'Brazil',         'flag': AppAssets.brazilFlag},
    {'name': 'India',          'flag': AppAssets.indiaFlag},
    {'name': 'Japan',          'flag': AppAssets.japanFlag},
    {'name': 'Yemen',          'flag': AppAssets.yemenFlag},
    {'name': 'Sahrawi Arab',   'flag': AppAssets.sahrawiFlag},
    {'name': 'Switzerland',    'flag': AppAssets.switzerlandFlag},
  ];

  Widget _buildCountryCard(Map<String, String> country) {
    return GestureDetector(
      onTap: () {
        // TODO: handle country selection
      },
      child: Container(
        height: AppDimens.buttonHeight,
        decoration: BoxDecoration(
          color: AppColors.countryCardBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.spaceS),
        child: Row(
          children: [
            SvgPicture.asset(
              country['flag']!,
              width: 38.w,
              height: 38.h,
            ),
            SizedBox(width: AppDimens.spacingMediumSmall),
            Expanded(
              child: Text(
                country['name']!,
                style: TextStyle(
                  fontSize: AppDimens.fontSizeM.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textGray,
                  fontFamily: _fontFamily,
                ),
              ),
            ),
            SvgPicture.asset(
              AppAssets.arrowLeft,
              width: AppDimens.contactIconSizeSmall,
              height: AppDimens.contactIconSizeSmall,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppStrings.countryListTitle,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.spaceM,
          horizontal: AppDimens.marginHorizontal,
        ),
        itemCount: _countries.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppDimens.spaceS),
        itemBuilder: (context, index) => _buildCountryCard(_countries[index]),
      ),
    );
  }
}
