import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.iconSize});
  final IconData icon;
  final void Function()? onPressed;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: iconSize,
        color: Colors.black,
        onPressed: onPressed,
        icon: Icon(
          icon,
        ),
      ),
    );
  }
}
