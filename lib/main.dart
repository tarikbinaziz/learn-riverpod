import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/state%20notifire%20provider.dart';
import 'package:learn_riverpod/state%20provider.dart';
import 'package:learn_riverpod/stream%20provider.dart';

import 'api_services_data.dart';
import 'change notifire provider.dart';
import 'future provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ProviderScope(
      child: MaterialApp(
        home:  ApiData(),
      ),
    );
  }
}


