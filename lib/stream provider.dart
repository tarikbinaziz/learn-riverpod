import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => NumberScreen()));
              },
              child: Text("go to number screen"))),
    );
  }
}

final numberProvider = StreamProvider((ref) => fetchNumber());

class NumberScreen extends ConsumerWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(numberProvider);
    return Scaffold(
      appBar: AppBar(),
      body: value.when(data: (data) {
        return Center(
            child: Text(
          data.toString(),
          style: TextStyle(color: Colors.red, fontSize: 24),
        ));
      }, error: (error, stackTrace) {
        return Text(error.toString());
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}

fetchNumber() {
  return Stream.periodic(Duration(seconds: 2), (number) => number).take(100);
}
