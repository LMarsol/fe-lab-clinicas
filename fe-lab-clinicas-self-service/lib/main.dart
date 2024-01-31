import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runApp(const LabClinicasSelfServiceApp());
}

class LabClinicasSelfServiceApp extends StatelessWidget {
  const LabClinicasSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'Lab Clínicas Auto Atendimento',
      builders: [
        FlutterGetItPageBuilder(page: (_) => const SizedBox(), path: '/'),
      ],
    );
  }
}
