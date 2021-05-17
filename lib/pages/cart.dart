//import 'package:flutter_app1/components/horizontal_listview.dart';
import 'package:farmers_market/components/cart_products.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: Text('My Cart'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () async {},
          ),
          new IconButton(
              icon: Icon(Icons.article_sharp, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: new CartProducts(),
      bottomNavigationBar: new Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: new Text("Total:"),
                subtitle: new Text("\u{20B9}${120}"),
              )),
              Expanded(
                  child: MaterialButton(
                      onPressed: () {},
                      color: Colors.green,
                      textColor: Colors.white,
                      elevation: 0.3,
                      child: new Text("Buy Now")))
            ],
          )),
    );
  }
}
