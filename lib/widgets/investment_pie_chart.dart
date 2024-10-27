import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InvestmentPieChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  InvestmentPieChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: data.map((investment) {
                final value = investment['value'] as double;
                final percentage = investment['percentage'] as double;

                return PieChartSectionData(
                  color: Colors.accents[data.indexOf(investment) % Colors.primaries.length],
                  value: value,
                  title: '${percentage.toStringAsFixed(1)}%',
                  radius: 50,
                  titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                );
              }).toList(),
              centerSpaceRadius: 60,
              titleSunbeamLayout: true,
              borderData: FlBorderData(show: true)
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 4,
          children: data.map((investment) {
            final color = Colors.primaries[data.indexOf(investment) % Colors.primaries.length];
            final name = investment['name'] as String;

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  color: color,
                ),
                const SizedBox(width: 4),
                Text(
                  name,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white70),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
