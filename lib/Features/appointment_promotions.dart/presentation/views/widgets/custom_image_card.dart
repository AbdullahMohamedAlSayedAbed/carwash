import 'package:cached_network_image/cached_network_image.dart';
import 'package:carwash/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({
    super.key,
  this.image,
  });
  final String? image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width * 0.45,
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) => CustomFadingWidget(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[300],
              ),
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.45,
            ),
          ),
          errorWidget: (context, url, error) =>
              const Icon(Icons.error),
          imageUrl: image ?? "",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
