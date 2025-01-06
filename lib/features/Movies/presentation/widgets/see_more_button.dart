import 'package:flutter/material.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: const [
            Text(
              'See More',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.0,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}