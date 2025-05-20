import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:market_app/widgets/extension.dart';
import 'package:market_app/widgets/main_text.dart';
import 'package:market_app/widgets/sub_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.position,
    required this.price,
    required this.imageUrl,
    this.height,
  });

  final String name;
  final String position;
  final String price;
  final String imageUrl;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height ?? 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.grey.shade500,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.tealAccent,
                      ),
                    ),
              ),
            ),
          ),
          10.height,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainText(text: name, fontSize: 12),
                5.height,
                SubText(text: position),
                5.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: MainText(text: price, fontSize: 12)),
                    Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(width: 1.5),
                      ),
                      child: Center(child: Icon(Icons.add, size: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
