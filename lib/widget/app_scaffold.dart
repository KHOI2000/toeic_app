import 'package:flutter/material.dart';
import 'package:toeic_app/common/extension/extension.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final Color? backButtonColor;
  final List<Widget>? actions;
  final bool autoImplyLeading;
  final bool hideAppbar;

  const AppScaffold(
      {super.key,
        required this.child,
        this.title = '',
        this.backButtonColor,
        this.actions,
        this.autoImplyLeading = true,
        this.hideAppbar = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.color.background,
      appBar: !hideAppbar
          ? AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          title,
          style: context.theme.textThemePrimary.s18.bold,
        ),
        actions: actions,
        centerTitle: true,
        automaticallyImplyLeading: autoImplyLeading,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: context.color.primary, //change your color here
        ),
      )
          : null,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
