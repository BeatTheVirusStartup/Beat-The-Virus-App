import 'package:beat_the_virus/provider/ProductsProvider.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:beat_the_virus/widgets/ProductsGrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    'Immunity Boosting Food Supplements',
    'Drinking Water Supplements',
    'Herbs',
    'Beverages'
  ];
  String chosenValue = 'All';
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductsProvider>(context).getProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: Text('Products Page',
                    style: Theme.of(context).textTheme.headline6),
              )),
              Expanded(
                  flex: 7,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text('Choose Country',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1),
                                                      ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              countryLS.length,
                                                          itemBuilder:
                                                              (ctx, index) {
                                                            return ListTile(
                                                              onTap: () {
                                                                setState(() {
                                                                  currentRegion =
                                                                      countryLS[
                                                                          index];
                                                                });
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              leading: Image
                                                                  .asset(flagLS[
                                                                      index]),
                                                              title: Text(
                                                                  countryLS[
                                                                      index]),
                                                            );
                                                          }),
                                                      ElevatedButton(
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(),
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
                                      height: SizeConfig.blockSizeVertical * 5,
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                              color: Colors.grey,
                                              style: BorderStyle.solid,
                                              width: 0.80)),
                                      child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              value: chosenValue,
                                              items: sortLS.map<
                                                      DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  chosenValue = value;
                                                });
                                              })))
                                ])
                              ])),
                          Expanded(
                              child: ProductsGrid(chosenValue: chosenValue)),
                        ]),
                  )),
            ],
          );
  }
}
