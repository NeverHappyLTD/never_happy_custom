import 'package:flutter/material.dart';

import 'pink_background.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final bool showHeader;
  final bool useGradient;
  final FloatingActionButton? floatingActionButton;
  final PreferredSizeWidget? appBar;

  const BaseScaffold({
    super.key,
    required this.body,
    this.showHeader = true,
    this.useGradient = true,
    this.floatingActionButton,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    // final double barHeight = appBar?.preferredSize.height ?? kToolbarHeight;

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
        // child: SafeArea(
        //   top: false,
        //   child: Padding(
        //     padding: EdgeInsets.only(top: barHeight),
        //     child: Column(
        //       children: [
        //         if (showHeader) const CountdownHeader(),
        //         Expanded(child: body),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
