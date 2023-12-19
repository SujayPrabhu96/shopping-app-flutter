import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: Column(
        children: [
          Text(title),
          const SizedBox(height: 5),
          Text('\$$price'),
          const SizedBox(height: 5),
          Image(
            image: AssetImage(imageUrl)
          )
        ],
      ),
    );
  }
}