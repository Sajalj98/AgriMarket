import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnthecart = [
    {
      "name": "Wheat",
      "picture": "assets/images/products/wheat.jpg",
      "new_price": 50,
      "qty": 1
    },
    {
      "name": "Rice",
      "picture": "assets/images/products/rice1.jpg",
      "new_price": 35,
      "qty": 2
    },
    {
      "name": "Maize",
      "picture": "assets/images/products/maize.jpg",
      "new_price": 35,
      "qty": 3
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: productsOnthecart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartprodName: productsOnthecart[index]["name"],
            cartprodPicture: productsOnthecart[index]["picture"],
            cartprodPrice: productsOnthecart[index]["new_price"],
            cartprodQty: productsOnthecart[index]["qty"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartprodName;
  final cartprodPicture;
  final cartprodPrice;
  final cartprodQty;
  @override
  SingleCartProduct(
      {this.cartprodName,
      this.cartprodPicture,
      this.cartprodPrice,
      this.cartprodQty});
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: new Image.asset(
        cartprodPicture,
        width: 120.0,
        height: 120.0,
      ),
      // ===Title section===
      title: new Text(cartprodName),
      //===subtitle section===
      subtitle: new Column(
        children: <Widget>[
          new Container(
            alignment: Alignment.topLeft,
            child: new Text(
              '\u{20B9}$cartprodPrice',
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
          )
        ],
      ),
      trailing: new Column(children: <Widget>[
        new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
        new Text("$cartprodQty"),
        new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {})
      ]),
    ));
  }
  /*void addQuantity(){
  
  }*/
}