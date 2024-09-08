import 'package:cached_network_image/cached_network_image.dart';
import 'package:carwash/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              )),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CustomFadingWidget(
          child: CircleAvatar(
            backgroundColor: Colors.grey[400],
            radius: 40,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
