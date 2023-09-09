import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeNotifireProviderScreen extends StatelessWidget {
  const ChangeNotifireProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CounterScreen()));
              },
              child: Text("go to change notifire screen"))),
    );
  }
}

final counterProvider = ChangeNotifierProvider((ref) => ConterNotifire());

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(counterProvider.notifier).changeName();
      },child: Icon(Icons.add),),
      body: Center(
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              var value = ref.watch(counterProvider);
              return Text(value.name);
            },
          ))
    );
  }
}

class ConterNotifire extends ChangeNotifier{
 String name="tarik";
  changeName(){
   name="Your name is change";
   notifyListeners();
  }
}