import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:market_app/utilities/product_card.dart';
import 'package:market_app/widgets/dynamic_size.dart';
import 'package:market_app/widgets/extension.dart';
import 'package:market_app/widgets/main_text.dart';
import 'package:market_app/widgets/sub_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageLink = [
    'https://fastly.picsum.photos/id/2/5000/3333.jpg?hmac=_KDkqQVttXw_nM-RyJfLImIbafFrqLsuGO5YuHqD-qQ',
    'https://fastly.picsum.photos/id/26/4209/2769.jpg?hmac=vcInmowFvPCyKGtV7Vfh7zWcA_Z0kStrPDW3ppP0iGI',
    'https://fastly.picsum.photos/id/21/3008/2008.jpg?hmac=T8DSVNvP-QldCew7WD4jj_S3mWwxZPqdF0CNPksSko4',
    'https://fastly.picsum.photos/id/28/4928/3264.jpg?hmac=GnYF-RnBUg44PFfU5pcw_Qs0ReOyStdnZ8MtQWJqTfA',
    'https://fastly.picsum.photos/id/29/4000/2670.jpg?hmac=rCbRAl24FzrSzwlR5tL-Aqzyu5tX_PA95VJtnUXegGU',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(
          top: DynamicSize.screenHeight(context) * 0.05924,
          left: DynamicSize.screenHeight(context) * 0.01184,
        ),
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainText(text: 'Welcome Back', fontSize: 25),
              SubText(text: 'Find your favorite product here'),
              20.height,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.maxFinite,
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'Search Anything...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 10,
                              child: Container(
                                height: 35,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.black,
                                ),
                                child: Icon(Icons.tune, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.height,
                      Container(
                        height: 150,
                        child: PageView.builder(
                          itemCount: imageLink.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                print('The index number : $index  clicked');
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: imageLink[index],
                                    fit: BoxFit.cover,
                                    placeholder:
                                        (context, url) => Center(
                                          child:
                                              CircularProgressIndicator.adaptive(
                                                backgroundColor:
                                                    Colors.tealAccent,
                                              ),
                                        ),
                                    errorWidget:
                                        (context, url, error) =>
                                            Icon(Icons.error),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      20.height,
                      MainText(text: 'Best Seller'),
                      20.height,
                      ProductCard(
                        name: 'Short Sleeves',
                        position: 'bottoms',
                        price: '\$10.5',
                        imageUrl:
                            'https://img.kwcdn.com/thumbnail/s/f19126e0f43395586d4b53f062dda744_ca3808ddd197.jpg?imageView2/2/w/800/q/70/format/webp',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
