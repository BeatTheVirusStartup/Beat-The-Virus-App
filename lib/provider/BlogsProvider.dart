import 'package:amplify_flutter/amplify.dart';
import 'package:beat_the_virus/models/Blog.dart';
import 'package:flutter/material.dart';

class Blogs with ChangeNotifier {
  List<Blog> _blogs = [];

  List<Blog> get blogs {
    return [..._blogs];
  }

  Future<void> fetchAndSetBlogs() async {
    try {
      List<Blog> data = await Amplify.DataStore.query(Blog.classType,
          sortBy: [Blog.TITLE.ascending()]);
      _blogs = data;
      notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
