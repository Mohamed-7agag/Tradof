import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../data/model/income_statistics_model.dart';
import '../logic/cubit/finances_cubit.dart';

class IncomeChart extends StatefulWidget {
  const IncomeChart({super.key});
  @override
  State<StatefulWidget> createState() => IncomeChartState();
}

class IncomeChartState extends State<IncomeChart> {
  final double width = 4.5;
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;
  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    context.read<FinancesCubit>().getIncomeStatistics();
    rawBarGroups = [];
    showingBarGroups = [];
  }

  List<BarChartGroupData> _generateBarGroups(IncomeStatisticsModel? data) {
    if (data == null || data.yearlyData.isEmpty) return [];

    final yearData = data.yearlyData.values.first;
    final monthNames = _getMonthNames(data);

    final List<BarChartGroupData> groups = [];

    for (int i = 0; i < monthNames.length; i++) {
      final month = monthNames[i];
      final monthData = yearData[month]!;
      final pending = monthData['pending']?.toDouble() ?? 0;
      final previous = monthData['previous']?.toDouble() ?? 0;

      groups.add(makeGroupData(i, pending, previous));
    }

    return groups;
  }

  List<String> _getMonthNames(IncomeStatisticsModel? data) {
    if (data == null || data.yearlyData.isEmpty) return [];
    final yearData = data.yearlyData.values.first;
    final monthNames = yearData.keys.toList();
    monthNames.sort((a, b) => _getMonthIndex(a).compareTo(_getMonthIndex(b)));
    return monthNames;
  }

  int _getMonthIndex(String month) {
    const monthOrder = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return monthOrder.indexOf(month);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinancesCubit, FinancesState>(
      buildWhen: (previous, current) => _buildWhen(current),
      builder: (context, state) {
        if (state.status.isGetIncomeStatisticsSuccess) {
          final newBarGroups = _generateBarGroups(state.incomeStatisticsModel);
          if (newBarGroups.isNotEmpty) {
            rawBarGroups = newBarGroups;
            showingBarGroups = List.of(rawBarGroups);
          }

          final monthNames = _getMonthNames(state.incomeStatisticsModel);

          return SizedBox(
            height: 310.h,
            width: 1.sw,
            child: AspectRatio(
              aspectRatio: 1,
              child: BarChart(
                BarChartData(
                  maxY:
                      (state.incomeStatisticsModel?.maxValue.toDouble() ?? 0) *
                          1.25,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final month = monthNames[groupIndex];
                        final value = rod.toY;
                        final String title =
                            rodIndex == 0 ? 'Pending' : 'Previous';
                        return BarTooltipItem(
                          '$month\n$title: ${value.toStringAsFixed(2)}',
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                            barRods: showingBarGroups[touchedGroupIndex]
                                .barRods
                                .map((rod) {
                              return rod.copyWith(
                                toY: avg,
                                color: AppColors.primary,
                              );
                            }).toList(),
                          );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(),
                    topTitles: const AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) =>
                            _bottomTitles(value, meta, monthNames),
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: _calculateInterval(
                            (state.incomeStatisticsModel?.maxValue.toDouble() ??
                                    0) *
                                1.25),
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
          );
        } else if (state.status.isGetIncomeStatisticsFailure) {
          return CustomFailureWidget(
            text: state.errorMessage,
            onRetry: () => context.read<FinancesCubit>().getIncomeStatistics(),
          );
        }
        return const SizedBox(
          height: 350,
          child: CustomLoadingWidget(),
        );
      },
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta, List<String> monthNames) {
    if (value.toInt() >= monthNames.length) return const SizedBox.shrink();

    final Widget text = Text(
      monthNames[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      meta: meta,
      space: 16,
      child: text,
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    String formattedValue;
    if (value >= 1000000) {
      formattedValue = '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      formattedValue = '${(value / 1000).toStringAsFixed(1)}k';
    } else {
      formattedValue = value.toInt().toString();
    }

    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: FittedBox(
          fit: BoxFit.scaleDown, child: Text(formattedValue, style: style)),
    );
  }

  double _calculateInterval(double? maxValue) {
    if (maxValue == null || maxValue <= 0) return 5;
    return (maxValue / 5).ceilToDouble();
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 3.5,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: AppColors.primary,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: AppColors.lightOrange,
          width: width,
        ),
      ],
    );
  }
  bool _buildWhen(FinancesState current) {
    return current.status.isGetIncomeStatisticsSuccess ||
        current.status.isGetIncomeStatisticsFailure ||
        current.status.isGetIncomeStatisticsLoading;
  }
}
