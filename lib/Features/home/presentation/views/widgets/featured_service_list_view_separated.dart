import 'package:carwash/Features/home/data/models/Services_item_model.dart';
import 'package:carwash/Features/home/presentation/views/widgets/featured_service_item_widget.dart';
import 'package:flutter/material.dart';

class FeaturedServiceListViewSeparated extends StatelessWidget {
  const FeaturedServiceListViewSeparated({
    super.key,
  });
  final List<ServicesItemModel> items = const [
    ServicesItemModel(
        image: 'assets/images/exterior.jpeg', title: 'exterior'),
    ServicesItemModel(
        image: 'assets/images/interior.jpeg', title: 'interior'),
    ServicesItemModel(
        image: 'assets/images/detailing.jpeg', title: 'detailing'),
    ServicesItemModel(
        image: 'assets/images/polish.jpeg', title: 'polish'),
    ServicesItemModel(
        image: 'assets/images/tyre_wash.jpeg', title: 'tyre wash'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      
      itemBuilder: (context, index) {
        return  FeaturedServiceItemWidget(item: items[index],);
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 10,
      ),
      itemCount: items.length,
    );
  }
}
