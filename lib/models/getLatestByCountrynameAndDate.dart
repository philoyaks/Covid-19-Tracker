


class HistoryByDate {
  String country;
  List<StatByCountry> statByCountry;

  HistoryByDate({this.country, this.statByCountry});

  HistoryByDate.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    if (json['stat_by_country'] != null) {
      statByCountry = new List<StatByCountry>();
      json['stat_by_country'].forEach((v) {
        statByCountry.add(new StatByCountry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    if (this.statByCountry != null) {
      data['stat_by_country'] =
          this.statByCountry.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatByCountry {
  String countryName;
  String totalCases;
  String newCases;
  String activeCases;
  String totalDeaths;
  String newDeaths;
  String totalRecovered;
  String seriousCritical;
  String totalCasesPer1m;
  String recordDate;

  StatByCountry(
      {this.countryName,
      this.totalCases,
      this.newCases,
      this.activeCases,
      this.totalDeaths,
      this.newDeaths,
      this.totalRecovered,
      this.seriousCritical,
      this.totalCasesPer1m,
      this.recordDate});

  StatByCountry.fromJson(Map<String, dynamic> json) {
    countryName = json['country_name'];
    totalCases = json['total_cases'];
    newCases = json['new_cases'];
    activeCases = json['active_cases'];
    totalDeaths = json['total_deaths'];
    newDeaths = json['new_deaths'];
    totalRecovered = json['total_recovered'];
    seriousCritical = json['serious_critical'];
    totalCasesPer1m = json['total_cases_per1m'];
    recordDate = json['record_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_name'] = this.countryName;
    data['total_cases'] = this.totalCases;
    data['new_cases'] = this.newCases;
    data['active_cases'] = this.activeCases;
    data['total_deaths'] = this.totalDeaths;
    data['new_deaths'] = this.newDeaths;
    data['total_recovered'] = this.totalRecovered;
    data['serious_critical'] = this.seriousCritical;
    data['total_cases_per1m'] = this.totalCasesPer1m;
    data['record_date'] = this.recordDate;
    return data;
  }
}
