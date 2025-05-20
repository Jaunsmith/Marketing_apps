import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StaggeredGridExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StaggeredGridExample extends StatelessWidget {
  final List<String> imageUrls = List.generate(
    10,
    (index) => 'https://picsum.photos/300/30${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Staggered Grid View')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(imageUrls[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
