import 'package:beat_the_virus/models/ModelProvider.dart';
import 'package:beat_the_virus/provider/ProductsProvider.dart';
import 'package:beat_the_virus/screens/ProductDetail.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatefulWidget {
  final String country, chosenValue;
  ProductsGrid({
    Key key,
    this.country,
    this.chosenValue,
  }) : super(key: key);

  @override
  _ProductsGridState createState() =>
      _ProductsGridState(country: country, chosenValue: chosenValue);
}

class _ProductsGridState extends State<ProductsGrid> {
  final String country, chosenValue;

  _ProductsGridState({this.country, this.chosenValue});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double itemHeight =
        (SizeConfig.screenHeight - kToolbarHeight - 24) / 3;
    final double itemWidth = SizeConfig.screenWidth / 2;

    final allProdData = Provider.of<ProductsProvider>(context);
    final prodData = widget.chosenValue == 'All'
        ? allProdData.allProducts
        : allProdData.filterByCategory(widget.country, widget.chosenValue);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: prodData.length.toString(),
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            TextSpan(
                text: " Results found in ${widget.chosenValue} :-",
                style: TextStyle(color: Colors.black))
          ]),
        ),
      ),
      Expanded(
          child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: prodData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 5.0),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              ProductDetail(product: prodData[index]))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0)),
                                child: CachedNetworkImage(
                                  imageUrl: prodData[index].imageUrl,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                              color: Colors.grey,
                                              value: downloadProgress.progress),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error, color: Colors.red),
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            prodData[index].name != null
                                                ? prodData[index].name
                                                : 'NO DATA',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Flexible(
                                        child: Text(
                                            prodData[index].description != null
                                                ? prodData[index].description
                                                : 'NO DATA',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    ]))
                          ]),
                    ));
              }))
    ]);
  }
}
