import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      child: CachedNetworkImage(
        imageUrl: "https://i.pravatar.cc/300",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              )),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
