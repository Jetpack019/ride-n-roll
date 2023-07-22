import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:onlineshop/controllers/mainscreen_provider.dart';
import 'package:onlineshop/views/shared/bottom_nav.dart';
import 'package:onlineshop/views/shared/bottom_nav_widget.dart';
import 'package:onlineshop/views/ui/cartpage.dart';
import 'package:onlineshop/views/ui/homepage.dart';
import 'package:onlineshop/views/ui/product_by_cat.dart';
import 'package:onlineshop/views/ui/profile.dart';
import 'package:onlineshop/views/ui/searchpage.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const HomePage(),
    CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(34, 34, 34, 1),
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: const BottoNavBar(),
        );
      },
    );
  }
}
