import 'package:crmdee/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  GlobalKey<CurrencyComparatorState> key1 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Swap"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //card1
              CurrencyComparator(
                key: key1,
                coin1: coins[0],
                coin2: coins[1],
                vol: 0,
              ),
              SizedBox(height: 20),
              //card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: NumericPad(
                  padMargin: 5,
                  padSize: 20,
                  value: "",
                  onChanged: (double value) {
                    //set the value for coin
                    print(value);
                    key1.currentState!.setVol(value);
                  },
                ),
              )
              //numeric panel
            ],
          ),
        ),
      ),
    );
  }
}

class Coin {
  String name;
  double rate;
  String pic;
  Coin({required this.name, required this.rate, required this.pic});
} //ec

List<Coin> coins = [
  Coin(
      name: "BTC",
      rate: 10,
      pic:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/BTC_Logo.svg/2000px-BTC_Logo.svg.png"),
  Coin(
    name: "ETH",
    rate: 20,
    pic:
        "https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/cardano_ada-512.png",
  ),
  Coin(
      name: "ADA",
      rate: 30,
      pic: "https://s2.coinmarketcap.com/static/img/coins/200x200/2010.png"),
  Coin(
      name: "DASH",
      rate: 40,
      pic: "https://media.dash.org/wp-content/uploads/dash-d.png"),
  Coin(
      name: "DOT",
      rate: 50,
      pic:
          "https://i-invdn-com.investing.com/ico_flags/80x80/v32/polkadot-new.png"),
  Coin(
      name: "USDC",
      rate: 60,
      pic:
          "https://i-invdn-com.investing.com/ico_flags/80x80/v32/usd-coin.png"),
  Coin(
      name: "DAI",
      rate: 70,
      pic:
          "https://i-invdn-com.investing.com/ico_flags/80x80/v32/multi-collateral-dai.png"),
  Coin(
      name: "CAKE",
      rate: 70,
      pic:
          "https://i-invdn-com.investing.com/ico_flags/80x80/v32/pancakeswap.png"),
  Coin(
      name: "BNB",
      rate: 70,
      pic:
          "https://i-invdn-com.investing.com/ico_flags/80x80/v32/binance-coin.png"),
  Coin(
      name: "DOGE",
      rate: 70,
      pic:
          "https://i-invdn-com.investing.com/ico_flags/80x80/v32/dogecoin.png"),
];

class NumKey extends StatelessWidget {
  String k;
  double size;
  Function clicked;

  NumKey({required this.k, required this.size, required this.clicked});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        clicked();
      },
      child: Text(k, style: TextStyle(fontSize: size)),
      style: OutlinedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: Colors.white,
        padding: EdgeInsets.all(10),
      ),
    );
  } //ef

} //ec

class IconPad extends StatelessWidget {
  String k;
  double size;
  Function clicked;

  IconPad({required this.k, required this.size, required this.clicked});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        clicked();
      },
      child: k == "-1"
          ? Icon(Icons.backspace_outlined, size: size)
          : Icon(Icons.question_answer, size: size),
      style: OutlinedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: Colors.white,
        padding: EdgeInsets.all(10),
      ),
    );
  } //ef

} //ec

class NumericPad extends StatelessWidget {
  String value;
  final double padSize;
  final double padMargin;
  Function(double value) onChanged;

