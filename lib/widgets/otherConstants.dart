import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eLibrabryapp/widgets/linechart.dart';

import 'package:eLibrabryapp/widgets/constants.dart';

Padding preventionMeasures(String images, String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: Column(
      children: <Widget>[
        SvgPicture.asset(
          images,
          height: 40,
          width: 40,
        ),
        Text(title),
      ],
    ),
  );
}

class Infocard extends StatelessWidget {
  final String title;
  final String effectedNum;
  final Color color;

  const Infocard({
    Key key,
    this.title,
    this.effectedNum,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () {},
        child: Container(
          width: constraints.maxWidth / 2 - 10,
          height: 110,
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: color,
                    radius: 15,
                    child: SvgPicture.asset(
                      'assets/icons/runner.svg',
                      height: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(title),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: '$effectedNum \n',
                      style: Styles.first.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                        text: 'People',
                        style: Styles.first.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w100)),
                  ])),
                  LineChartSample(),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

Padding subBody() {
  return Padding(
    padding: EdgeInsets.only(left: 20, top: 20),
    child: Text(
      "Prevention",
      style: Styles.first.copyWith(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
    ),
  );
}

Wrap buildWrap(String confirmed, String totalDeath, String totalRecovered,
    String newCases, String date) {
  return Wrap(
    spacing: 10,
    runSpacing: 10,
    children: <Widget>[
      Infocard(
        title: 'Confirmed',
        effectedNum: confirmed,
        color: Colors.blue,
      ),
      Infocard(
          title: 'Total Deaths', effectedNum: totalDeath, color: Colors.red),
      Infocard(
          title: 'Recovered', effectedNum: totalRecovered, color: Colors.green),
      Infocard(
          title: 'Active Cases', effectedNum: newCases, color: Colors.indigo),
      Text(
        'The Statistic was taken at: $date',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    ],
  );
}

Container mainInformation(String title, String no) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    width: 250,
    height: 80,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$title :',
          style: TextStyle(
            fontSize: 20,
            decorationColor: Colors.brown,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            no,
            style: TextStyle(
                fontSize: 30,
                decorationColor: Colors.brown,
                color: Colors.brown),
          ),
        )
      ],
    ),
  );
}

String label(String x) {
  if (x == '') {
    return x = 'N/A';
  } else {
    return x;
  }
}
