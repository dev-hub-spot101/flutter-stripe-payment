import 'package:stripecheckout/models/product.dart';

class CartItem {
  int quantity;
  Product product;
  CartItem({required this.quantity, required this.product});
}

List<CartItem> cartItems = [
  CartItem(quantity: 2, product: products[0]),
  CartItem(quantity: 3, product: products[2]),
  CartItem(quantity: 1, product: products[1])
];
