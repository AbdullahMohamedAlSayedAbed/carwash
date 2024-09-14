import 'package:carwash/Features/home/data/models/Services_item_model.dart';
import 'package:carwash/Features/home/presentation/controllers/service_item_cubit/services_item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesItemCubit extends Cubit<ServicesItemState> {
  List<ServicesItemModel> originalItems = [];

  ServicesItemCubit(List<ServicesItemModel> initialItems)
      : super(ServicesItemInitial(initialItems)) {
    originalItems = initialItems; 
  }

  void filterServices(String searchTerm) {
    if (searchTerm.isEmpty) {
      emit(ServicesItemInitial(List.from(originalItems)));
    } else {
      final filteredItems = originalItems
          .where((item) =>
              item.title.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
      emit(ServicesItemSearch(filteredItems));
    }
  }
}
