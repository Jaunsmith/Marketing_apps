import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:market_app/widgets/image_links.dart';

class StaggeredGridExample extends StatelessWidget {
  const StaggeredGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staggered Grid')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // Using MasonryGridView for better height control
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 15,
          itemCount: ImageLinks.imageLinks.length,
          itemBuilder: (context, index) {
            // Make right items (odd indices) taller
            final height = index.isOdd ? 150.0 : 130.0;

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: ImageLinks.imageLinks[index],
                  fit: BoxFit.cover,
                  height: height,
                  width: double.maxFinite,
                  placeholder:
                      (context, url) =>
                          Container(color: Colors.grey[200], height: height),
                  errorWidget:
                      (context, url, error) => Container(
                        color: Colors.grey[200],
                        height: height,
                        child: const Icon(Icons.error),
                      ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
