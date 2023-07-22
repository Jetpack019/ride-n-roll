import 'package:flutter/services.dart' as the_bundle;
import 'package:onlineshop/models/bike_model.dart';

// this class fetches data from the json file and return it to the app
class Helper {
  // Male
  Future<List<BikeProduct>> getEssentialsSneakers() async {
    final data = await the_bundle.rootBundle
        .loadString("assets/json/bike_essential.json");

    final essentialList = bikesFromJson(data);

    return essentialList;
  }

// Female
  Future<List<BikeProduct>> getStylesSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/bike_styles.json");

    final stylesList = bikesFromJson(data);

    return stylesList;
  }

// Kids
  Future<List<BikeProduct>> getUpgradesSneakers() async {
    final data = await the_bundle.rootBundle
        .loadString("assets/json/bike_upgrades.json");

    final upgradeList = bikesFromJson(data);

    return upgradeList;
  }

  // Single Male
  Future<BikeProduct> getEssentialsSneakersById(String id) async {
    final data = await the_bundle.rootBundle
        .loadString("assets/json/bike_essential.json");

    final maleList = bikesFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  // Single Male
  Future<BikeProduct> getStylesSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/bike_styles.json");

    final essentialList = bikesFromJson(data);

    final bike = essentialList.firstWhere((sneaker) => sneaker.id == id);

    return bike;
  }

  // Single Kids
  Future<BikeProduct> getUpgradesById(String id) async {
    final data = await the_bundle.rootBundle
        .loadString("assets/json/bike_upgrades.json");

    final essentialList = bikesFromJson(data);

    final bike = essentialList.firstWhere((sneaker) => sneaker.id == id);

    return bike;
  }
}
