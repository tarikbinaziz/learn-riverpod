import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateNotifireProviderScreen extends StatelessWidget {
  const StateNotifireProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CounterScreen()));
              },
              child: Text("go to state notifire screen"))),
    );
  }
}

final counterProvider = StateNotifierProvider<ConterNotifire,int>((ref)=>ConterNotifire());

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(counterProvider.notifier).increament();
      },child: Icon(Icons.add),),
      body: Center(
          child: Text(
            value.toString(),
            style: TextStyle(color: Colors.red, fontSize: 24),
          ))
    );
  }
}

class ConterNotifire extends StateNotifier<int>{
  ConterNotifire():super(0);
  increament(){
    state=state+1;
  }
}