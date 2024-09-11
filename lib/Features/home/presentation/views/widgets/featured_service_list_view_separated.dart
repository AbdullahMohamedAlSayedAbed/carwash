import 'package:carwash/Features/home/presentation/controllers/cubit/services_item_cubit.dart';
import 'package:carwash/Features/home/presentation/controllers/cubit/services_item_state.dart';
import 'package:carwash/Features/home/presentation/views/widgets/featured_service_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedServiceListViewSeparated extends StatelessWidget {
  const FeaturedServiceListViewSeparated({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesItemCubit, ServicesItemState>(
      builder: (context, state) {
        if (state is ServicesItemInitial || state is ServicesItemSearch) {
          final items = (state as dynamic).items;
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return FeaturedServiceItemWidget(item: items[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
