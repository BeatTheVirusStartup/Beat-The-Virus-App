import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<String> flagLS = [
    'assets/images/india.png',
    'assets/images/france.png',
    'assets/images/germany.png',
    'assets/images/italy.png',
    'assets/images/spain.png',
    'assets/images/uk.png',
    'assets/images/usa.png'
  ];
  List<String> countryLS = [
    'India',
    'France',
    'Germany',
    'Italy',
    'Spain',
    'United Kingdom',
    'USA'
  ];
  List<String> listTitleLS = [
    'All',
    'Snacks',
    'Immunity Boosting Food',
    'Supplements',
    'Drinking Water Supplements',
    'Herbs',
    'Beverages'
  ];
  String currentRegion = 'India';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Page"),
        elevation: 0,
        backgroundColor: Colors.blue[300],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                Text('Region:'),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Choose Country',
                                        style: TextStyle(fontSize: 25.0)),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: countryLS.length,
                                        itemBuilder: (ctx, index) {
                                          return ListTile(
                                            onTap: () {
                                              setState(() {
                                                currentRegion =
                                                    countryLS[index];
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            leading: Image.asset(flagLS[index]),
                                            title: Text(countryLS[index]),
                                          );
                                        }),
                                    ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text('CANCEL'))
                                  ],
                                ),
                              )));
                    },
                    child: Text(currentRegion.toUpperCase()))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: listTitleLS.length,
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(listTitleLS[i],
                              style: TextStyle(fontSize: 25.0)),
                        ),
                        Container(
                          height: 150,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (ctx, j) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.shopping_cart,
                                            color: Colors.grey[400],
                                            size: 90.0),
                                        Text('Product Name'),
                                        Text('\u{20B9} 100')
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
