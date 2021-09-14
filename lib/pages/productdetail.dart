import 'package:crmdee/networksslimage.dart';
import 'package:crmdee/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //picture
            Center(
              child: Text(
                store1.activeProduct.name,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                store1.activeProduct.price.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            Hero(
              tag: store1.activeProduct,
              child: Container(
                height: 200,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      // image: NetworkImageSSL(
                      //     "https://192.168.1.2:1975/products/" +
                      //         store1.activeProduct.productId.toString() +
                      //         ".png",
                      //     headers: {}),
                       image: NetworkImage(
                          "http://192.168.1.30:1974/products/" +
                              store1.activeProduct.productId.toString() +
                              ".png",
                          headers: {}),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            //inc and dec button
            Container(
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    store1.decProductInCart(store1.activeProduct);
                  },
                  icon: Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    store1.incProductInCart(store1.activeProduct);
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.green[800],
                  ),
                ),
              ),
            ),
            //show qty
            store1.activeProduct.qty == 0
                ? Container()
                : Text(
                    store1.activeProduct.qty.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
            //confirm button
            MaterialButton(
              color: Colors.green[300],
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Okay"),
            ),
          ],
        ),
      ),
    );
  }
}
