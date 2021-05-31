import 'dart:io';

import 'package:farmers_market/pages/product_details.dart';
import 'package:farmers_market/src/blocs/customer_bloc.dart';
import 'package:farmers_market/src/models/product.dart';
import 'package:farmers_market/src/styles/colors.dart';
import 'package:farmers_market/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductsCustomer extends StatelessWidget {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'en_in');

  @override
  Widget build(BuildContext context) {
    var customerBloc = Provider.of<CustomerBloc>(context);

    return StreamBuilder<List<Product>>(
        stream: customerBloc.fetchAvailableProducts,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: (Platform.isIOS)
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator(),
            );

          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var product = snapshot.data[index];

                        return Column(
                          children: [
                            ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: (product.imageUrl != '')
                                      ? NetworkImage(product.imageUrl)
                                      : AssetImage(
                                          'assets/images/vegetables.png'),
                                  radius: 25.0,
                                ),
                                title: Text(product.productName,
                                    style: TextStyles.listTitle),
                                subtitle: Text('The Vendor'),
                                trailing: Text(
                                    '${formatCurrency.format(product.unitPrice)}/${product.unitType}',
                                    style: TextStyles.bodyLightBlue),
                                onTap: () => Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        //passing product details to the new page
                                        builder: (context) =>
                                            new ProductDetails(
                                                productDetailcategory: product
                                                    .categoryName,
                                                productDetailname:
                                                    product.productName,
                                                productDetailunittype:
                                                    product.unitType,
                                                productDetailprice:
                                                    product.unitPrice,
                                                productDetailavailableunits:
                                                    product.availableUnits,
                                                productDetailpic:
                                                    product.imageUrl)))),
                            Divider(
                              color: AppColors.lightgray,
                            )
                          ],
                        );
                      }),
                ),
                Container(
                  height: 50.0,
                  width: double.infinity,
                  color: AppColors.straw,
                  child: (Platform.isIOS)
                      ? Icon(
                          const IconData(0xF38B,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Colors.white,
                          size: 35.0)
                      : Icon(Icons.filter_list,
                          color: Colors.white, size: 35.0),
                )
              ],
            ),
          );
        });
  }
}
