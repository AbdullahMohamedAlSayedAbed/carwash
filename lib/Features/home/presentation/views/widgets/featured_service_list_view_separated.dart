import 'package:carwash/Features/home/presentation/views/widgets/featured_service_item_widget.dart';
import 'package:flutter/material.dart';

class FeaturedServiceListViewSeparated extends StatelessWidget {
  const FeaturedServiceListViewSeparated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const FeaturedServiceItemWidget();
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 10,
      ),
      itemCount: 10,
    );
  }
}
