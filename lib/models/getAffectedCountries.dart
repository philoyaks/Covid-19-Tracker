

class GetCountries {
  List<String> affectedCountries;
  String statisticTakenAt;

  GetCountries({this.affectedCountries, this.statisticTakenAt});

  GetCountries.fromJson(Map<String, dynamic> json) {
    affectedCountries = json['affected_countries'].cast<String>();
    statisticTakenAt = json['statistic_taken_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['affected_countries'] = this.affectedCountries;
    data['statistic_taken_at'] = this.statisticTakenAt;
    return data;
  }
}
