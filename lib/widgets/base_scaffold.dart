import 'package:flutter/material.dart';
import 'package:never_happy_custom/widgets/pink_background.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final bool useGradient;
  final FloatingActionButton? floatingActionButton;
  final PreferredSizeWidget? appBar;

  const BaseScaffold({
    Key? key,
    required this.body,
    this.useGradient = true,
    this.floatingActionButton,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = appBar?.preferredSize.height ?? kToolbarHeight;
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      floatingActionButton: floatingActionButton,
      body: Container(
        decoration: useGradient
            ? const BoxDecoration(
                gradient: LinearGradient(
                  colors: pinkBackground,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              )
            : const BoxDecoration(color: Colors.black),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.only(top: barHeight),
            child: body, 
          ),
        ),
      ),
    );
  }
}
