// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:space_app/models/planets_model.dart';
import 'package:space_app/models/rockets_model.dart';
import 'package:space_app/models/spacex_model.dart';

class SpaceXApi extends GetxController {
  Future<List<MissionItem>> MissionFetch() async {
    http.Response missionres = await http.get(
      Uri.tryParse(
        'https://api.spacexdata.com/v3/missions',
      )!,
    );

    List missionrepo = jsonDecode(missionres.body);

    return missionrepo.map((dynamic e) => MissionItem.fromJson(e)).toList();
  }

  Future<List<RocketsModel>> RocketsFetch() async {
    http.Response rocketres = await http.get(
      Uri.tryParse(
        'https://api.spacexdata.com/v3/rockets',
      )!,
    );

    List rocketrepo = jsonDecode(rocketres.body);

    return rocketrepo.map((dynamic e) => RocketsModel.fromJson(e)).toList();
  }

  Future<PlanetsModel> Planets() async {
    http.Response planetsres = await http.get(
      Uri.tryParse(
          'https://planets-17f2.onrender.com/planets/getPlanet?name=Venus')!,
    );

    if (planetsres.statusCode == 200) {
      Map<String, dynamic> planetsjson = jsonDecode(planetsres.body);
      return PlanetsModel.fromJson(planetsjson);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
