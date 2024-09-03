import 'package:carwash/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).HeryMark),
      ),
      body: const HomeViewBody(),
    );
  }
}
