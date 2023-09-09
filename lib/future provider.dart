import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureProviderScreen extends StatelessWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => WeatherScreen()));
              },
              child: Text("go to weather screen"))),
    );
  }
}

final weatherProvider=FutureProvider((ref) => fetchWeather());

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(weatherProvider).when(data: (data){
        return Center(child: Text(data,style: TextStyle(color: Colors.red,fontSize: 24),));
      }, error: (error,StackTrace){
        return Text(error.toString());
      }, loading: (){
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}


fetchWeather()async{
  return await Future.delayed(Duration(seconds: 3),()=> "33°c");
}