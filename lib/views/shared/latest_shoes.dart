import 'package:flutter/material.dart';

import 'package:onlineshop/models/bike_model.dart';
import 'package:onlineshop/views/shared/stagger_tile.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class latestShoes extends StatelessWidget {
  const latestShoes({
    super.key,
    required Future<List<BikeProduct>> prdct,
  }) : _bikeprdct = prdct;

  final Future<List<BikeProduct>> _bikeprdct;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BikeProduct>>(
        future: _bikeprdct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else {
            final product = snapshot.data;
            return StaggeredGridView.countBuilder(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 16,
                itemCount: product!.length,
                scrollDirection: Axis.vertical,
                staggeredTileBuilder: (index) => StaggeredTile.extent(
                    (index % 2 == 0) ? 1 : 1,
                    (index % 4 == 1 || index % 4 == 3)
                        ? MediaQuery.of(context).size.height * 0.35
                        : MediaQuery.of(context).size.height * 0.35),
                itemBuilder: (context, index) {
                  final shoe = snapshot.data![index];
                  return StaggerTile(
                      imageUrl: shoe.imageUrl[1],
                      name: shoe.name,
                      price: "\$${shoe.price}");
                });
          }
        });
  }
}
