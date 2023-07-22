import 'package:flutter/material.dart';
import 'package:onlineshop/models/bike_model.dart';
import 'package:onlineshop/services/helper.dart';
import 'package:onlineshop/views/shared/appstyle.dart';
import 'package:onlineshop/views/shared/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<BikeProduct>> _be;
  late Future<List<BikeProduct>> _bs;
  late Future<List<BikeProduct>> _bu;

  void getMale() {
    _be = Helper().getEssentialsSneakers();
  }

  void getFemale() {
    _bs = Helper().getStylesSneakers();
  }

  void getkids() {
    _bu = Helper().getUpgradesSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getkids();
    getFemale();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0x040404),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            backgroundColor: Colors.black, // Set the background color to black
            title: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Ride n' Roll",
                      style: appstyleWithHt(
                        30,
                        Color.fromARGB(255, 255, 255, 255),
                        FontWeight.bold,
                        1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 10, 0, 0),
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
              ),
              Container(
                color: const Color(0x040404),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Color.fromARGB(255, 0, 0, 0),
                  labelStyle: appstyle(18, Colors.black, FontWeight.bold),
                  unselectedLabelColor:
                      Color.fromARGB(255, 46, 46, 46).withOpacity(0.3),
                  tabs: const [
                    Tab(
                      text: "Bike Essentials",
                    ),
                    Tab(
                      text: "Bike Styles",
                    ),
                    Tab(
                      text: "Bike Upgrades",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Container(
                  child: TabBarView(controller: _tabController, children: [
                    HomeWidget(
                      prdct: _be,
                      tabIndex: 0,
                    ),
                    HomeWidget(
                      prdct: _bs,
                      tabIndex: 1,
                    ),
                    HomeWidget(
                      prdct: _bu,
                      tabIndex: 2,
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
