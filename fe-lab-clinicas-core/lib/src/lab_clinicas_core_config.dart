import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig({
    required this.title,
    this.bindings,
    this.routes,
    this.builders,
    this.modules,
    super.key,
  });

  final String title;
  final ApplicationBindings? bindings;
  final List<FlutterGetItPageRouter>? routes;
  final List<FlutterGetItPageBuilder>? builders;
  final List<FlutterGetItModule>? modules;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      modules: modules,
      bindings: bindings,
      pages: [...routes ?? [], ...builders ?? []],
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
          loader: LabClinicasLoader(),
          builder: (asyncStateNavObserver) {
            return MaterialApp(
              title: title,
              routes: routes,
              navigatorObservers: [asyncStateNavObserver, flutterGetItNavObserver],
            );
          },
        );
      },
    );
  }
}
