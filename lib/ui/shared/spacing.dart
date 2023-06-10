import 'package:flutter/material.dart';

class S extends StatelessWidget {
  final double height;
  final double width;

  const S.width(this.width, {super.key}) : height = 0;
  const S.height(this.height, {super.key}) : width = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
