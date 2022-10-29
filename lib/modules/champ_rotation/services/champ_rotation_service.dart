import 'package:alpha/Enums/request_methods.dart';
import 'package:alpha/Network/network_layer.dart';
import 'package:alpha/constants/network_consts.dart';

class ChampionRotationService {
  Future<dynamic> getWeeklyChampionRotation() => Api().request(
          '${NetworkConstants.baseUrl}${NetworkConstants.getChampionRotation}?page=0&size=10',
          RequestMethod.get, {
        'X-RapidAPI-Key': '359823f45dmshdad0b37e64ffa77p1be725jsn0db007277649',
        'X-RapidAPI-Host': 'league-of-legends-champions.p.rapidapi.com'
      });
}
