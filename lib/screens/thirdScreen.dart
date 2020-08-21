import 'package:eLibrabryapp/models/api.dart';
import 'package:eLibrabryapp/models/getLatestByCountrynameAndDate.dart';
import 'package:eLibrabryapp/widgets/otherConstants.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  final String date;
  final String country;

  const ThirdScreen({Key key, this.date, this.country}) : super(key: key);
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: FutureBuilder<HistoryByDate>(
          future: fectchByHistory(widget.country, widget.date.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var x = snapshot.data.statByCountry.length - 1;
              return Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      height: 150,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                            colors: [
                              Colors.brown,
                              Colors.brown.withOpacity(.3)
                            ],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(20),
                            left: Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Country : ${widget.country}",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white70),
                          ),
                          Text(
                            "Date Picked: ${widget.date}",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.red,
                    ),
                    mainInformation(' Total Cases',
                        label(snapshot.data.statByCountry[x].totalCases)),
                    mainInformation(' New Cases',
                        label(snapshot.data.statByCountry[x].newCases)),
                    mainInformation('Active Cases',
                        label(snapshot.data.statByCountry[x].activeCases)),
                    mainInformation('Total Deaths',
                        label(snapshot.data.statByCountry[x].totalDeaths)),
                    mainInformation('New Deaths',
                        label(snapshot.data.statByCountry[x].newDeaths)),
                    mainInformation('Total Recovered',
                        label(snapshot.data.statByCountry[x].totalRecovered)),
                    mainInformation('Serious Critical',
                        label(snapshot.data.statByCountry[x].seriousCritical)),
                    mainInformation('TotalCases Per1m',
                        label(snapshot.data.statByCountry[x].totalCasesPer1m)),
                    mainInformation('Record Date',
                        label(snapshot.data.statByCountry[x].recordDate)),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
