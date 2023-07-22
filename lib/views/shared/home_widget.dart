import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:onlineshop/controllers/product_provider.dart';
import 'package:onlineshop/models/bike_model.dart';
import 'package:onlineshop/views/shared/appstyle.dart';
import 'package:onlineshop/views/shared/new_shoes.dart';
import 'package:onlineshop/views/shared/product_card.dart';
import 'package:onlineshop/views/ui/product_by_cat.dart';
import 'package:onlineshop/views/ui/product_page.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<BikeProduct>> prdct,
    required this.tabIndex,
  }) : _bikeprdct = prdct;
  final Future<List<BikeProduct>> _bikeprdct;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.280,
            child: FutureBuilder<List<BikeProduct>>(
                future: _bikeprdct,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final product1 = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              productNotifier.shoesSizes = product1.sizes;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductPage(
                                          id: product1.id,
                                          category: product1.category)));
                            },
                            child: ProductCard(
                              price: "Php ${product1.price}",
                              category: product1.category,
                              id: product1.id,
                              name: product1.name,
                              image: product1.imageUrl[0],
                            ),
                          );
                        });
                  }
                })),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Bike Parts",
                    style: appstyle(15, Colors.white, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductByCat(
                                    tabIndex: tabIndex,
                                  )));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appstyle(15, Colors.white, FontWeight.w500),
                        ),
                        const Icon(
                          AntDesign.caretright,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: FutureBuilder<List<BikeProduct>>(
                future: _bikeprdct,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final product2 = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewShoes(
                              imageUrl: product2.imageUrl[1],
                            ),
                          );
                        });
                  }
                })),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Need Upgrades?",
                    style: appstyle(15, Colors.white, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductByCat(
                                    tabIndex: tabIndex,
                                  )));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appstyle(15, Colors.white, FontWeight.w500),
                        ),
                        const Icon(
                          AntDesign.caretright,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
            child: FutureBuilder<List<BikeProduct>>(
                future: _bikeprdct,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final product = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewShoes(
                              imageUrl: product.imageUrl[0],
                            ),
                          );
                        });
                  }
                })),
      ],
    );
  }
}
