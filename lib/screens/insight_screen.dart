import 'package:ecomikstoreapp/models/fake_data.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/insight_screen_widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Get screen size
    final graphLabelTextStyle = Theme.of(context)
        .textTheme
        .caption
        ?.copyWith(color: AppColors.bodyTextColor);
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Insight')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
          child: CustomScrollView(
        slivers: [
          // Top extra spaces
          const SliverToBoxAdapter(child: AppGaps.hGap15),
          /* <---- 3 statistics summery widgets ----> */
          SliverToBoxAdapter(
            child: SizedBox(
              height: 131,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /* <---- Orders total data widget ----> */
                      Container(
                        height: 131,
                        width: 130,
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFBEFE2),
                            borderRadius: BorderRadius.all(
                                AppComponents.defaultBorderRadius)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomIconButtonWidget(
                                borderRadiusRadiusValue:
                                    const Radius.circular(8),
                                backgroundColor: AppColors.secondaryColor,
                                child: SvgPicture.asset(
                                  AppAssetImages.cartSVGLogoLine,
                                  color: Colors.white,
                                )),
                            AppGaps.hGap16,
                            Text(
                              '45',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            AppGaps.hGap4,
                            Text(
                              'Top selling items',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(color: AppColors.bodyTextColor),
                            )
                          ],
                        ),
                      ),
                      AppGaps.wGap16,
                      /* <---- Ride total data widget ----> */
                      Container(
                        height: 131,
                        width: 130,
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                            color: Color(0xFFEEECFA),
                            borderRadius: BorderRadius.all(
                                AppComponents.defaultBorderRadius)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomIconButtonWidget(
                                borderRadiusRadiusValue:
                                    const Radius.circular(8),
                                backgroundColor: AppColors.primaryColor,
                                child: SvgPicture.asset(
                                  AppAssetImages.cartSVGLogoLine,
                                  color: Colors.white,
                                )),
                            AppGaps.hGap16,
                            Text(
                              '68km',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            AppGaps.hGap4,
                            Text(
                              'Ride',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(color: AppColors.bodyTextColor),
                            )
                          ],
                        ),
                      ),
                      AppGaps.wGap16,
                      /* <---- Earning total data widget ----> */
                      Container(
                        height: 131,
                        width: 130,
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                            color: Color(0xFFE7F5FD),
                            borderRadius: BorderRadius.all(
                                AppComponents.defaultBorderRadius)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomIconButtonWidget(
                                borderRadiusRadiusValue:
                                    const Radius.circular(8),
                                backgroundColor: AppColors.tertiaryColor,
                                child: SvgPicture.asset(
                                  AppAssetImages.walletSVGLogoDualTone,
                                  color: Colors.white,
                                )),
                            AppGaps.hGap16,
                            Text(
                              '\$238.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            AppGaps.hGap4,
                            Text(
                              'Earnings',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(color: AppColors.bodyTextColor),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          const SliverToBoxAdapter(child: AppGaps.hGap32),
          /* <---- 'Earnings' text and today dropdown menu button ----> */
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Earnings',
                  style: Theme.of(context).textTheme.headline4,
                ),
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
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor),
                        ),
                        AppGaps.wGap2,
                        SvgPicture.asset(AppAssetImages.arrowDown2SVGLogoSolid,
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
          const SliverToBoxAdapter(child: AppGaps.hGap32),
          /* <---- Earning line graph widget ----> */
          SliverToBoxAdapter(
            child: InsightLineGraphWidget(
              spots: const [
                FlSpot(0, 75),
                FlSpot(10, 50),
                FlSpot(20, 65),
                FlSpot(30, 57),
                FlSpot(40, 70),
                FlSpot(50, 25),
                FlSpot(60, 75),
                FlSpot(70, 70),
                FlSpot(80, 110),
                FlSpot(90, 105),
                FlSpot(100, 150),
                FlSpot(110, 75),
                FlSpot(120, 120),
                FlSpot(130, 125),
                FlSpot(140, 130),
                FlSpot(150, 75),
                FlSpot(160, 50),
                FlSpot(170, 55),
                FlSpot(180, 25),
                FlSpot(190, 75),
                FlSpot(200, 50),
                FlSpot(210, 60),
                FlSpot(220, 50),
              ],
              leftTitleWidgets: (double value, TitleMeta meta) {
                String text;
                switch (value.toInt()) {
                  case 0:
                    text = '0';
                    break;
                  case 50:
                    text = '50';
                    break;
                  case 100:
                    text = '100';
                    break;
                  case 150:
                    text = '150';
                    break;
                  case 200:
                    text = '200';
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
                    text = '10:00';
                    break;
                  case 44:
                    text = '11:00';
                    break;
                  case 88:
                    text = '12:00';
                    break;
                  case 132:
                    text = '13:00';
                    break;
                  case 176:
                    text = '14:00';
                    break;
                  case 220:
                    text = '15:00';
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
            ),
          ),
          const SliverToBoxAdapter(child: AppGaps.hGap32),
          /* <---- 'Top selling items' and 'Total 234 items sales' text row ----> */
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Top selling items',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text('Total 234 items sales',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: AppColors.bodyTextColor)),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: AppGaps.hGap16),
          /* <---- Top selling items list ----> */
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            final myOrder = FakeData.myOrders[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomListTileWidget(
                  hasShadow: true,
                  paddingValue: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: myOrder.productImage,
                                fit: BoxFit.cover)),
                      ),
                      AppGaps.wGap16,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myOrder.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            AppGaps.hGap5,
                            Text(
                              '293 sales',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(color: AppColors.bodyTextColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          }, childCount: FakeData.myOrders.length)),
          // Bottom extra spaces
          const SliverToBoxAdapter(child: AppGaps.hGap30),
        ],
      )),
    );
  }
}
