// ignore_for_file: deprecated_member_use

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class StartedProjectChart extends StatelessWidget {
  const StartedProjectChart({super.key});

  static List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 14, bottom: 12, left: 12, right: 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Projects', style: AppStyle.poppinsMedium15),
              Text(
                'This Year',
                style: AppStyle.robotoCondensedMedium12
                    .copyWith(color: AppColors.primary),
              ),
            ],
          ),
          verticalSpace(18),
          SizedBox(
            height: 270,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: 10,
                gridData: FlGridData(
                  horizontalInterval: 2,
                  verticalInterval: 1,
                  show: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: AppColors.grey,
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: AppColors.grey,
                      strokeWidth: 1,
                    );
                  },
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
                      reservedSize: 20,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          months[value.toInt()],
                          style: AppStyle.robotoRegular10
                              .copyWith(color: AppColors.darkGrey, height: 2),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: AppStyle.robotoRegular10
                              .copyWith(color: AppColors.darkGrey),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: AppColors.grey,
                    width: 1,
                  ),
                ),
                lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) {
                    return AppColors.white;
                  },
                  tooltipRoundedRadius: 8,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      return LineTooltipItem(
                        '${spot.y.toInt()}\n${months[spot.x.toInt()]}',
                        AppStyle.robotoSemiBold12
                            .copyWith(color: AppColors.black),
                      );
                    }).toList();
                  },
                )),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(1, 1),
                      FlSpot(2, 9),
                      FlSpot(3, 3.2),
                      FlSpot(4, 7),
                      FlSpot(5, 3),
                    ],
                    belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary.withOpacity(0.75),
                            AppColors.primary.withOpacity(0.5),
                            AppColors.primary.withOpacity(0.25),
                          ],
                        )),
                    isCurved: true,
                    color: AppColors.primary,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                        radius: 4.5,
                        color: AppColors.primary,
                        strokeWidth: 2,
                        strokeColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
