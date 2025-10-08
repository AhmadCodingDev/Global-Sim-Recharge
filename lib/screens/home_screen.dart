import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_colors.dart';
import '../../constants/dimens.dart';
import '../../models/country_model.dart';
import '../../models/destination_model.dart';
import '../../models/dummy_data.dart';
import '../../router/app_router.dart';
import '../country_list/country_list_page.dart';
import '../details/widgets/app_header_main.dart';
import '../my_sim/my_sim_page.dart';
import '../package_page/package_page.dart';
import '../secure_checkout/secure_checkout_page.dart';
import '../wallet/saved/saved_card.dart';
import '../wallet/wallet_page_1.dart' show WalletPage;
import '../wallet_main/wallet_main_page.dart' hide WalletPage;
import '../widgets/menu_scaffold.dart';
import 'home_screen_helper.dart';
import 'widgets/country_item.dart';
import 'widgets/destination_card.dart';
import 'widgets/logout_popup_widget.dart';
import 'widgets/plan_card_widget.dart';
import 'widgets/regional_listview_widget.dart';
import 'widgets/search_bar_widget_2.dart';
import 'widgets/segmented_filter.dart';
import 'widgets/select_plan_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = AppRouter.homeScreen;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenHelper _helper;
  final List<Color> _planCardColors = [
    AppColors.esimCard,
    const Color(0xFFD6F2E5),
    const Color(0xFFF9E1D9),
    const Color(0xFFE5D8F0),
    const Color(0xFFF7F3E6),
  ];

  @override
  void initState() {
    super.initState();
    _helper = HomeScreenHelper();
    _helper.init();
  }

  @override
  void dispose() {
    _helper.dispose();
    super.dispose();
  }

  void _onHomeTap() => _helper.onHomeTap();

  void _navigateToWalletOnboarding() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WalletPage(
          onNext: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SaveCard(
                  onBack: () => Navigator.pop(context),
                  onNext: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    _helper.completeWalletOnboarding();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool> _handleBackPressed() async {
    final action = _helper.handleBackPressed();
    switch (action) {
      case BackPressAction.popTab:
        return false;
      case BackPressAction.showSnackBar:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Press back again to exit'),
            duration: Duration(seconds: 2),
          ),
        );
        return false;
      case BackPressAction.showLogoutDialog:
        _showLogoutDialog();
        return false;
      default:
        return false;
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (_) => LogoutDialog(
        onCancel: () => Navigator.pop(context),
        onLogout: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildContentForFilter() {
    return _helper.buildContentForFilter(
      context: context,
      buildPopularDestinations: _buildPopularDestinations,
      buildCountryList: _buildCountryList,
      buildGlobalContent: _buildGlobalContent,
    );
  }

  Widget _buildPopularDestinations(List<Destination> items) {
    return Padding(
      padding: EdgeInsets.only(left: AppDimens.marginHorizontal.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppStrings.popularDestinations,
            maxLines: 1,
            style: GoogleFonts.inter(
              fontSize: AppDimens.fontSizeM.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppDimens.spaceS.h),
          SizedBox(
            height: 166.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (_, __) =>
                  SizedBox(width: AppDimens.spaceS.w),
              padding: EdgeInsets.only(
                left: 0,
                right: AppDimens.marginHorizontal.w,
              ),
              itemBuilder: (_, idx) => SizedBox(
                width: 227.w,
                child: DestinationCard(destination: items[idx]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountryList(List<Country> countries) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.marginHorizontal.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppStrings.countrySectionTitle,
            maxLines: 1,
            style: GoogleFonts.inter(
              fontSize: AppDimens.fontSizeM.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppDimens.spaceS.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: countries.length,
            itemBuilder: (_, i) {
              final c = countries[i];
              return Padding(
                padding: EdgeInsets.only(bottom: AppDimens.spaceS.h),
                child: GestureDetector(
                  onTap: () {
                    if (c.name == 'United Kingdom') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const CountryListPage(),
                        ),
                      );
                    }
                  },
                  child: CountryItem(country: c),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGlobalContent() {
    final plans = DummyData.globalPlans;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.marginHorizontal.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SelectPlanWidget(),
          SizedBox(height: AppDimens.spaceM.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: plans.length,
            itemBuilder: (_, idx) {
              final plan = plans[idx];
              return Padding(
                padding: EdgeInsets.only(bottom: AppDimens.spaceM.h),
                child: GestureDetector(
                  onTap: () {
                    if (idx == 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const SecureCheckoutPage(),
                        ),
                      );
                    } else if (!_helper.stateNotifier.value.walletOnboarded) {
                      _navigateToWalletOnboarding();
                    } else {
                      _helper.setCurrentNavIndex(2);
                    }
                  },
                  child: PlanCard(
                    provider: plan.provider,
                    country: plan.country,
                    dataInfo: plan.dataInfo,
                    validity: plan.validity,
                    price: plan.price,
                    providerImagePath: plan.image,
                    backgroundColor: _planCardColors[idx],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeScreenState>(
      valueListenable: _helper.stateNotifier,
      builder: (context, state, _) {
        return WillPopScope(
          onWillPop: _handleBackPressed,
          child: MenuScaffold(
            backgroundColor: Colors.white,
            showNavBar: state.showNavBar,
            currentNavIndex: state.currentNavIndex,
            onNavTap: (idx) {
              if (idx == 2 && !state.walletOnboarded) {
                _navigateToWalletOnboarding();
              } else {
                _helper.setCurrentNavIndex(idx);
              }
            },
            onHomeTap: _onHomeTap,
            child: LayoutBuilder(
              builder: (context, constraints) {
                switch (state.currentNavIndex) {
                  case 0:
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                        child: Column(
                          children: [
                            Builder(builder: (innerCtx) {
                              return AppHeaderMain(
                                onProfileTap: innerCtx.toggleMenu!,
                                userName: AppStrings.jhonHead,
                                balance: '\$54.65',
                              );
                            }),
                            SizedBox(height: AppDimens.spaceM.h),
                            SearchBarWidget(controller: _helper.searchController),
                            SizedBox(height: AppDimens.spaceL.h),
                            SegmentedFilter(
                              selectedIndex: state.selectedFilter,
                              onTap: _helper.setSelectedFilter,
                            ),
                            SizedBox(height: AppDimens.spaceM.h),
                            _buildContentForFilter(),
                          ],
                        ),
                      ),
                    );
                  case 1:
                    return const CurrentEsim();
                  case 2:
                    return state.walletOnboarded
                        ? const PackagePage()
                        : const SizedBox.shrink();
                  case 3:
                    return WalletMainPage(
                      onWalletMembershipOpened: () =>
                          _helper.setShowNavBar(false),
                      onWalletMembershipClosed: () =>
                          _helper.setShowNavBar(true),
                    );
                  default:
                    return Container();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
