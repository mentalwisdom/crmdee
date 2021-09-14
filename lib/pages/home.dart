import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crmdee/pages/api.dart';
import 'package:crmdee/pages/candle.dart';
import 'package:crmdee/pages/cart.dart';
import 'package:crmdee/pages/history.dart';
import 'package:crmdee/pages/productdetail.dart';
import 'package:crmdee/pages/social.dart';
import 'package:crmdee/store.dart';
import 'package:crmdee/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'currency.dart';

import 'package:fluttericon/zocial_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var store1;
  @override
  void initState() {
    super.initState();
    //wrapp this to get context in initstate
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      //

      var store1 = Provider.of<Store>(context, listen: false);
      if (store1.products.length == 0) {
        print("yes");
        Api.products(token: store1.token, secure: false).then((products) {
          store1.setProducts(products);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(
              store1.darkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () => store1.toggleDarkMode(),
          ),
        ],
      ),
      body: Column(
        children: [
          PromotionBox(),
          Expanded(child: ProductView()),
        ],
      ),
      floatingActionButton: store1.totalInCart() == 0
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              //child: Icon(Icons.shopping_bag),
              child: Badge(
                badgeColor: Colors.redAccent,
                position: BadgePosition.topEnd(top: -15, end: -20),
                badgeContent: Text(
                  store1.totalInCart().toString(),
                ),
                child: Icon(Icons.shopping_bag, color: Colors.white),
              ),
            ),
    );
  }
} //ec

class ProductView extends StatelessWidget {
  int getColumn(context) {
    double w = MediaQuery.of(context).size.width;
    if (w <= 500)
      return 2;
    else if (w > 500 && w <= 800)
      return 3;
    else if (w > 800 && w <= 1000)
      return 4;
    else if (w > 1000)
      return 5;
    else
      return 2;
  } //ef

  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);
    return store1.products.length == 0
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            itemCount: store1.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getColumn(context),
              // MediaQuery.of(context).orientation == Orientation.landscape
              //     ? 4
              //     : 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: (2 / 1),
            ),
            itemBuilder: (
              context,
              index,
            ) {
              return GestureDetector(
                onTap: () {
                  store1.setActiveProduct(store1.products[index]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(),
                    ),
                  );
                },
                child: InkWell(
                  child: Stack(
                    children: [
                      Hero(
                        tag: store1.products[index],
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                // image: NetworkImageSSL(
                                //     "https://192.168.1.2:1975/products/" +
                                //         store1.products[index].productId
                                //             .toString() +
                                //         ".png",
                                //     headers: {}),
                                image: NetworkImage(
                                    "http://192.168.1.30:1974/products/" +
                                        store1.products[index].productId
                                            .toString() +
                                        ".png",
                                    headers: {}),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Text(
                            store1.products[index].name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  } //ef

} //ec

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ww(context) / 1.5,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("head"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
              title: Text(
                "Graph ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: Icon(
                Icons.analytics,
                size: 30,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CandlePage(),
                  ),
                );
              },
              title: Text("CandleStick"),
              trailing: Icon(
                Icons.linear_scale,
                size: 20,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SocialPage()));
              },
              leading: Text("Social"),
              trailing: Icon(Zocial.scribd),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CurrencyPage()));
              },
              leading: Text("Digital Currency"),
              trailing: Icon(Zocial.bitcoin),
            ),
          ],
        ),
      ),
    );
  }
}

class PromotionBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
      ),
      items: promotions.map((p) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                //decoration: BoxDecoration(color: Colors.amber),
                child: Image.network(p.pic));
          },
        );
      }).toList(),
    );
  } //ef

} //ec

var promotions = [
  Promotion(
      id: 1,
      pic:
          "https://cdn-akkjo.nitrocdn.com/hPAtldIfpaKVwktfnjiWCdIDiHHgkoxq/assets/static/optimized/rev-3458c60/wp-content/uploads/2018/03/popular-marvel-characters.jpg"),
  Promotion(
      id: 1,
      pic:
          "https://static.parade.com/wp-content/uploads/2020/03/avengers-marvel.jpg"),
];

class Promotion {
  int id;
  String pic;
  Promotion({required this.id, required this.pic});
}
