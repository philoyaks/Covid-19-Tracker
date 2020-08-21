import 'package:eLibrabryapp/models/getByCountryName.dart';
import 'package:eLibrabryapp/models/worldStat.dart';
import 'package:eLibrabryapp/screens/thirdScreen.dart';
import 'models/api.dart';
import 'widgets/otherConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'widgets/searchBar.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-books',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.brown,
        accentColor: Colors.green,
        splashColor: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _fromDate = DateTime.now();

  Future<void> _showDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: DateTime(2020, 3),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
          data: ThemeData.light().copyWith(
              primaryColor: Colors.brown,
              accentColor: Colors.brown,
              colorScheme: ColorScheme.light(primary: Colors.brown),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
          child: child),
    );
    if (picked != null && picked != _fromDate) {
      setState(() {
        _fromDate = picked;
      });
    }
  }

  List data;
  String query;
  var x = '';
  Future<GetByCountryName> fectchTheCountries;
  @override
  void initState() {
    super.initState();
    fectchTheCountries = fetchCountryName(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.brown,
        title: Text(
          "Covid 19 Tracker",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              query = await showSearch(context: context, delegate: SearchBar());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.brown.withOpacity(.2),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${query ?? 'World Cases'}",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                    Tooltip(
                      message: 'World Cases',
                      child: IconButton(
                          icon: SvgPicture.asset('assets/icons/worldwide.svg'),
                          onPressed: () {
                            setState(() {
                              query = null;
                            });
                          }),
                    )
                  ],
                ),
              ),
              Container(
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(.2),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  padding: EdgeInsets.only(left: 20, top: 10, right: 10),
                  child: FutureBuilder(
                      future: Future.wait([
                        fetchWorldCases(),
                        fetchCountryName(query ?? 'Nigeria')
                      ]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (query == null) {
                            return buildWrap(
                                snapshot.data[0].totalCases,
                                snapshot.data[0].totalDeaths,
                                snapshot.data[0].totalRecovered,
                                snapshot.data[0].newCases,
                                snapshot.data[0].statisticTakenAt);
                          }

                          return buildWrap(
                              snapshot
                                  .data[1].latestStatByCountry[0].totalCases,
                              snapshot
                                  .data[1].latestStatByCountry[0].totalDeaths,
                              snapshot.data[1].latestStatByCountry[0]
                                  .totalRecovered,
                              snapshot
                                  .data[1].latestStatByCountry[0].activeCases,
                              snapshot
                                  .data[1].latestStatByCountry[0].recordDate);
                        } else {
                          return Center(child: Container());
                        }
                      })),
              Visibility(
                visible: query != null,
                child: ActionChip(
                  backgroundColor: Colors.brown[50],
                  onPressed: () async {
                    await _showDatePicker();

                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdScreen(
                            date: DateFormat("yyyy-MM-dd").format(_fromDate),
                            country: query,
                          ),
                        ));
                  },
                  avatar: Icon(Icons.brightness_high),
                  label: Text("Get History Of Countries By Date"),
                ),
              ),
              subBody(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  preventionMeasures("assets/icons/noseMask.svg", "Nose mask"),
                  preventionMeasures(
                      "assets/icons/clean.svg", " Wash Your Hands"),
                  preventionMeasures(
                      "assets/icons/hand-sanitizer.svg", "Disinfectant"),
                ],
              ),
              preventionMeasures(
                  "assets/icons/shake-hands.svg", " Social Distancing"),
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width - 40,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.brown,
                    ),
                  ),
                  Align(
                      alignment: Alignment(-0.7, 2),
                      child: SvgPicture.asset(
                        'assets/icons/doctor.svg',
                        height: 100,
                      )),
                  Positioned(
                      top: 20,
                      left: 150,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(text: "Contact \n"),
                        TextSpan(text: "Medical Help!\n"),
                        TextSpan(text: "If symptoms Persist.")
                      ])))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
