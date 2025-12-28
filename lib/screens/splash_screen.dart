import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:never_happy_custom/widgets/base_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return BaseScaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth * 0.7,
              child: SvgPicture.asset(
                'assets/NeverHappyLogoName.svg',
                package: 'never_happy_custom',
                fit: BoxFit.contain,
              ),
            );
          },
        ),
      ),
    );
  }
}
