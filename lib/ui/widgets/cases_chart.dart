import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CasesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CasesChart(this.seriesList, {this.animate});

  // Creates a [LineChart] with sample data and no transition.
  factory CasesChart.withSampleData() {
    return new CasesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2020, 1, 30), 3),
      new TimeSeriesSales(new DateTime(2020, 3, 5), 2),
      new TimeSeriesSales(new DateTime(2020, 3, 6), 1),
      new TimeSeriesSales(new DateTime(2020, 10, 10), 75),
      new TimeSeriesSales(new DateTime(2020, 11, 10), 75),
      new TimeSeriesSales(new DateTime(2020, 12, 11), 775),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