  NumericPad(
      {required this.value,
      required this.onChanged,
      required this.padSize,
      required this.padMargin});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(padMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumKey(
                  k: "1",
                  size: padSize,
                  clicked: () {
                    EnterData("1");
                  },
                ),
                NumKey(
                  k: "2",
                  size: padSize,
                  clicked: () {
                    EnterData("2");
                  },
                ),
                NumKey(
                  k: "3",
                  size: padSize,
                  clicked: () {
                    EnterData("3");
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(this.padMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumKey(
                  k: "4",
                  size: padSize,
                  clicked: () {
                    EnterData("4");
                  },
                ),
                NumKey(
                  k: "5",
                  size: padSize,
                  clicked: () {
                    EnterData("5");
                  },
                ),
                NumKey(
                  k: "6",
                  size: padSize,
                  clicked: () {
                    EnterData("6");
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumKey(
                  k: "7",
                  size: padSize,
                  clicked: () {
                    EnterData("7");
                  },
                ),
                NumKey(
                  k: "8",
                  size: padSize,
                  clicked: () {
                    EnterData("8");
                  },
                ),
                NumKey(
                  k: "9",
                  size: padSize,
                  clicked: () {
                    EnterData("9");
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumKey(
                  k: ".",
                  size: padSize,
                  clicked: () {
                    EnterData(".");
                  },
                ),
                NumKey(
                  k: "0",
                  size: padSize,
                  clicked: () {
                    EnterData("0");
                  },
                ),
                IconPad(
                  k: "-1",
                  size: padSize,
                  clicked: () {
                    EnterData("<");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } //ef

  void EnterData(String ch) {
    //key1 pressed
    if (ch == "0") {
      if (value == "") {
        return;
      }

      this.value += "0";
    }
    //key = backspace
    else if (ch == "<") {
      if (value == "") {
        return;
      }
      this.value = value.substring(0, value.length - 1);
      if (this.value.endsWith(".")) {
        this.value = value.substring(0, value.length - 1);
      }
    }
    //key = dot
    else if (ch == ".") {
      if (value == "" || value.toString().contains(".")) {
        return;
      }
      this.value += ".";
    } else {
      this.value = value + ch;
    }

    //finally then trigger onchange event
    if (value == "") {
      onChanged(0.0);
    } else {
      onChanged(double.parse(value));
    }
  } //ef

} //ec

class CurrencyComparator extends StatefulWidget {
  Coin coin1;
  Coin coin2;
  double vol;
  CurrencyComparator(
      {required Key key,
      required this.coin1,
      required this.coin2,
      required this.vol})
      : super(key: key);

  @override
  CurrencyComparatorState createState() => CurrencyComparatorState();
}

class CurrencyComparatorState extends State<CurrencyComparator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            //base
            Column(
              children: [
                SizedBox(height: 5),
                ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //logo & icon down
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20.0,
                                  child: ClipRect(
                                    child: Image.network(
                                      widget.coin1.pic,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(widget.coin1.name),
                              ],
                            ),
                            //icon
                            IconButton(
                              onPressed: () {
                                showDialog(context,
                                    duration: 200,
                                    skip: true,
                                    dialog: CoinSelector(
                                      coins: coins.where((e) {
                                        return e.name != widget.coin2.name;
                                      }).toList(),
                                      targetCoin: widget.coin1,
                                      coinSelected: (Coin c) {
                                        setState(() {
                                          widget.coin1 = c;
                                        });
                                      },
                                    ));
                              },
                              icon: Icon(Icons.arrow_drop_down_outlined),
                            ),
                          ],
                        ),
                      ),
                      //vol, value
                      Expanded(
                        flex: 4,
                        child: ListTile(
                          title: Text(
                            f2.format(widget.vol),
                            style: TextStyle(fontSize: TSize(context, 30)),
                          ),
                          subtitle: Text(
                            '\$${f2.format(widget.vol * widget.coin1.rate)}',
                            style: TextStyle(fontSize: TSize(context, 20)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //logo, arrow down
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20.0,
                                  child: ClipRect(
                                    child: Image.network(
                                      widget.coin2.pic,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(widget.coin2.name),
                              ],
                            ),
                            //icon
                            IconButton(
                              onPressed: () {
                                showDialog(context,
                                    duration: 200,
                                    skip: false,
                                    dialog: CoinSelector(
                                      coins: coins.where((e) {
                                        return e.name != widget.coin1.name;
                                      }).toList(),
                                      targetCoin: widget.coin2,
                                      coinSelected: (Coin c) {
                                        setState(() {
                                          widget.coin2 = c;
                                        });
                                      },
                                    ));
                              },
                              icon: Icon(Icons.arrow_drop_down_outlined),
                            ),
                          ],
                        ),
                      ),
                      //value rate
                      Expanded(
                        flex: 4,
                        child: ListTile(
                          title: Text(
                            f2.format(widget.vol),
                            style: TextStyle(fontSize: TSize(context, 30)),
                          ),
                          subtitle: Text(
                              '\$${f2.format(widget.vol * widget.coin2.rate)}',
                              style: TextStyle(fontSize: TSize(context, 20))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //divider
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Divider(),
                ),
              ),
            ),

            //switch button
            Positioned.fill(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {
                      toggleCoin();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.arrowsAltV,
                      color: Colors.green[400],
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(10),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
    //gap
  } //ef

  void toggleCoin() {
    setState(() {
      var temp = widget.coin1;
      widget.coin1 = widget.coin2;
      widget.coin2 = temp;
    });
  }

  void setVol(double vol) {
    setState(() {
      widget.vol = vol;
    });
  } //ef

  void setCoin1(Coin coin1) {
    setState(() {
      widget.coin1 = coin1;
    });
  } //ef

  void setCoin2(Coin coin2) {
    setState(() {
      widget.coin2 = coin2;
    });
  } //ef
} //ec

class CoinSelector extends StatefulWidget {
  List<Coin> coins = [];
  String search = "";
  Coin targetCoin;
  Function coinSelected;
  CoinSelector({
    required this.coins,
    required this.targetCoin,
    required this.coinSelected,
  });

  @override
  _CoinSelectorState createState() => _CoinSelectorState();
}

class _CoinSelectorState extends State<CoinSelector> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Please select your new coin'),
      content: Column(
        children: [
          //search box
          TextField(
            onChanged: (ch) {
              setState(() {
                widget.search = ch;
              });
            },
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                suffixIcon: Icon(Icons.search),
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Enter coin name",
                fillColor: Colors.white70),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: ListBody(
                children: this.widget.coins.where((e) {
                  String ss = widget.search.toLowerCase();

                  return e.name.toLowerCase().contains(ss);
                }).map((e) {
                  //children: this.widget.coins.map((e) {

                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20.0,
                          child: ClipRect(
                            child: Image.network(
                              e.pic,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          e.name,
                          style: TextStyle(fontSize: TSize(context, 15)),
                        ),
                        trailing: Checkbox(
                          //checkColor: Colors.blue,
                          value:
                              widget.targetCoin.name == e.name ? true : false,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.targetCoin = e;
                            });
                          },
                        ),
                      ),
                      Divider()
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('okay'),
          onPressed: () {
            Navigator.of(context).pop();
            widget.coinSelected(widget.targetCoin);
          },
        ),
      ],
    );
  }
} //ef

final f1 = NumberFormat("#,##0", "en_US");
final f2 = NumberFormat("#,##0.00", "en_US");

showDialog(context,
    {required Widget dialog, required bool skip, required int duration}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "aa",
    barrierDismissible: skip,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: duration),
    pageBuilder: (context, anim1, anim2) {
      return dialog;
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position:
            Tween(begin: Offset(0, -0.5), end: Offset(0, 0)).animate(anim1),
        child: child,
      );
    },
  );
}
