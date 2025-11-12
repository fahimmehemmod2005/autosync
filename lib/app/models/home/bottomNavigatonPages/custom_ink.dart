import 'package:flutter/material.dart';

class CustomInk extends StatelessWidget {
final Function()? ontap;
final Widget? child;

  const CustomInk({
    super.key,
    required this.ontap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
    child: child);
  }
}