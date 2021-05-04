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
  String currentRegion = 'India';

  List<String> sortLS = [
    'All',
    'Snacks',
    'Immunity Boosting Food',
    'Supplements',
    'Drinking Water Supplements',
    'Herbs',
    'Beverages'
  ];
  String chosenValue = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products Page"),
          elevation: 0,
          backgroundColor: Colors.blue[300],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(children: [
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
                                              leading:
                                                  Image.asset(flagLS[index]),
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
                ]),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Text('Sort By -:'),
                  ),
                  Container(
                      height: 35.0,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.80)),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: chosenValue,
                              items: sortLS.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13.0)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  chosenValue = value;
                                });
                              })))
                ])
              ])),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(" results found in '$chosenValue'"),
          ),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.5 / 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 5.0),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.shopping_cart,
                              color: Colors.grey[400], size: 90.0),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Product Name')),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('\u{20B9} 100'))
                        ],
                      ),
                    ),
                  );
                }),
          )
        ]));
  }
}
