import 'dart:math';

import 'package:flutter/material.dart';

class CardioGraph extends StatefulWidget {
  const CardioGraph({Key? key}) : super(key: key);

  @override
  State<CardioGraph> createState() => _CardioGraphState();
}

class _CardioGraphState extends State<CardioGraph> {
  // late List<_SalesData> data;
  // int count = 11;
  //
  // @override
  // void initState() {
  //   data = [
  //     _SalesData(1, 35),
  //     _SalesData(2, 28),
  //     _SalesData(3, 34),
  //     _SalesData(4, 26),
  //     _SalesData(5, 35),
  //     _SalesData(6, 28),
  //     _SalesData(7, 32),
  //     _SalesData(8, 28),
  //     _SalesData(9, 32),
  //     _SalesData(10, 35),
  //   ];
  //   super.initState();
  // }
  //
  // // Initialized a global variable for ChartSeriesController class
  // ChartSeriesController? _chartSeriesController;
  //
  // addChartData() {
  //   setState(
  //     () {
  //       data = getChartData();
  //     },
  //   );
  // }
  //
  // double getRandomInt(double min, double max) {
  //   final Random random = Random();
  //   return min + random.nextInt((max - min).toInt());
  // }
  //
  // List<_SalesData> getChartData() {
  //   data.add(
  //     _SalesData(
  //       count.floor(),
  //       getRandomInt(20, 50),
  //     ),
  //   );
  //   count = count + 1;
  //   return data;
  // }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Container(
      height: media.size.height * 0.6,
      width: media.size.width * 0.75,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(15),
      ),
      // child: ClipRRect(
      //   borderRadius: BorderRadius.circular(15),
      //   child: Column(
      //     children: [
      //       SfCartesianChart(
      //         backgroundColor: Colors.white,
      //         plotAreaBorderWidth: 0,
      //         primaryXAxis: NumericAxis(
      //           majorGridLines: const MajorGridLines(
      //             width: 0,
      //           ),
      //           edgeLabelPlacement: EdgeLabelPlacement.shift,
      //         ),
      //         primaryYAxis: NumericAxis(
      //           majorGridLines: const MajorGridLines(width: 0),
      //           minimum: 20,
      //           maximum: 50,
      //           interval: 5,
      //         ),
      //         series: <ChartSeries<_SalesData, num>>[
      //           LineSeries<_SalesData, num>(
      //             // Animation duration for this line series set to 2000
      //             animationDuration: 2000,
      //             onRendererCreated: (ChartSeriesController controller) {
      //               _chartSeriesController = controller;
      //             },
      //             dataSource: data,
      //             xValueMapper: (_SalesData sales, _) => sales.year,
      //             yValueMapper: (_SalesData sales, _) => sales.sales,
      //             name: 'Sales',
      //           ),
      //         ],
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           Container(
      //             child: ButtonTheme(
      //               minWidth: 40.0,
      //               height: 30.0,
      //               child: ElevatedButton(
      //                 onPressed: () {
      //                   _chartSeriesController?.animate();
      //                 },
      //                 child: const Text(
      //                   'Animate line series',
      //                   textScaleFactor: 1,
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           ButtonTheme(
      //             minWidth: 40.0,
      //             height: 30.0,
      //             child: ElevatedButton(
      //               onPressed: () {
      //                 addChartData();
      //               },
      //               child: const Text(
      //                 'Add data point',
      //                 textScaleFactor: 1,
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
//
// class _SalesData {
//   _SalesData(this.year, this.sales);
//
//   final int year;
//   final double sales;
// }
