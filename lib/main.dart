import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnbuddy/router.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp.router(routerConfig: goRouter)));
}
