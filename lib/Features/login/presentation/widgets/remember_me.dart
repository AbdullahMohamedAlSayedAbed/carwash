import 'package:carwash/Features/login/presentation/cubit/rember_me/remember_me_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/rember_me/remember_me_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rememberme extends StatefulWidget {
  final String email;
  final String password;

  const Rememberme({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  _RemembermeState createState() => _RemembermeState();
}

class _RemembermeState extends State<Rememberme> {
  @override
  void initState() {
    super.initState();
    context.read<RememberMeCubit>().loadRememberMeState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RememberMeCubit, RememberMeState>(
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              value: state.isRemembered,
              onChanged: (newValue) {
                // تحديث حالة التشيك بوكس وحفظ البيانات
                context.read<RememberMeCubit>().toggleRememberMe(newValue!);
                if (newValue) {
                  context
                      .read<RememberMeCubit>()
                      .saveCredentials(widget.email, widget.password);
                }
              },
            ),
            const Text("Remember me"),
          ],
        );
      },
    );
  }
}
