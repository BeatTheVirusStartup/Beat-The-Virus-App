import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  String dateTime = DateFormat('MMM, dd, yyyy').format(DateTime.now());

  List<String> imgLS = [
    'assets/blog/blog4.webp',
    'assets/blog/blog.jpeg',
    'assets/blog/blog1.webp',
    'assets/blog/blog2.webp',
    'assets/blog/blog3.webp',
  ];
  List<String> titleLS = [
    'Meditation: A way to reduce your stress and make you healthy',
    'Naturopathy',
    'Food Supplements: A necessity for good health',
    'Herbs in Germany that you can use for immunity boosting',
    'Acupressure',
  ];

  List<String> contentLS = [
    'Meditation is a practice where an individual uses a technique such as mindfulness or focusing the mind on a particular object, thought, or activity to train attention and awareness, and achieve a mentally clear and emotionally calm and stable state.',
    'Naturopathy is an art and science of healthy living and a drugless system of healing based on well-founded philosophy. Naturopathy is ‘holistic’ in its own approach by taking human body as a w0hole, as it treats the root cause of the disease and not just symptoms.',
    'A natural antioxidant source, Oregano Oil contains phytochemicals which support the body’s natural resistance. Gaia Herbs supercritical CO2 extract of Oregano volatile oils contains phenols, including Carvacrol and Thymol.',
    'In scientific words “immune system is a network of biological processes that protects an organism from disease. It detects and responds to a wide variety of pathogens, from viruses to parasites.” ',
    'Acupressure is an alternative medicine technique often used for treatment of body pain , disease, pain in the joints or bones, treatment for stress etc.. It is based on the concepts of life energies which flows through ‘Meridians’  (energy network of body) in the body .',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog"),
        elevation: 0,
        backgroundColor: Colors.blue[300],
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: imgLS.length,
          itemBuilder: (ctx, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      child: Image.asset(imgLS[index], fit: BoxFit.cover)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(titleLS[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(contentLS[index],
                              style: TextStyle(fontSize: 20.0)),
                        ),
                        Text(dateTime,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 18.0)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(Icons.visibility_outlined),
                                        onPressed: () {}),
                                    Text('12')
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IconButton(
                                        onPressed: () {},
                                        icon:
                                            Icon(Icons.thumb_up_alt_outlined)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.more_vert))
                                  ]),
                            ])
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
