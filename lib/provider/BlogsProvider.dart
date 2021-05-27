import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:beat_the_virus/models/Blog.dart';
import 'package:flutter/material.dart';

class Blogs with ChangeNotifier {
  List<Blog> _blogs = [];
  List<String> _blogImgUrl = [];

  List<Blog> get blogs {
    return [..._blogs];
  }

  List<String> get blogImgUrl {
    return [..._blogImgUrl];
  }

  Future<void> fetchAndSetBlogs() async {
    try {
      List<Blog> data = await Amplify.DataStore.query(Blog.classType,
          sortBy: [Blog.TITLE.ascending()]);
      _blogs = data;
      List<String> temp = [];
      for (Blog blog in data) {
        var url = await Amplify.Storage.getUrl(key: blog.imageUrl);
        temp.add(url.url);
      }
      //print('ImgData: ' + temp.length.toString());
      _blogImgUrl = temp;
      print('ImgData: ' + _blogImgUrl.length.toString());
      notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
