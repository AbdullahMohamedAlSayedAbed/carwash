import 'package:carwash/Features/home/data/models/Services_item_model.dart';




sealed class ServicesItemState {}

final class ServicesItemInitial extends ServicesItemState {
   List<ServicesItemModel> items;
  ServicesItemInitial(this.items);
}

final class ServicesItemSearch extends ServicesItemState {
   List<ServicesItemModel> items;
  ServicesItemSearch(this.items);
}
