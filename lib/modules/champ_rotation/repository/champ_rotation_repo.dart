import 'dart:convert';

import 'package:alpha/modules/champ_rotation/models/champion.dart';
import 'package:alpha/modules/champ_rotation/services/champ_rotation_service.dart';
import 'package:http/http.dart';

class ChampRotationRepository {
  Future<dynamic> getChampionRotation() async {
    try {
      Response response =
          await ChampionRotationService().getWeeklyChampionRotation();
      List<Champion> champs = [];
      jsonDecode(response.body)['champions']
          .forEach((c) => champs.add(Champion.fromJson(c['node'])));
      return champs;
    } catch (e) {
      rethrow;
    }
  }
}
