import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final bool isLoading;

  const LoadingIndicatorWidget({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox.shrink();

    return const Center(
      child: LinearProgressIndicator(),
    );
  }
}
