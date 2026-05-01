import 'package:flutter/material.dart';

import '../color/Colors.dart';

class InternetExceptionWidget extends StatelessWidget {
  final double size ;
  final String errorMessage ;
  final VoidCallback onPress ;
  const InternetExceptionWidget({super.key , this.size = 50 , required this.errorMessage , required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,

        ),
        Icon(
          Icons.cloud_off,
          color: AppColors.internetExceptionWidgetIconColor,
          size: size,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.05,

        ),
        ElevatedButton(
            onPressed: onPress,
            child: Center(
              child: Text(
                'RETRY',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
        )
      ],
    );
  }
}
