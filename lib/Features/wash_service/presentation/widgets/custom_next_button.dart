import 'package:flutter/material.dart';

class CustomNextButton extends StatelessWidget {
  CustomNextButton({
    super.key,
    this.onTap,
    this.validator,
  });
  final formKey = GlobalKey();
  void Function()? onTap;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Form(key: formKey, child: Container());
    // GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     height: 50,
    //     decoration: BoxDecoration(
    //       color: const Color(0xffE57533),
    //       borderRadius: BorderRadius.circular(16),
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         TextFormField(
    //           validator: validator,
    //         ),
    //         const Text(
    //           'Next',
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 18,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         const Icon(
    //           Icons.arrow_forward_ios_outlined,
    //           color: Colors.white,
    //         )
    //       ],
    //     ),
    //   ),
    // ),
    // );
  }
}
