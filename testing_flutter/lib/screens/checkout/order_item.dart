import 'package:flutter/material.dart';
//import 'package:food_app/providers/review_cart_provider.dart';

import '../../../models/reviewcart_model.dart';

class OrderItem extends StatelessWidget {
  final ReviewCartModel e;
  OrderItem({required this.e});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        e.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e.cartName,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          // Text(
          //   e.cartUnit,
          //   style: TextStyle(
          //     color: Colors.grey[600],
          //   ),
          // ),
          Text(
            "\Rs.${e.cartPrice}",

          ),
        ],
      ),
      subtitle: Text(e.cartQuantity.toString()),
    );
  }
}