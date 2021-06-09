import 'package:beat_the_virus/models/ModelProvider.dart';
import 'package:beat_the_virus/provider/ProductsProvider.dart';
import 'package:beat_the_virus/screens/ProductDetail.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final String chosenValue;
  ProductsGrid({
    Key key,
    this.chosenValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double itemHeight =
        (SizeConfig.screenHeight - kToolbarHeight - 24) / 2.75;
    final double itemWidth = SizeConfig.screenWidth / 2;

    final allProdData = Provider.of<ProductsProvider>(context);
    final prodData = chosenValue == 'All'
        ? allProdData.allProducts
        : allProdData.filterByCategory(chosenValue);

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
                text: " Results found in $chosenValue :-",
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
                                      Image.asset(
                                    'assets/images/noImage.png',
                                    fit: BoxFit.cover,
                                    width: SizeConfig.blockSizeHorizontal * 35,
                                  ),
                                )),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 5.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                              prodData[index].description !=
                                                      null
                                                  ? prodData[index].description
                                                  : 'NO DATA',
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis),
                                        )
                                      ])),
                            ),
                          ]),
                    ));
              }))
    ]);
  }
}
