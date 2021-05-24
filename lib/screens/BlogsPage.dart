import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:beat_the_virus/models/Blog.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BlogsPage extends StatefulWidget {
  @override
  _BlogsPageState createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  String dateTime = DateFormat('MMM, dd, yyyy').format(DateTime.now());

  // List<Blog> blogsLS =[];
  // List<String> blogImgUrlLS=[];
  bool isDataLoaded = false;

  List<String> imgLS = [
    'assets/blog/blog3.webp',
    'assets/blog/blog1.webp',
    'assets/blog/blog2.webp',
    'assets/blog/blog4.webp',
    'assets/blog/blog.jpeg',
  ];

  @override
  void initState() {
    //getBlogsData();
    super.initState();
    // Stream<SubscriptionEvent<Blog>> stream =
    //     Amplify.DataStore.observe(Blog.classType)..listen(handleSubscription);
  }

  // void handleSubscription(SubscriptionEvent<Blog> event) async {
  //   switch (event.eventType) {
  //     case EventType.create:
  //       blogsLS.add(event.item);
  //       break;
  //     case EventType.update:
  //       var index = blogsLS.indexOf(event.item);
  //       blogsLS[index] = event.item;
  //       break;
  //     case EventType.delete:
  //       blogsLS.removeWhere((element) => element.id == event.item.id);
  //       break;
  //   }
  // }

  Future<List<Blog>> getBlogsData() async {
    try {
      List<Blog> blogsLS = [];
      await Amplify.DataStore.query(Blog.classType,
          sortBy: [Blog.TITLE.ascending()]).then((List<Blog> blogs) {
        blogsLS = blogs;
        //print('BlogData:' + blogs.toString());
      });
      return blogsLS;
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future<List<String>> getBlogsImages(List<Blog> blogs) async {
    List<String> temp = [];
    blogs.forEach((element) async {
      await Amplify.Storage.getUrl(key: element.imageKey)
          .then((GetUrlResult url) {
        temp.add(url.url);
        print('URl:' + url.url);
      });
    });
    return temp;
  }

  void getImages(List<Blog> blogs) {
    List<String> temp = [];
    blogs.forEach((element) async {
      await Amplify.Storage.getUrl(key: element.imageKey).then((value) {
        print('Url: ' + value.url);
      });
    });
    print('Temp: ' + temp.toString());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
        future: getBlogsData(),
        builder: (BuildContext context, AsyncSnapshot<List<Blog>> snapshot) {
          if (snapshot != null && snapshot.hasData) {
            return
                // Center(
                //   child: Text('Testing' + snapshot.data.length.toString()),
                // );

                Column(children: [
              Expanded(
                  child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(
                      'Blog Page',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    ElevatedButton(
                        onPressed: () => getImages(snapshot.data),
                        child: Text('Get Images'))
                  ],
                ),
              )),
              Expanded(
                  flex: 6,
                  child: Container(
                      color: Colors.white,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10.0),
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, index) {
                            return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Column(children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.0),
                                          topRight: Radius.circular(15.0)),
                                      child: Image.asset(imgLS[index],
                                          fit: BoxFit.cover)),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(snapshot.data[index].title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Text(
                                                    snapshot
                                                        .data[index].content,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1)),
                                            Text(dateTime,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                        Text(snapshot
                                                            .data[index].views
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
                                                            icon: Icon(Icons
                                                                .more_vert))
                                                      ])
                                                ])
                                          ]))
                                ]));
                          })))
            ]);
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

// List<String> titleLS = [
//     'Meditation: A way to reduce your stress and make you healthy',
//     'Naturopathy',
//     'Food Supplements: A necessity for good health',
//     'Herbs in Germany that you can use for immunity boosting',
//     'Acupressure',

//   ];

//   List<String> contentLS = [
//     'Meditation is a practice where an individual uses a technique such as mindfulness or focusing the mind on a particular object, thought, or activity to train attention and awareness, and achieve a mentally clear and emotionally calm and stable state.',
//     'Naturopathy is an art and science of healthy living and a drugless system of healing based on well-founded philosophy. Naturopathy is ‘holistic’ in its own approach by taking human body as a w0hole, as it treats the root cause of the disease and not just symptoms.',
//     'A natural antioxidant source, Oregano Oil contains phytochemicals which support the body’s natural resistance. Gaia Herbs supercritical CO2 extract of Oregano volatile oils contains phenols, including Carvacrol and Thymol.',
//     'In scientific words “immune system is a network of biological processes that protects an organism from disease. It detects and responds to a wide variety of pathogens, from viruses to parasites.” ',
//     'Acupressure is an alternative medicine technique often used for treatment of body pain , disease, pain in the joints or bones, treatment for stress etc.. It is based on the concepts of life energies which flows through ‘Meridians’  (energy network of body) in the body .',
//   ];
