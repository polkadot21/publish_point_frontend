import 'package:flutter/material.dart';

class CustomScrollLoading extends StatelessWidget {
  final bool loading;

  const CustomScrollLoading({
    Key? key,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: !loading ? 1 : 0,
      child: const SizedBox(
        height: 56,
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
