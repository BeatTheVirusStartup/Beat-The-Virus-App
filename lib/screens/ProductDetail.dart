import 'package:beat_the_virus/models/ModelProvider.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  Products product;
  ProductDetail({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState(product: product);
}

class _ProductDetailState extends State<ProductDetail> {
  Products product;

  _ProductDetailState({this.product});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.name, style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back,
                color: Colors.black, size: SizeConfig.safeBlockHorizontal * 8),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: ListView(children: [
          Expanded(
              child: Center(
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(
                      color: Colors.grey, value: downloadProgress.progress),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: Colors.red),
            ),
          )),
          Expanded(
            flex: 2,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(product.description,
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 4),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Category -: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: product.category)
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 4),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Country -: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: product.country)
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
