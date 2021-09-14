import 'package:crmdee/pages/candledata.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:provider/provider.dart';

import '../store.dart';

class CandlePage extends StatefulWidget {
  @override
  _CandlePageState createState() => _CandlePageState();
}

class _CandlePageState extends State<CandlePage> {
  List<CandleData> _data = MockData.candles;

  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Interactive Chart Demo"),
        actions: [
           
          IconButton(
            icon: Icon(
              store1.showAverage ? Icons.show_chart : Icons.bar_chart_outlined,
            ),
            onPressed: () {
              store1.toggleShowAverage();
              if (store1.showAverage) {
                CandleData.computeMA(_data, 7);
              } else {
                CandleData.deleteMA(_data);
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(24.0),
        child: InteractiveChart(
          /** Only [candles] is required */
          candles: _data,
          /** Uncomment the following for examples on optional parameters */

          /** Example styling */
          // style: ChartStyle(
          //   priceGainColor: Colors.teal[200]!,
          //   priceLossColor: Colors.blueGrey,
          //   volumeColor: Colors.teal.withOpacity(0.8),
          //   trendLineColor: Colors.blueGrey[200]!,
          //   priceGridLineColor: Colors.blue[200]!,
          //   priceLabelStyle: TextStyle(color: Colors.blue[200]),
          //   timeLabelStyle: TextStyle(color: Colors.blue[200]),
          //   selectionHighlightColor: Colors.red.withOpacity(0.2),
          //   overlayBackgroundColor: Colors.red[900]!.withOpacity(0.6),
          //   overlayTextStyle: TextStyle(color: Colors.red[100]),
          //   timeLabelHeight: 32,
          // ),
          /** Customize axis labels */
          timeLabel: (timestamp, visibleDataCount) => "📅",
          priceLabel: (price) => "${price.round()} 💎",
          /** Customize overlay (tap and hold to see it)
             ** Or return an empty object to disable overlay info. */
          overlayInfo: (candle) => {
            "💎": "🤚    ",
            "Hi": "${candle.high?.toStringAsFixed(2)}",
            "Lo": "${candle.low?.toStringAsFixed(2)}",
          },
          /** Callbacks */
          // onTap: (candle) => print("user tapped on $candle"),
          // onCandleResize: (width) => print("each candle is $width wide"),
        ),
      ),
    );
  }
}//ec