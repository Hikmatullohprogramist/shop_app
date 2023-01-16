import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          "Fenix Soft",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox  (
          width: 2,
        ),
        Image.asset(
          "lib/assets/logo.png",
          width: 28,
          height: 28,
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }
}
