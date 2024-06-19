import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripecheckout/models/cart_item.dart';
import 'package:stripecheckout/widgets/cart_tile.dart';
import 'package:stripecheckout/widgets/checkout.dart';
import 'package:http/http.dart' as http;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<String, dynamic>? paymentIntentData;
  Future<void> initPaymentSheet(amount) async {
    try {
      paymentIntentData = await createPaymentIntent(amount.toString(), "USD");

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  allowsDelayedPaymentMethods: true,
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  style: ThemeMode.dark,
                  merchantDisplayName: 'DEVHUBSPOT'))
          .then((value) {});

      displayPaymentSheet();
    } catch (e, s) {
      if (kDebugMode) {
        print(s);
      }
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) {
        payFee();

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print('$error $stackTrace');
        }
      });
    } on StripeException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      if (kDebugMode) {
        print('$e');
      }
    }
  }

  payFee() {
    try {
      //if you want to upload data to any database do it here
    } catch (e) {
      // exception while uploading data
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer sk_test_QxY26rYq6z916QEwDEqYtH4V',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      if (kDebugMode) {
        print('err charging user: ${err.toString()}');
      }
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(bottom: 100),
        itemCount: cartItems.length,
        separatorBuilder: (context, index) => SizedBox(height: 20),
        itemBuilder: (context, index) => CartTile(
          item: cartItems[index],
          onAdd: () {
            setState(() {
              cartItems[index].quantity++;
            });
          },
          onRemove: () {
            if (cartItems[index].quantity != 1) {
              setState(() {
                cartItems[index].quantity--;
              });
            }
          },
        ),
      ),
      bottomSheet: Checkout(
        items: cartItems,
        callStripe: () {
          initPaymentSheet(2345);
        },
      ),
    );
  }
}
