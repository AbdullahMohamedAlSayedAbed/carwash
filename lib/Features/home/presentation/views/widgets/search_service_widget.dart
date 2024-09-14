import 'package:carwash/Features/home/presentation/controllers/service_item_cubit/services_item_cubit.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:carwash/Features/home/presentation/views/widgets/featured_service_widget.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchServiceWidget extends StatefulWidget {
  const SearchServiceWidget({
    super.key,
  });

  @override
  State<SearchServiceWidget> createState() => _SearchServiceWidgetState();
}

class _SearchServiceWidgetState extends State<SearchServiceWidget> {
  TextEditingController? controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: controller,
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.list, color: Colors.grey),
          hintText: S.of(context).search,
          textInputType: TextInputType.text,
          onChanged: (text) {
            context.read<ServicesItemCubit>().filterServices(text);
          },
        ),
        const SizedBox(height: 10),
        const FeaturedServiceWidget(),
      ],
    );
  }
}
