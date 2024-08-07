import 'package:fe_lab_clinicas_core/src/theme/lab_clinicas_theme.dart';
import 'package:flutter/material.dart';

class IconPopupMenuWidget extends StatelessWidget {
  const IconPopupMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: LabClinicasTheme.orangeColor,
        ),
      ),
      child: const Icon(
        Icons.more_horiz_rounded,
        color: LabClinicasTheme.lightOrangeColor,
      ),
    );
  }
}
