import 'package:beat_the_virus/provider/ProductsProvider.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  ProductsGrid({
    Key key,
    this.chosenValue,
  }) : super(key: key);

  String chosenValue;
  List<String> prodImgLS = [
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double itemHeight =
        (SizeConfig.screenHeight - kToolbarHeight - 24) / 3;
    final double itemWidth = SizeConfig.screenWidth / 2;

    final allProdData = Provider.of<ProductsProvider>(context);
    final prodData = chosenValue == 'All'
        ? allProdData.allProducts
        : allProdData.filterByCategory(chosenValue);
    return Column(
      //mainAxisSize: MainAxisSize.min,
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
              ),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            child: Image.asset(
                              prodImgLS[index],
                              fit: BoxFit.cover,
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              prodData[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Flexible(
                          child: Text(prodData[index].description,
                              maxLines: 3, overflow: TextOverflow.ellipsis),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
