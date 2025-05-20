import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market_app/utilities/product_card.dart';
import 'package:market_app/widgets/image_links.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: EdgeInsets.zero,
      itemCount: ImageLinks.imageLinks.length,
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final double height = index.isOdd ? 170 : 145;
        return ProductCard(
          height: height,
          name: 'Short Sleeves',
          position: 'bottoms',
          price: '\$10.5',
          imageUrl: ImageLinks.imageLinks[index],
        );
      },
    );
  }
}
