import 'package:crmdee/store.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../util.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: hh(context) * .5,
              margin: EdgeInsets.all(20),
              child: Card(child: Chart1()),
            ),
            Container(
              height: 300,
              margin: EdgeInsets.all(20),
              child: Card(child: Chart2()),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.all(20),
              child: Card(child: Chart3()),
            ),
            Container(
              height: 300,
              margin: EdgeInsets.all(20),
              child: Card(child: Chart4()),
            ),
          ],
        ),
      ),
    );
  } //ef
} //ec

class Chart1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        //x axis grid
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 4),
        ),

        //y axis grid
        primaryYAxis: NumericAxis(
            majorGridLines: const MajorGridLines(width: 1),
            minimum: 0,
            maximum: 150),

        //series
        series: [
          LineSeries<SalesData, String>(
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            // Bind data source
            dataSource: [
              SalesData('Jan', 45),
              SalesData('Feb', 28),
              SalesData('Mar', 34),
              SalesData('Apr', 32),
              SalesData('May', 40)
            ],
            xValueMapper: (SalesData s, _) => s.year,
            yValueMapper: (SalesData s, _) => s.sales,
            dashArray: <double>[2, 2],
          ),
          LineSeries<SalesData, String>(
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            // Bind data source
            dataSource: [
              SalesData('Jan', 25),
              SalesData('Feb', 18),
              SalesData('Mar', 14),
              SalesData('Apr', 12),
              SalesData('May', 80)
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
        title: ChartTitle(text: 'line chart'), //title
        legend: Legend(isVisible: true), //legend
        tooltipBehavior: TooltipBehavior(enable: true) //tooltip
        );
  } //ef

} //ec

class Chart2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        //x axis grid
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 1),
        ),

        //y axis grid
        primaryYAxis: NumericAxis(
            majorGridLines: const MajorGridLines(width: 1),
            minimum: 0,
            maximum: 100),

        //series
        series: [
          BarSeries<SalesData, String>(
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            // Bind data source
            dataSource: [
              SalesData('Jan', 45),
              SalesData('Feb', 28),
              SalesData('Mar', 34),
              SalesData('Apr', 32),
              SalesData('May', 40)
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
          BarSeries<SalesData, String>(
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            // Bind data source
            dataSource: [
              SalesData('Jan', 25),
              SalesData('Feb', 18),
              SalesData('Mar', 14),
              SalesData('Apr', 12),
              SalesData('May', 80)
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            isTrackVisible: true,
          ),
          BarSeries<SalesData, String>(
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            // Bind data source
            dataSource: [
              SalesData('Jan', 15),
              SalesData('Feb', 28),
              SalesData('Mar', 34),
              SalesData('Apr', 22),
              SalesData('May', 50)
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            isTrackVisible: true,
          ),
        ],
        title: ChartTitle(text: 'bar chart'), //title
        legend: Legend(isVisible: true), //legend
        tooltipBehavior: TooltipBehavior(enable: true) //tooltip
        );
  } //ef

} //ec

class Chart3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(

        //series
        series: [
          PieSeries<SalesData, String>(
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            // Bind data source
            dataSource: [
              SalesData('Jan', 45),
              SalesData('Feb', 28),
              SalesData('Mar', 34),
              SalesData('Apr', 32),
              SalesData('May', 40)
            ],
            dataLabelMapper: (SalesData data, _) => data.year,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
        title: ChartTitle(text: 'pie chart'), //title
        legend: Legend(isVisible: true), //legend
        tooltipBehavior: TooltipBehavior(enable: true) //tooltip
        );
  } //ef

} //ec

class SalesData {
  String year;
  int sales;
  SalesData(this.year, this.sales);
}

class DC {
  String name;
  String pic;
  double change;
  double value;
  double mCap;
  List<double> data;
  DC(
      {required this.name,
      required this.pic,
      required this.change,
      required this.value,
      required this.mCap,
      required this.data});
} //ec

//sparkline chart
class Chart4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dcs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    //logo
                    Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20.0,
                          child: ClipRect(
                            child: Image.network(
                              dcs[index].pic,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                    //listitle
                    Expanded(
                      flex: 2,
                      child: Builder(builder: (context) {
                        var change = f.format(dcs[index].change);

                        return ListTile(
                          title: Text(dcs[index].name),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: percentChange(dcs[index].change),
                          ),
                        );
                      }),
                    ),
                    //graph
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 20,
                        child: dcs[index].change == 0
                            ? SfSparkLineChart(
                                axisLineColor: Colors.transparent,
                                color: changeColor(dcs[index].change),
                                data: dcs[index].data)
                            : SfSparkAreaChart(
                                axisLineColor: Colors.transparent,
                                color: changeColor(dcs[index].change),
                                data: dcs[index].data),
                      ),
                    ),
                    //cap
                    Expanded(
                        flex: 2,
                        child: Builder(
                          builder: (context) {
                            var value = f.format(dcs[index].value);
                            var mcap = f.format(dcs[index].mCap);
                            return ListTile(
                              title: Text('$value',
                                  style:
                                      TextStyle(fontSize: TSize(context, 12))),
                              subtitle: Text('$mcap',
                                  style:
                                      TextStyle(fontSize: TSize(context, 12))),
                            );
                          },
                        ))
                  ],
                ),
                Divider(),
              ],
            ),
          );
        });
  } //ef

  Widget percentChange(double change) {
    var c = f.format(change);
    if (change == 0) {
      return Text('$c%', style: TextStyle(color: Colors.yellow));
    } else if (change > 0) {
      return Text('+$c%', style: TextStyle(color: Colors.green));
    } else {
      return Text('-$c%', style: TextStyle(color: Colors.red));
    }
  } //ef

  Color changeColor(double value) {
    if (value > 0) {
      return Colors.green;
    } else if (value == 0) {
      return Colors.yellow;
    } else
      return Colors.red;
  } //ef

} //ec

List<DC> dcs = [
  DC(
      name: "Bitcoin",
      pic:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/BTC_Logo.svg/2000px-BTC_Logo.svg.png",
      change: 2.7,
      value: 32128.80,
      mCap: 88343,
      data: [1, 10, 7, 6, 2, 3, 5, 4, 6, 4, 7, 9]),
  DC(
      name: "Achain",
      pic: "https://s2.coinmarketcap.com/static/img/coins/200x200/1918.png",
      change: -2.2,
      value: 28312,
      mCap: 89343,
      data: [1, 10, 7, 6, 4, 3, 5, 7, 6, 4, 2, 1]),
  DC(
      name: "Ada",
      pic:
          "https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/cardano_ada-512.png",
      change: 0,
      value: 38312,
      mCap: 78343,
      data: [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]),
];

final f = NumberFormat("#,##0.00", "en_US");

 