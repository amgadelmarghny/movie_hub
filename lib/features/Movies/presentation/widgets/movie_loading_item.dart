import 'package:flutter/material.dart';

class MovieLoadingItem extends StatelessWidget {
  const MovieLoadingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      width: 120.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}