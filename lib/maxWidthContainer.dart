import 'package:flutter/material.dart';
import 'package:testapp/breakpoints.dart';
import 'package:testapp/responsiveLayout.dart';

class Maxwidthcontainer extends StatelessWidget {
  // ignore: use_super_parameters
  const Maxwidthcontainer({super.key ,  required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
                constraints: const BoxConstraints(
          maxWidth: kMaxWith,

        ),
        child: child,

      ),
    );
  }
}