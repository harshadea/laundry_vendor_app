import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';

class HomeScreenWidgets {
  /// Single vertical bar data for bar chart widget
  static BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: x.isEven ? const Color(0xFFDED9F9) : AppColors.primaryColor,
          width: 35,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
      ],
    );
  }
}

/// Home page vertical graph widget
class HomeBarChartGraphWidget extends StatefulWidget {
  final Widget Function(double, TitleMeta)? bottomTitleWidgets;
  final Widget Function(double, TitleMeta)? leftTitleWidgets;
  final List<BarChartGroupData>? barChartDataList;
  final BarTooltipItem? Function(BarChartGroupData, int, BarChartRodData, int)?
      toolTips;
  const HomeBarChartGraphWidget(
      {Key? key,
      this.bottomTitleWidgets,
      this.leftTitleWidgets,
      this.toolTips,
      this.barChartDataList})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeBarChartGraphWidgetState();
}

class HomeBarChartGraphWidgetState extends State<HomeBarChartGraphWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: AspectRatio(
        aspectRatio: 1.7,
        child: BarChart(
          BarChartData(
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: AppColors.primaryColor,
                  tooltipMargin: 5,
                  getTooltipItem: widget.toolTips),
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: widget.bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: widget.leftTitleWidgets,
                  reservedSize: 42,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: widget.barChartDataList,
            gridData: FlGridData(
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                      color: AppColors.lineShapeColor,
                      strokeWidth: 1,
                      dashArray: [2, 2]);
                },
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: false),
          ),
        ),
      ),
    );
  }
}

/// Home page single statistic info summery widget
class HomeSingleStatisticsWidget extends StatelessWidget {
  final String localSVGAssetFileName;
  final Color iconColor;
  final String valueText;
  final String subtitleText;
  const HomeSingleStatisticsWidget({
    Key? key,
    required this.iconColor,
    required this.valueText,
    required this.subtitleText,
    required this.localSVGAssetFileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconButtonWidget(
              borderRadiusRadiusValue: const Radius.circular(8),
              backgroundColor: iconColor.withOpacity(0.1),
              child: SvgPicture.asset(
                localSVGAssetFileName,
                color: iconColor,
              )),
          AppGaps.hGap16,
          Text(
            valueText,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          AppGaps.hGap4,
          Text(
            subtitleText,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: AppColors.bodyTextColor),
          )
        ],
      ),
    );
  }
}
