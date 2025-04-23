import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class IncomeChart extends StatelessWidget {
  const IncomeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildChartContainer(
      child: BarChart(
        BarChartData(
          maxY: 600,
          barGroups: _createBarGroups(),
          barTouchData: _createBarTouchData(),
          gridData: _createGridData(),
          titlesData: _createTitlesData(),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  Widget _buildChartContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 22, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 1.sw,
      height: 350,
      child: child,
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    final List<double> barValues = [220, 270, 180, 400, 110, 550];
    return List.generate(
      barValues.length,
      (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(toY: barValues[index], color: AppColors.primary)
        ],
      ),
    );
  }

  BarTouchData _createBarTouchData() {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          return BarTooltipItem(
            '${rod.toY}',
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          );
        },
      ),
    );
  }

  FlGridData _createGridData() {
    return FlGridData(
      verticalInterval: 1,
      horizontalInterval: 100,
      getDrawingHorizontalLine: (value) {
        return const FlLine(
          color: AppColors.cardDarkColor,
          strokeWidth: 1,
        );
      },
    );
  }

  FlTitlesData _createTitlesData() {
    return const FlTitlesData(
      rightTitles: AxisTitles(),
      topTitles: AxisTitles(),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: _bottomTitles,
          reservedSize: 42,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 42,
          getTitlesWidget: _leftTitles,
          interval: 100,
        ),
      ),
    );
  }
}

Widget _bottomTitles(double value, TitleMeta meta) {
  final titles = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
  return SideTitleWidget(
    meta: meta,
    space: 16,
    child: Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    ),
  );
}

Widget _leftTitles(double value, TitleMeta meta) {
  
  return SideTitleWidget(
    meta: meta,
    space: 10,
    child: Text(
      value.toInt().toString(),
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    ),
  );
}
