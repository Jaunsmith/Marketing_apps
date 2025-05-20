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
  });

  final String name;
  final String position;
  final String price;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
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
          MainText(text: name, fontSize: 12),
          5.height,
          SubText(text: position),
          5.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainText(text: price, fontSize: 12),
              Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(width: 1.5),
                ),
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
