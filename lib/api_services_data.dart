import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/services/get_services.dart';


class ApiData extends ConsumerWidget {
  const ApiData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(postProviderData);
    return Scaffold(
      body: Center(
        child: data.when(
          data: (data){
            return ListView.builder(
              itemCount:data.length,
              itemBuilder: (BuildContext context, int index) { 
                return ListTile(
                  title: Text(data[index].id.toString()),
                  subtitle: Text(data[index].title.toString()),
                  trailing: Text(data[index].userId.toString()),

                );
              },);
          },
          error: (error,S){
            return Text(error.toString());
          },
          loading: (){
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
