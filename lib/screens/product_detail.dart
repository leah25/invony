import "package:flutter/material.dart";
import 'package:invony/screens/utils/constants.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail(
      {Key? key,
      required this.category,
      required this.description,
      required this.id,
      required this.imageUrl,
      required this.name,
      required this.price})
      : super(key: key);
  final String price;
  final String category;
  final String description;
  final String imageUrl;
  final String name;
  final int id;
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _isPressed = false;
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Text(
          'Product Detail',
          style: AppConstants().kTextStyleMedium.copyWith(fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: AppConstants.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppConstants.secondColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 153.92,
                      width: 153.92,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppConstants.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(widget.imageUrl),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        widget.name,
                        style: AppConstants().kTextStyleMedium,
                      ),
                    ),
                  ),
                  Text(
                    widget.category,
                    style: AppConstants().kTextStyleMediumLight,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.price,
                      style: AppConstants().kTextStyleMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Details',
                style:
                    AppConstants().kTextStyleMediumLight.copyWith(fontSize: 16),
              ),
            ),
            Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.description,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              color: Colors.white,
              child: Center(
                child: _isPressed
                    ? Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  value--;
                                });
                              },
                              child: Container(
                                height: 56.0,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        color: AppConstants.secondColor,
                                        width: 3.0,
                                      ),
                                      top: BorderSide(
                                        color: AppConstants.secondColor,
                                        width: 3.0,
                                      ),
                                      bottom: BorderSide(
                                        color: AppConstants.secondColor,
                                        width: 3.0,
                                      ),
                                    ),
                                    // borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                                child: Icon(
                                  Icons.remove,
                                  color: Color(0xFF275D75),
                                  size: 25,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: AppConstants.secondColor,
                                        width: 3.0),
                                    bottom: BorderSide(
                                      color: AppConstants.secondColor,
                                      width: 3.0,
                                    )),
                                color: AppConstants.secondColor,
                              ),
                              child: Text(
                                value.toString(),
                                style: TextStyle(
                                    fontSize: 25, color: Color(0xFF275D75)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  value++;
                                });
                              },
                              child: Container(
                                height: 56.0,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: AppConstants.secondColor,
                                        width: 3.0,
                                      ),
                                      top: BorderSide(
                                        color: AppConstants.secondColor,
                                        width: 3.0,
                                      ),
                                      bottom: BorderSide(
                                        color: AppConstants.secondColor,
                                        width: 3.0,
                                      ),
                                    ),
                                    // borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFF275D75),
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        height: 56,
                        width: 334,
                        decoration: BoxDecoration(
                            color: AppConstants.secondColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isPressed = true;
                            });
                          },
                          child: Text(
                            'ADD TO BASKET',
                            style: AppConstants().kTextStyleMedium.copyWith(
                                fontSize: 15.0, fontWeight: FontWeight.w900),
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
