import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DrawerShimmerWidget extends StatelessWidget {
  const DrawerShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        title: Container(
          width: double.infinity,
          height: 16.0,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
