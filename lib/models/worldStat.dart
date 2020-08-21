import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

final String urlForWorld =
    "https://coronavirus-monitor.p.rapidapi.com/coronavirus/worldstat.php";

Future<WorldCases> fetchWorldCases() async {
  final response = await http.get(urlForWorld, headers: {
    'x-rapidapi-host': "coronavirus-monitor.p.rapidapi.com",
    'x-rapidapi-key': "d5c4f39016msh79896141c050090p15455cjsne094ffcef69c"
  });
  if (response.statusCode == 200) {
    return WorldCases.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load countries');
  }
}

class WorldCases {
  String totalCases;
  String newCases;
  String totalDeaths;
  String newDeaths;
  String totalRecovered;
  String activeCases;
  String seriousCritical;
  String totalCasesPer1mPopulation;
  String deathsPer1mPopulation;
  String statisticTakenAt;

  WorldCases(
      {this.totalCases,
      this.newCases,
      this.totalDeaths,
      this.newDeaths,
      this.totalRecovered,
      this.activeCases,
      this.seriousCritical,
      this.totalCasesPer1mPopulation,
      this.deathsPer1mPopulation,
      this.statisticTakenAt});

  WorldCases.fromJson(Map<String, dynamic> json) {
    totalCases = json['total_cases'];
    newCases = json['new_cases'];
    totalDeaths = json['total_deaths'];
    newDeaths = json['new_deaths'];
    totalRecovered = json['total_recovered'];
    activeCases = json['active_cases'];
    seriousCritical = json['serious_critical'];
    totalCasesPer1mPopulation = json['total_cases_per_1m_population'];
    deathsPer1mPopulation = json['deaths_per_1m_population'];
    statisticTakenAt = json['statistic_taken_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_cases'] = this.totalCases;
    data['new_cases'] = this.newCases;
    data['total_deaths'] = this.totalDeaths;
    data['new_deaths'] = this.newDeaths;
    data['total_recovered'] = this.totalRecovered;
    data['active_cases'] = this.activeCases;
    data['serious_critical'] = this.seriousCritical;
    data['total_cases_per_1m_population'] = this.totalCasesPer1mPopulation;
    data['deaths_per_1m_population'] = this.deathsPer1mPopulation;
    data['statistic_taken_at'] = this.statisticTakenAt;
    return data;
  }
}
