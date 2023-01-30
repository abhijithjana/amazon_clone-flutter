import 'package:amazon_clone/features/admin/model/sales.dart';
import 'package:charts_flutter/flutter.dart%20';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;

class Category_chart extends StatelessWidget {
  final List<chart.Series<Sales, String>> serieslist;
  const Category_chart({super.key, required this.serieslist});

  @override
  Widget build(BuildContext context) {
    return chart.BarChart(
      serieslist,
    );
  }
}
