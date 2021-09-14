import 'package:crmdee/model/product.dart';
import 'package:crmdee/model/result.dart';
import 'package:crmdee/pages/api.dart';
import 'package:crmdee/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../networksslimage.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              pressOrder(context);
            },
            child: Text("Order Now"),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: store1.carts.length,
              itemBuilder: (context, index) {
                Product p = store1.carts[index];
                double total = p.qty * p.price;
                return ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    // backgroundImage: NetworkImageSSL(
                    //     "https://192.168.1.2:1975/products/" +
                    //         store1.products[index].productId.toString() +
                    //         ".png",
                    //     headers: {}),
                     backgroundImage: NetworkImage(
                        "http://192.168.1.30:1974/products/" +
                            store1.products[index].productId.toString() +
                            ".png",
                        headers: {}),
                  ),
                  title: Text(
                    p.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(p.qty.toString()),
                  trailing: Text(total.toString()),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          ),
        ],
      ),
    );
  } //ef

  void pressOrder(context) async {
    var store1 = Provider.of<Store>(context, listen: false);
    var orderItemsMap = store1.carts.map((e) {
      return {
        "productId": e.productId,
        "qty": e.qty,
        "discount": 0,
      };
    }).toList();
    var orderDict = {
      "customerId": 1,
      "orderItems": orderItemsMap,
    };
    print(orderDict);
    String url = "https://192.168.1.2:1975/api/pressOrder/";
    Result res =
        await Api.httpsPost(map1: orderDict, url: url, token: store1.token);
    print(res.msg);
    print(res.data);
  } //ef
}//ec
