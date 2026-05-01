import 'package:flutter/material.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/config/color/Colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height;

  const RoundButton({super.key , required this.title , required this.onPress , this.height = 40});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
            ),
          ),
        )
    );
  }
}

