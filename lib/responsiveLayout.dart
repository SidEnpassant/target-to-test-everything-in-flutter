import 'package:flutter/material.dart';
import 'package:testapp/breakpoints.dart';

class Responsivelayout extends StatelessWidget {
  const Responsivelayout({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
    });
  
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        if(dimens.maxWidth < kTabletBreakpoint){
          return mobileBody;
        }
        else if(dimens.maxWidth >= kTabletBreakpoint && dimens.maxWidth < kDesktopBreakpoint){
          return tabletBody ?? mobileBody;
        }
        else{
          return desktopBody ?? tabletBody ?? mobileBody;
        }
      },
    );
  }
}