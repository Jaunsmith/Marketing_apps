import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:market_app/widgets/extension.dart';
import 'package:market_app/widgets/image_links.dart';
import 'package:market_app/widgets/main_text.dart';
import 'package:market_app/widgets/sub_text.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  final List<String> listText = ['S', 'M', 'L', 'XL', 'XXL'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 70),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios),
                  MainText(text: 'Detail Product'),
                  Icon(Icons.favorite_border),
                ],
              ),
            ),
            20.height,
            Container(
              margin: EdgeInsets.only(right: 10),
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: ImageLinks.imageLinks[1],
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.tealAccent,
                        ),
                      ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            10.height,
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: ImageLinks.imageLinks[index],
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.tealAccent,
                              ),
                            ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  );
                },
              ),
            ),
            20.height,
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainText(text: 'Sweat Shirt'),
                  MainText(text: '\$29.99'),
                ],
              ),
            ),
            SubText(text: 'T-Shirt'),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.orangeAccent,
                      size: 12,
                    ),
                    MainText(text: '4.8', fontSize: 10),
                    SubText(text: '(200 review)', fontSize: 10),
                  ],
                ),
                Row(
                  children: [
                    MainText(text: '250', fontSize: 10),
                    SubText(text: '(items sold)', fontSize: 10),
                  ],
                ),
                Row(
                  children: [
                    MainText(text: '115', fontSize: 10),
                    SubText(text: '(stock)', fontSize: 10),
                  ],
                ),
              ],
            ),
            15.height,
            Divider(color: Colors.grey.shade400),
            MainText(text: 'Size'),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(listText.length, (index) {
                  return Container(
                    // child: Bu(child: SubText(text: listText[index])),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
