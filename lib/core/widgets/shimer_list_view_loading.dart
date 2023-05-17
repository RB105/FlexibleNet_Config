import 'package:flexible/core/extension/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          direction: ShimmerDirection.rtl,
          baseColor: Colors.grey.shade800,
          highlightColor: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: context.height * 0.05,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(20)),
            ),
          ),
        );
      },
    );
  }
}
