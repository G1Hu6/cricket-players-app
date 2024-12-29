import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(183, 174, 173, 173),
      highlightColor: const Color.fromARGB(220, 255, 255, 255),
      child: ListTile(
        isThreeLine: true,
        leading: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), color: Colors.grey),
        ),
        title: Container(
          height: 15,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        subtitle: Container(
          height: 15,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
