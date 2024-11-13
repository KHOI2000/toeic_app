import 'package:flutter/material.dart';
import 'package:toeic_app/common/extension/extension.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, required this.size});

  final double size;

  factory Loading.small() => const Loading(size: 24);

  factory Loading.medium() => const Loading(size: 36);

  factory Loading.large() => const Loading(size: 50);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(context.color.primary),
        value: null,
        strokeWidth: 2.0,
      ),
    );
  }
}

class StackLoading extends StatelessWidget {
  const StackLoading(
      {super.key,
        required this.loading,
        required this.child,
        required this.processing});

  final Loading loading;
  final Widget child;
  final bool processing;

  factory StackLoading.small(
      {required Widget child, required bool processing}) =>
      StackLoading(
          loading: Loading.small(), processing: processing, child: child);

  factory StackLoading.medium(
      {required Widget child,
        required bool processing,
        required Loading loading}) =>
      StackLoading(
          loading: Loading.medium(), processing: processing, child: child);

  factory StackLoading.large(
      {required Widget child, required bool processing}) =>
      StackLoading(
          loading: Loading.large(), processing: processing, child: child);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        processing
            ? Center(
          child: loading,
        )
            : const SizedBox(),
      ],
    );
  }
}
