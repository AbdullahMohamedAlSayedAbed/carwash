import 'package:carwash/Features/home/data/models/Services_item_model.dart';
import 'package:carwash/Features/home/presentation/views/widgets/featured_service_item_widget.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';

class FeaturedServiceListViewSeparated extends StatelessWidget {
  const FeaturedServiceListViewSeparated({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
  final List<ServicesItemModel> items =  [
    ServicesItemModel(
        image: 'assets/images/exterior.jpeg', title: S.of(context).Exterior),
    ServicesItemModel(
        image: 'assets/images/interior.jpeg', title: S.of(context).interior),
    ServicesItemModel(
        image: 'assets/images/detailing.jpeg', title: S.of(context).Detailing),
    ServicesItemModel(
        image: 'assets/images/polish.jpeg', title: S.of(context).Polish),
    ServicesItemModel(
        image: 'assets/images/tyre_wash.jpeg', title: S.of(context).tyreWash),
  ];
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
