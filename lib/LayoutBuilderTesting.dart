import 'package:flutter/material.dart';

class LayoutBuilderTesting extends StatefulWidget {
  const LayoutBuilderTesting({super.key});

  @override
  State<LayoutBuilderTesting> createState() => _LayoutBuilderTestingState();
}

class _LayoutBuilderTestingState extends State<LayoutBuilderTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   color: Colors.white,
      // ),
      body: LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth < 600)
          {
            return Container(
              color: Colors.red,
              child: const Center(
                child: Text("This is mobile layout"),
              ),
            );
          }
          else if(constraints.maxWidth < 1200)
          {
            return Container(
              color: Colors.green,
              child: const Center(
                child: Text("This is tablet layout"),
              ),
            );
          }
          else
          {
            return Container(
              color: Colors.blue,
              child: const Center(
                child: Text("This is desktop layout"),
              ),
            );
          }
        }
        ),
    );
  }
}