import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final double price;
  final String category;
  final double rate;
  bool favourite;
  final List<Color> colors;
  Product(
      {required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.category,
      required this.rate,
      required this.favourite,
      required this.colors});
}

final List<Product> products = [
  Product(
      title: "Wireless HeadPhones",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      image: "assets/images/wireless.png",
      price: 120,
      category: "Headphones",
      rate: 4.8,
      favourite: false,
      colors: [Colors.black, Colors.blue, Colors.orange]),
  Product(
      title: "Woman Sweter",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      image: "assets/images/sweet.png",
      price: 120,
      category: "Headphones",
      rate: 4.8,
      favourite: false,
      colors: [Colors.red, Colors.blue, Colors.orange]),
  Product(
      title: "Smart Watch",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      image: "assets/images/miband.jpg",
      price: 55,
      category: "Headphones",
      rate: 4.8,
      favourite: false,
      colors: [Colors.black, Colors.blue, Colors.pink])
];
