import 'package:flutter/material.dart';

class SelectionColumnWidget extends StatelessWidget {
  final Color color;
  final String name;
  final void Function() onTap;
  const SelectionColumnWidget({super.key, required this.color, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}
