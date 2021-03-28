import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    DateTime now= new DateTime.now();
    return Scaffold(
      appBar: AppBar(title: Text('Blog'),
        backgroundColor:Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed:(){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Image.asset('assets/blog/blog.jpeg'),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    SizedBox(width:10 ),
                    Text('${now.day}'),
                    SizedBox(width:3),
                    Text('days ago'),

                    Text( '.${now.minute}'),
                    SizedBox(width:3),
                    Text('min'),


                    SizedBox(width:230),
                    IconButton(
                      icon: Icon(Icons.more_vert_sharp),
                      onPressed:(){
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Naturopathy',
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Text('Naturopathy is an art and science of healthy living and a drugless system of healing based on well-founded philosophy. Naturopathy is...',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height:10 ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    IconButton(
                      icon: Icon(Icons.visibility_outlined),
                      onPressed:(){
                      },
                    ),
                    SizedBox(width: 300),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children:[
                        IconButton(
                          icon: Icon(Icons.thumb_up_alt_outlined),
                          onPressed:(){
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height:10 ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(height:20 ),
            Column(
              children: [
                Image.asset('assets/blog/blog1.webp'),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Row(
                  children:[

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    IconButton(
                      icon: Icon(Icons.more_vert_sharp),
                      onPressed:(){
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Food supplements: A necessity for good health',
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Text('1. Gaia Herbs oil of Oregano A natural antioxidant source, Oregano Oil contains phytochemicals which support the body’s n…',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height:10 ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    IconButton(
                      icon: Icon(Icons.visibility_outlined),
                      onPressed:(){
                      },
                    ),
                    SizedBox(width: 300),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children:[
                        IconButton(
                          icon: Icon(Icons.thumb_up_alt_outlined),
                          onPressed:(){
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height:10 ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(height:20 ),
            Column(
              children: [
                Image.asset('assets/blog/blog2.webp'),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Row(
                  children:[

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    IconButton(
                      icon: Icon(Icons.more_vert_sharp),
                      onPressed:(){
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Herbs in Germany that you can use for immunity boosting',
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Text('In scientific words “immune system is a network of biological processes that protects an organism from disease. It detects and re…',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height:10 ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    IconButton(
                      icon: Icon(Icons.visibility_outlined),
                      onPressed:(){
                      },
                    ),
                    SizedBox(width: 300),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children:[
                        IconButton(
                          icon: Icon(Icons.thumb_up_alt_outlined),
                          onPressed:(){
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height:10 ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(height:20 ),
            Column(
              children: [
                Image.asset('assets/blog/blog3.webp'),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Row(
                  children:[

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    IconButton(
                      icon: Icon(Icons.more_vert_sharp),
                      onPressed:(){
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Acupressure',
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Text('Acupressure is an alternative medicine technique often used for treatment of body pain , disease, pain in the joints or bones, tr…',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height:10 ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    IconButton(
                      icon: Icon(Icons.visibility_outlined),
                      onPressed:(){
                      },
                    ),
                    SizedBox(width: 300),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children:[
                        IconButton(
                          icon: Icon(Icons.thumb_up_alt_outlined),
                          onPressed:(){
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height:10 ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(height:20 ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.more_horiz_rounded),
      ),
    );
  }
}
