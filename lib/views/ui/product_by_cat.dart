import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:onlineshop/models/bike_model.dart';
import 'package:onlineshop/services/helper.dart';
import 'package:onlineshop/views/shared/appstyle.dart';
import 'package:onlineshop/views/shared/category_btn.dart';
import 'package:onlineshop/views/shared/custom_spacer.dart';
import 'package:onlineshop/views/shared/latest_shoes.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<BikeProduct>> _be;
  late Future<List<BikeProduct>> _bs;
  late Future<List<BikeProduct>> _bu;

  void getMale() {
    _be = Helper().getEssentialsSneakers();
  }

  void getFemale() {
    _bs = Helper().getEssentialsSneakers();
  }

  void getkids() {
    _bu = Helper().getEssentialsSneakers();
  }

  @override
  void initState() {
    super.initState();
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
    getMale();
    getkids();

    getFemale();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> brand = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/TopImage.png"),
                  fit: BoxFit.fill,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(
                        0, 0, 0, 0.3), // Black color with 30% opacity
                    Color.fromRGBO(0, 0, 0, 0.0), // Transparent color
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            AntDesign.close,
                            color: Color.fromARGB(255, 121, 120, 120),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(
                            FontAwesome.sliders,
                            color: Color.fromARGB(255, 121, 120, 120),
                          ),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.black,
                    labelStyle: appstyle(24, Colors.black, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: "Bike Essentials",
                      ),
                      Tab(
                        text: "Bike Styles",
                      ),
                      Tab(
                        text: "Bike Upgrades",
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.175,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(controller: _tabController, children: [
                  latestShoes(prdct: _be),
                  latestShoes(prdct: _bs),
                  latestShoes(prdct: _bu),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double value = 100;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.84,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      children: [
                        const CustomSpacer(),
                        Text(
                          "Ride n Roll",
                          style: appstyle(40, Colors.black, FontWeight.bold),
                        ),
                        const CustomSpacer(),
                        Text(
                          "Bike Products",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            CategoryBtn(
                              label: "Essentials",
                              buttonClr: Colors.black,
                            ),
                            CategoryBtn(
                              label: "Styles",
                              buttonClr: Colors.grey,
                            ),
                            CategoryBtn(
                              label: "Upgrades",
                              buttonClr: Colors.grey,
                            ),
                          ],
                        ),
                        const CustomSpacer(),
                        Text(
                          "Products",
                          style: appstyle(20, Colors.black, FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            CategoryBtn(
                              label: "Gloves",
                              buttonClr: Colors.black,
                            ),
                            CategoryBtn(
                              label: "Shifters",
                              buttonClr: Colors.grey,
                            ),
                            CategoryBtn(
                              label: "Saddles",
                              buttonClr: Colors.grey,
                            ),
                          ],
                        ),
                        const CustomSpacer(),
                        Text(
                          "Price",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        const CustomSpacer(),
                        Slider(
                            value: value,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            thumbColor: Colors.black,
                            max: 500,
                            divisions: 50,
                            label: value.toString(),
                            secondaryTrackValue: 200,
                            onChanged: (double value) {}),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
