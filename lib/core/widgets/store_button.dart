import 'package:flutter/material.dart';

class StoreButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const StoreButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onPressed, child: Text(label)),
    );
  }
}
