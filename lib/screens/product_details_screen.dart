import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:market_app/widgets/extension.dart';
import 'package:market_app/widgets/image_links.dart';
import 'package:market_app/widgets/main_text.dart';
import 'package:market_app/widgets/sub_text.dart';
import 'package:market_app/widgets/text_helper.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.index});

  final int index;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<String> listText = ['S', 'M', 'L', 'XL', 'XXL'];

  late int isClicked = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        margin: EdgeInsets.only(top: 70),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  MainText(text: 'Detail Product'),
                  Icon(Icons.favorite_border),
                ],
              ),
            ),
            20.height,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          imageUrl: ImageLinks.imageLinks[widget.index],
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) => Center(
                                child: CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.tealAccent,
                                ),
                              ),
                          errorWidget:
                              (context, url, error) => Icon(Icons.error),
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
                                errorWidget:
                                    (context, url, error) => Icon(Icons.error),
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
                    20.height,
                    Divider(color: Colors.grey.shade400),
                    MainText(text: 'Size'),
                    10.height,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(listText.length, (index) {
                          final isSelected = isClicked == index;
                          return Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isClicked = index;
                                });
                              },
                              child:
                                  isSelected
                                      ? Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 1,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: Colors.black,
                                        ),
                                        child: SubText(
                                          text: listText[index],
                                          textColor: Colors.white,
                                        ),
                                      )
                                      : SubText(text: listText[index]),
                            ),
                          );
                        }),
                      ),
                    ),
                    20.height,
                    MainText(text: 'Description', fontSize: 13),
                    10.height,
                    TextHelper(
                      text:
                          'Stay warm, stylish, and comfortable our premium sweatshirt is your perfect everyday essential. Stay warm, stylish, and comfortable our premium sweatshirt is your perfect everyday essential.Stay warm, stylish, and comfortable our premium sweatshirt is your perfect everyday essential.Stay warm, stylish, and comfortable our premium sweatshirt is your perfect everyday essential. ',
                    ),
                    30.height,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SubText(
                            text: 'Add to Cart  | \$19.9',
                            fontSize: 15,
                            textColor: Colors.white,
                          ),
                          5.width,
                          Text.rich(
                            WidgetSpan(
                              baseline: TextBaseline.alphabetic,
                              child: SubText(
                                text: '\$120.99',
                                fontSize: 10,
                                textColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
