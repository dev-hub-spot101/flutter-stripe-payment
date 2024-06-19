import 'package:flutter/material.dart';
import 'package:stripecheckout/models/cart_item.dart';

class Checkout extends StatelessWidget {
  final List<CartItem> items;
  final Function() callStripe;
  const Checkout({super.key, required this.items, required this.callStripe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SubTotal",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Text(
                "\$${items.length > 1 ? items.map<double>((e) => e.quantity * e.product.price).reduce((value, element) => value + element) : items[0].product.price * items[0].quantity}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Text(
                "\$${items.length > 1 ? items.map<double>((e) => e.quantity * e.product.price).reduce((value, element) => value + element) : items[0].product.price * items[0].quantity}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: callStripe,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  minimumSize: Size(double.infinity, 55)),
              child: Text(
                "Checkout",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
