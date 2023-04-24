import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class iVeBarChart extends StatefulWidget {
  List income;
  List expenditure;

  iVeBarChart({
    super.key,
    required this.income,
    required this.expenditure,
  });

  @override
  State<iVeBarChart> createState() => _BarChartState();
}

class _BarChartState extends State<iVeBarChart> {
  var dbref = FirebaseFirestore.instance.collection('UserData');
  num totalExpenditure = 0;
  num totalIncome = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finalToalIncomeExpenditure();
  }

  finalToalIncomeExpenditure() async {
    for (int i = 0; i < widget.income.length; i++) {
      print('the amt = ${widget.income[i]['amount']}');

      setState(() {
        totalIncome += int.parse(widget.income[i]['amount']);
      });
    }

    for (int i = 0; i < widget.expenditure.length; i++) {
      setState(() {
        totalExpenditure += int.parse(widget.expenditure[i]['amount']);
      });
    }
    print('totalIncome = $totalIncome');
    print('totalExpenditure = $totalExpenditure');
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(x: 'Received', amount: totalIncome.toInt()),
      ChartData(x: 'Spent', amount: totalExpenditure.toInt()),
    ];

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      series: [
        StackedColumnSeries(
          dataSource: chartData,
          color: Colors.red,
          xValueMapper: (ChartData ch, _) => ch.x,
          yValueMapper: (ChartData ch, _) => ch.amount,
        ),
      ],
    );
  }
}

class ChartData {
  final String x;
  // final int income;
  // final int expenditure;

  final int amount;

  ChartData({
    required this.x,
    // required this.income,
    // required this.expenditure,
    required this.amount,
  });
}
