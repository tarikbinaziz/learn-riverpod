
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart'as http;

import '../model/user model.dart';

class HttpGetPost{

static const baseUrl="https://jsonplaceholder.typicode.com";
static const endPoint="/posts";

 Future <List<Post>> getPost()async{
    List<Post>listPost=[];
    Uri uri=Uri.parse("$baseUrl$endPoint");
    http.Response response=await http.get(uri);
    if(response.statusCode==200){
     List<dynamic> postList=jsonDecode(response.body);
      for (var element in postList) {
        Post post=Post.fromJson(element);
        listPost.add(post);
      }
    }
    return listPost;

  }
}
var postProvider=Provider<HttpGetPost>((ref)=>HttpGetPost());

final postProviderData=FutureProvider((ref) {
  return ref.watch(postProvider).getPost();
 // return HttpGetPost().getPost();
});