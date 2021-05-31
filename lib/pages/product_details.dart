import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final productDetailcategory;
  final productDetailname;
  final productDetailunittype;
  final productDetailprice;
  final productDetailavailableunits;
  final productDetailpic;
  ProductDetails({
    this.productDetailcategory,
    this.productDetailname,
    this.productDetailunittype,
    this.productDetailprice,
    this.productDetailavailableunits,
    this.productDetailpic,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.green,
          title: Text('Agrispects'),
          actions: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () async {},
            ),
            new IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {}),
            new IconButton(
                icon: Icon(Icons.article_sharp, color: Colors.white),
                onPressed: () {}),
          ],
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
                height: 300.0,
                child: GridTile(
                  child: Container(
                    color: Colors.white70,
                    child: (widget.productDetailpic != '')
                        ? new Image.network(widget.productDetailpic)
                        : new Image.asset('assets/images/vegetables.png'),

                    //new Image.network(widget.productDetailpic),
                    //child: Image.asset(widget.productDetailpic),
                  ),
                  footer: new Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: new Text(widget.productDetailname,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      title: new Row(children: <Widget>[
                        Expanded(
                            child: new Text(
                                "\u{20B9}${widget.productDetailprice} per ${widget.productDetailunittype}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ))),
                      ]),
                    ),
                  ),
                )),
            // ============ The First Buttons =================
            Row(
              children: <Widget>[
                // ==============  the QTY Button ===========
                Expanded(
                    child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("choose the Quantity"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Quantity"),
                      ),
                      Expanded(child: new Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ))
              ],
            ),
            Row(
              children: <Widget>[
                // ==============  the Buy Now Button ===========
                Expanded(
                    child: MaterialButton(
                        onPressed: () {},
                        color: Colors.green,
                        textColor: Colors.white,
                        elevation: 0.3,
                        child: new Text("Add to cart"))),
                new IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    color: Colors.green,
                    onPressed: () {}),
              ],
            )
          ],
        ));
  }
}
