import 'package:beat_the_virus/provider/BlogsProvider.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BlogsGrid extends StatefulWidget {
  BlogsGrid({Key key}) : super(key: key);

  @override
  _BlogsGridState createState() => _BlogsGridState();
}

class _BlogsGridState extends State<BlogsGrid> {
  String dateTime = DateFormat('dd,MMM, yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(children: [
      Expanded(
          child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Text(
          'Blog Page',
          style: Theme.of(context).textTheme.headline6,
        ),
      )),
      Consumer<Blogs>(
        builder: (ctx, blogsData, ch) {
          return Expanded(
              flex: 6,
              child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      itemCount: blogsData.blogs.length,
                      itemBuilder: (ctx, index) {
                        return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            child: Column(children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0)),
                                  child: CachedNetworkImage(
                                    imageUrl: blogsData.blogs[index].imageUrl,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                            color: Colors.grey),
                                    errorWidget: (context, url, error) =>
                                        Image.asset('assets/images/noImage.png',
                                            fit: BoxFit.cover,
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    40),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(blogsData.blogs[index].title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Text(
                                                blogsData.blogs[index]
                                                            .content !=
                                                        null
                                                    ? blogsData
                                                        .blogs[index].content
                                                    : 'NO DATA',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1)),
                                        Text(dateTime,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    IconButton(
                                                        icon: Icon(Icons
                                                            .visibility_outlined),
                                                        onPressed: () {}),
                                                    Text(blogsData
                                                        .blogs[index].views
                                                        .toString())
                                                  ]),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(Icons
                                                            .thumb_up_alt_outlined)),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                            Icons.more_vert))
                                                  ])
                                            ])
                                      ]))
                            ]));
                      })));
        },
      )
    ]);
  }
}
