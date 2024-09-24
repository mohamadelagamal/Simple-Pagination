import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A stateless widget that represents a row with a shimmer effect.
class ShimmerRow extends StatelessWidget {
  /// Creates a [ShimmerRow] widget.
  const ShimmerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            /// Circular Avatar with Shimmer Effect
            Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10.0),
            /// Column with Shimmer Effect on the first item
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 15.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    width: double.infinity,
                    height: 20.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}