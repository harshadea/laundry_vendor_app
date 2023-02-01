import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Graph label text style
    final graphLabelTextStyle = Theme.of(context)
        .textTheme
        .caption
        ?.copyWith(color: AppColors.bodyTextColor);
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context,
          hasBackButton: false,
          titleWidget: const Text('Home')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: CustomScrollView(
          slivers: [
            /* <---- Top extra spaces ----> */
            const SliverToBoxAdapter(child: AppGaps.hGap15),
            /* <---- Product categories grid list ----> */
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Analytics overview',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap16),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: AppGaps.screenPaddingValue,
                  mainAxisSpacing: AppGaps.screenPaddingValue,
                  mainAxisExtent: 162,
                  crossAxisCount: 2,
                  childAspectRatio: 1),
              delegate: SliverChildListDelegate([
                const CustomGridSingleItemWidget(
                  child: HomeSingleStatisticsWidget(
                    iconColor: AppColors.primaryColor,
                    localSVGAssetFileName: AppAssetImages.walletSVGLogoSolid,
                    valueText: '\$56784',
                    subtitleText: 'Total sales',
                  ),
                ),
                const CustomGridSingleItemWidget(
                  child: HomeSingleStatisticsWidget(
                    iconColor: AppColors.tertiaryColor,
                    localSVGAssetFileName: AppAssetImages.groupSVGLogoSolid,
                    valueText: '2K+',
                    subtitleText: 'Total customers',
                  ),
                ),
                const CustomGridSingleItemWidget(
                  child: HomeSingleStatisticsWidget(
                    iconColor: AppColors.secondaryColor,
                    localSVGAssetFileName:
                        AppAssetImages.boxNoBorderSVGLogoSolid,
                    valueText: '689+',
                    subtitleText: 'New products',
                  ),
                ),
                const CustomGridSingleItemWidget(
                  child: HomeSingleStatisticsWidget(
                    iconColor: AppColors.successColor,
                    localSVGAssetFileName:
                        AppAssetImages.connectionSVGLogoSolid,
                    valueText: '348',
                    subtitleText: 'Pending orders',
                  ),
                ),
              ]),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap32),
            /* <---- 'Earnings' text and date dropdown menu row ----> */
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Earnings',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  /* <---- Date wise dropdown menu ----> */
                  PopupMenuButton<int>(
                      padding: const EdgeInsets.only(right: 5),
                      position: PopupMenuPosition.under,
                      // icon: const Icon(Icons.more_vert_rounded, color: AppColors.darkColor),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Today',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor),
                          ),
                          AppGaps.wGap2,
                          SvgPicture.asset(
                              AppAssetImages.arrowDown2SVGLogoSolid,
                              height: 12,
                              width: 12,
                              color: AppColors.primaryColor),
                        ],
                      ),
                      itemBuilder: (context) => [
                            const PopupMenuItem<int>(
                              value: 0,
                              // padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                'Yesterday',
                                textAlign: TextAlign.center,
                              ),
                            )
                          ]),
                ],
              ),
            ),
            /* <---- Vertical bar graph ----> */
            SliverToBoxAdapter(
              child: HomeBarChartGraphWidget(
                  barChartDataList: [
                    HomeScreenWidgets.makeGroupData(0, 1600),
                    HomeScreenWidgets.makeGroupData(1, 2500),
                    HomeScreenWidgets.makeGroupData(2, 1550),
                    HomeScreenWidgets.makeGroupData(3, 2700),
                    HomeScreenWidgets.makeGroupData(4, 2300),
                    HomeScreenWidgets.makeGroupData(5, 1600),
                    HomeScreenWidgets.makeGroupData(6, 1500),
                  ],
                  leftTitleWidgets: (double value, TitleMeta meta) {
                    String text;
                    switch (value.toInt()) {
                      case 0:
                        text = '0';
                        break;
                      case 500:
                        text = '500';
                        break;
                      case 1000:
                        text = '1000';
                        break;
                      case 1500:
                        text = '1500';
                        break;
                      case 2000:
                        text = '2000';
                        break;
                      default:
                        return AppGaps.emptyGap;
                    }

                    return Text(text,
                        style: graphLabelTextStyle, textAlign: TextAlign.left);
                  },
                  bottomTitleWidgets: (double value, TitleMeta meta) {
                    String text;
                    switch (value.toInt()) {
                      case 0:
                        text = 'Feb';
                        break;
                      case 1:
                        text = 'Mar';
                        break;
                      case 2:
                        text = 'Apr';
                        break;
                      case 3:
                        text = 'May';
                        break;
                      case 4:
                        text = 'Jun';
                        break;
                      case 5:
                        text = 'Jul';
                        break;
                      case 6:
                        text = 'Aug';
                        break;
                      default:
                        return AppGaps.emptyGap;
                    }
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 8.0,
                      child: Text(
                        text,
                        style: graphLabelTextStyle,
                      ),
                    );
                  },
                  toolTips: (group, groupIndex, rod, rodIndex) {
                    String amount;
                    switch (group.x.toInt()) {
                      case 0:
                        amount = '155.23';
                        break;
                      case 1:
                        amount = '195.52';
                        break;
                      case 2:
                        amount = '150.00';
                        break;
                      case 3:
                        amount = '250.05';
                        break;
                      case 4:
                        amount = '201.55';
                        break;
                      case 5:
                        amount = '170.33';
                        break;
                      case 6:
                        amount = '120.23';
                        break;
                      default:
                        amount = '';
                    }
                    return BarTooltipItem(
                      amount.isEmpty ? '' : '\$$amount',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    );
                  }),
            ),
            /* <---- 'Send to bank' text button ----> */
            SliverToBoxAdapter(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomTightTextButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppPageNames.sendToBankScreen);
                    },
                    child: const Text(
                      'Send to bank',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))
              ],
            )),
            /* <---- Bottom extra spaces ----> */
            const SliverToBoxAdapter(child: AppGaps.hGap30),
          ],
        ),
      ),
    );
  }
}
