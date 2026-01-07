import 'package:flutter/material.dart';
import 'package:testapp/maxWidthContainer.dart';
import 'package:testapp/responsiveLayout.dart';

class Mediaquerytesting extends StatelessWidget {
  const Mediaquerytesting({super.key});

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //appBar: screenWidth >= 1200 ? AppBar() : null,
      body: Maxwidthcontainer(
        child: Responsivelayout(
          mobileBody: CustomMobileContent(),
          tabletBody: CustomTabletContent(), desktopBody: Container(
            color: Colors.purple,
            child: const Center(
              child: Text("This is desktop layout"),
            ),
          ),
        ),
      )
    );
  }
}

class CustomMobileContent extends StatelessWidget {
  const CustomMobileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(
        child: Text("This is mobile layout"),
      ),
    );
  }
}

class CustomTabletContent extends StatelessWidget {
  const CustomTabletContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: const Center(
        child: Text("This is tablet layout"),
      ),
    );
  }
}