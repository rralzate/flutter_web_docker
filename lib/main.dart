import 'package:flutter/material.dart';
import 'package:flutter_web_docker/maincommon.dart';

import 'core/routes/router.dart';
import 'injection_container.dart';

void main() async {
  Flurorouter.defineRoutes();
  await injectDependencies();
  runApp(const MyApp());
}
