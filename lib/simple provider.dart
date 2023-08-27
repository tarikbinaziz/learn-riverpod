import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stringProvider = Provider<String>((ref) => "tarik is a now dhaka");

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    // read  a provider
    String data= ref.read(stringProvider);
    return Scaffold(
      body: Center(child: Text(data)),
    );
  }
}