import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DailyDatasView extends StatefulWidget {
  @override
  _DailyDatasViewState createState() => _DailyDatasViewState();
}

class _DailyDatasViewState extends State<DailyDatasView> {
  int selectedDataIndex = 0;

  List<PieChartSectionData> showingSections(List<double> data) {
    return List.generate(data.length, (i) {
      final isTouched = i == selectedDataIndex;
      final double fontSize = isTouched ? 18 : 14;
      final double radius = isTouched ? 80 : 60;

      return PieChartSectionData(
        color: Colors.primaries[i % Colors.primaries.length],
        value: data[i],
        title: '${data[i].toStringAsFixed(1)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<double> data = [30, 25, 20, 15, 10]; // Örnek veri

    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Datas'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
              sections: showingSections(data),
              centerSpaceRadius: 0,
              startDegreeOffset: -90,
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
              centerSpaceColor: Colors.white,
              pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (event is PointerUpEvent) {
                    selectedDataIndex = -1;
                  } else {
                    selectedDataIndex = pieTouchResponse?.touchedSection?.touchedSectionIndex ?? -1;
                  }
                });
              }),



            ),
          ),
        ),
      ),
    );
  }
}
