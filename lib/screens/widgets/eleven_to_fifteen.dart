import 'package:flutter/material.dart';
import 'package:invony/api_call/api_data.dart';
import 'package:invony/models/product_model.dart';
import 'package:invony/screens/product_detail.dart';
import 'package:invony/screens/utils/constants.dart';
import 'package:provider/provider.dart';

class ThirdSection extends StatefulWidget {
  ThirdSection({Key? key}) : super(key: key);

  @override
  _ThirdSectionState createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> {
  bool _init = false;
  bool _isLoading = false;

  void didChangeDependencies() {
    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ApiCall>(context).getProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products =
        Provider.of<ApiCall>(context).sixteenToTwentyProducts();
    return Container(
      color: Color(0xFFE5E5E5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                " 16 - 20 Products",
                style:
                    AppConstants().kTextStyleMediumLight.copyWith(fontSize: 14),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.6),
                        controller:
                            new ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.white,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductDetail(
                                                id: products[index].id,
                                                name: products[index].name,
                                                imageUrl:
                                                    products[index].imageUrl,
                                                description:
                                                    products[index].description,
                                                category:
                                                    products[index].category,
                                                price: products[index].price)));
                                  },
                                  child: GridTile(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 153.92,
                                          width: 153.92,
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    AppConstants.primaryColor),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  products[index].imageUrl),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            height: 28.83,
                                            width: 28.83,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(9.27),
                                                border: Border.all(
                                                    color: AppConstants
                                                        .primaryColor)),
                                            child: Icon(
                                              Icons.add,
                                              size: 20.0,
                                              color: AppConstants.primaryColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Text(
                                          products[index].name,
                                          style:
                                              AppConstants().kTextStyleMedium,
                                        ),
                                      ),
                                      Text(
                                        products[index].category,
                                        style: AppConstants()
                                            .kTextStyleMediumLight
                                            .copyWith(fontSize: 14),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                        child: Text(products[index].price,
                                            style: AppConstants()
                                                .kTextStyleMedium),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
