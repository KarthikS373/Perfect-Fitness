import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

class Chart extends StatelessWidget {
  final List<SensorValue> _data;

  const Chart(this._data);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.8,
      child: TimeSeriesChart(
        [
          Series<SensorValue, DateTime>(
            id: 'Values',
            colorFn: (_, __) => MaterialPalette.green.shadeDefault,
            domainFn: (SensorValue values, _) => values.time,
            measureFn: (SensorValue values, _) => values.value,
            data: _data,
          ),
        ],
        animate: false,
        primaryMeasureAxis: const NumericAxisSpec(
          tickProviderSpec: BasicNumericTickProviderSpec(
            zeroBound: false,
          ),
          renderSpec: NoneRenderSpec(),
        ),
        domainAxis: const DateTimeAxisSpec(
          renderSpec: NoneRenderSpec(),
        ),
      ),
    );
  }
}

class SensorValue {
  final DateTime time;
  final double value;

  SensorValue(this.time, this.value);
}