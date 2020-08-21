

class GetByCountryName {
  String country;
  List<LatestStatByCountry> latestStatByCountry;

  GetByCountryName({this.country, this.latestStatByCountry});

  GetByCountryName.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    if (json['latest_stat_by_country'] != null) {
      latestStatByCountry = new List<LatestStatByCountry>();
      json['latest_stat_by_country'].forEach((v) {
        latestStatByCountry.add(new LatestStatByCountry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    if (this.latestStatByCountry != null) {
      data['latest_stat_by_country'] =
          this.latestStatByCountry.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LatestStatByCountry {
  String id;
  String countryName;
  String totalCases;
  String newCases;
  String activeCases;
  String totalDeaths;
  String newDeaths;
  String totalRecovered;
  String seriousCritical;
  Null region;
  String totalCasesPer1m;
  String recordDate;
  String deathsPer1m;
  String totalTests;
  String totalTestsPer1m;
  String recordDatePure;

  LatestStatByCountry(
      {this.id,
      this.countryName,
      this.totalCases,
      this.newCases,
      this.activeCases,
      this.totalDeaths,
      this.newDeaths,
      this.totalRecovered,
      this.seriousCritical,
      this.region,
      this.totalCasesPer1m,
      this.recordDate,
      this.deathsPer1m,
      this.totalTests,
      this.totalTestsPer1m,
      this.recordDatePure});

  LatestStatByCountry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryName = json['country_name'];
    totalCases = json['total_cases'];
    newCases = json['new_cases'];
    activeCases = json['active_cases'];
    totalDeaths = json['total_deaths'];
    newDeaths = json['new_deaths'];
    totalRecovered = json['total_recovered'];
    seriousCritical = json['serious_critical'];
    region = json['region'];
    totalCasesPer1m = json['total_cases_per1m'];
    recordDate = json['record_date'];
    deathsPer1m = json['deaths_per1m'];
    totalTests = json['total_tests'];
    totalTestsPer1m = json['total_tests_per1m'];
    recordDatePure = json['record_date_pure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_name'] = this.countryName;
    data['total_cases'] = this.totalCases;
    data['new_cases'] = this.newCases;
    data['active_cases'] = this.activeCases;
    data['total_deaths'] = this.totalDeaths;
    data['new_deaths'] = this.newDeaths;
    data['total_recovered'] = this.totalRecovered;
    data['serious_critical'] = this.seriousCritical;
    data['region'] = this.region;
    data['total_cases_per1m'] = this.totalCasesPer1m;
    data['record_date'] = this.recordDate;
    data['deaths_per1m'] = this.deathsPer1m;
    data['total_tests'] = this.totalTests;
    data['total_tests_per1m'] = this.totalTestsPer1m;
    data['record_date_pure'] = this.recordDatePure;
    return data;
  }
}
