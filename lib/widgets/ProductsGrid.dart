import 'package:beat_the_virus/provider/ProductsProvider.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatefulWidget {
  ProductsGrid({
    Key key,
    this.country,
    this.chosenValue,
  }) : super(key: key);

  final String country, chosenValue;

  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  List<String> indProdImgLS = [
    'assets/products/india/daburImmunityKit.webp',
    'assets/products/india/himalayaAshvagandha.webp',
    'assets/products/india/moringa.webp',
    'assets/products/india/neem.webp',
    'assets/products/india/neemGhanvati.webp',
    'assets/products/india/nilavembuKashayam.webp',
    'assets/products/india/trueElements.webp',
    'assets/products/india/tulsiBrahmi.webp',
    'assets/products/india/tulsiDrop.webp',
    'assets/products/india/tulsiBasil.webp',
    'assets/products/india/vezley.webp',
    'assets/products/india/youFit.webp',
  ];

  List<String> usaProdImgLS = [
    'assets/products/usa/amway.webp',
    'assets/products/usa/bioGaia.webp',
    'assets/products/usa/buddhaTeas.webp',
    'assets/products/usa/echinaceaPlus.webp',
    'assets/products/usa/herbpharma.webp',
    'assets/products/usa/maximmunity.webp',
    'assets/products/usa/nairns.webp',
    'assets/products/usa/natureVally.webp',
    'assets/products/usa/nowFoods.webp',
    'assets/products/usa/purpleConeflowerEchinacea.webp',
    'assets/products/usa/sagebrush.webp',
    'assets/products/usa/tarragon.webp',
    'assets/products/usa/usana.webp',
  ];

  List<String> tempImgLS = [];

  // void setCurrentCountryProdImgLS() {
  //   switch (widget.country) {
  //     case 'India':
  //       setState(() {
  //         tempImgLS = indProdImgLS;
  //       });
  //       break;
  //     case 'USA':
  //       setState(() {
  //         tempImgLS = usaProdImgLS;
  //       });
  //       break;
  //     default:
  //       break;
  //   }
  // }

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
    //setCurrentCountryProdImgLS();
    return Column(
      children: [
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            Flexible(
                              child: Text(
                                  prodData[index].description != null
                                      ? prodData[index].description
                                      : 'NO DATA',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
