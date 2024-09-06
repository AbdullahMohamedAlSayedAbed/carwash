import 'package:carwash/Features/home/data/models/Services_item_model.dart';
import 'package:flutter/material.dart';

class FeaturedServiceItemWidget extends StatelessWidget {
  const FeaturedServiceItemWidget({
    super.key,
    required this.item,
  });
  final ServicesItemModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(item.image),
        ),
        Flexible(
          child: FittedBox(
            alignment: AlignmentDirectional.center,
            fit: BoxFit.scaleDown,
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
