import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'nonprofit.dart';
import 'VolunteeringActivity.dart';
import 'DonationActivity.dart';
import 'activity.dart';
import 'DetailPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        DetailPage.routeName:(context) =>
            const DetailPage(),

      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Nonprofits> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
          SizedBox(height: 40),
          Container(
            child: Text("Hi Daniel,\nhere's your impact summary",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(height: 10),
          Container(
              height: 400,
              width: 500,
              child: SfCircularChart(
                margin: EdgeInsets.all(0),
                annotations: <CircularChartAnnotation>[
                  CircularChartAnnotation(
                      widget: Container(
                          child: const Text("\n dollars \n\n hours",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15))),
                      radius: '0%',
                      verticalAlignment: ChartAlignment.center)
                  //horizontalAlignment: ChartAlignment.far)
                ],
                series: <CircularSeries>[
                  DoughnutSeries<Nonprofits, String>(
                      dataSource: getChartData(),
                      pointColorMapper: (Nonprofits data, _) => data.color,
                      xValueMapper: (Nonprofits data, _) => data.org,
                      yValueMapper: (Nonprofits data, _) => data.impact,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      explode: true,
                      explodeAll: true,
                      explodeOffset: "2%")
                  //enableTooltip: true)
                  //maximumValue: 40000)
                ],
                legend: Legend(
                    orientation: LegendItemOrientation.horizontal,
                    padding: 5,
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                    position: LegendPosition.bottom,
                    textStyle: TextStyle(fontSize: 16)),
                tooltipBehavior: _tooltipBehavior,
              )),
          SizedBox(height: 20),
          Container(
            child: Text("Milestone Breakdown",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(height: 20),
          Container(
              height: 250,
              width: 400,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.orangeAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.baseline,
                  //textBaseline: TextBaseline.alphabetic,
                  children: [
                    SizedBox(height: 40),
                    Row(children: [
                      SizedBox(width: 25),
                      Text(
                        'Volunteer',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 75),
                      Text(
                        'Remaining',
                        style: TextStyle(
                            color: Colors.brown[900],
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        SizedBox(width: 40),
                        Text('40.0',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w700)),
                        SizedBox(width: 15),
                        Text('hours',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(width: 90),
                        Text('20.0',
                            style: TextStyle(
                                color: Colors.brown[900],
                                fontSize: 35,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Stack(fit: StackFit.loose, children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 370,
                        child: Center(
                          child: SfLinearGauge(
                            axisTrackStyle: LinearAxisTrackStyle(
                              thickness: 25,
                              edgeStyle: LinearEdgeStyle.bothCurve,
                              color: Colors.brown[900],
                            ),
                            showLabels: false,
                            showTicks: false,
                            barPointers: [
                              LinearBarPointer(
                                  thickness: 25,
                                  value: 80,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  //Change the color
                                  color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 200),
                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          child: Text('2 weeks left to complete!',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500))),
                      Column(children: [
                        Container(
                            alignment: Alignment.centerRight,
                            height: 50,
                            width: 350,
                            child: Text('80%',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500))),
                      ]),
                    ]),
                    Stack(
                      children: [
                        SizedBox(width: 50),
                        Container(
                          alignment: Alignment.center,
                          child: Text('monthly goal\t\t60 dollars',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                        )
                      ],
                    )
                  ],
                ),
              )),
          SizedBox(height: 20),
          Container(
            child: Text("Recent History",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),
          ),
          //SizedBox(height: 10),
          Container(
              height: 400,
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white70,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        onTap:(){
                          Navigator.pushNamed(context, DetailPage.routeName,
                          arguments:VolunteeringActivity('Autism Speaks',DateTime(2021,11,15),3,),);
                        },
                        title: const Text('Autism Speaks',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        leading: Icon(Icons.extension_rounded),
                        subtitle: const Text('Nov 15, 2021'),
                        trailing: const Text('3 hours',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.orange)),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Action in Africa',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        leading: Icon(Icons.support),
                        subtitle: const Text('Oct 25, 2021'),
                        trailing: const Text('20 dollars',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.green)),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Lifewater',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        leading: Icon(Icons.water),
                        subtitle: const Text('Sept 15, 2021'),
                        trailing: const Text('5 hours',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.orange)),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('World Concern',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        leading: Icon(Icons.public),
                        subtitle: const Text('Sept 12, 2021'),
                        trailing: const Text('50 dollars',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.green)),
                      ),
                    ],
                  ))),
          //SizedBox(height: 5),
          Container(
            child: Text("Badges",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(height: 10),
          Container(
            height: 125,
            padding: EdgeInsets.all(15.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 110,
                  color: Colors.grey,
                  child: const Center(
                      child: Text(
                    'Badge 1',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
                SizedBox(width: 25),
                Container(
                  width: 110,
                  color: Colors.grey,
                  child: const Center(
                      child: Text(
                    'Badge 2',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
                SizedBox(width: 25),
                Container(
                  width: 110,
                  color: Colors.grey,
                  child: const Center(
                      child: Text(
                    'Badge 3',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
              ],
            ),
          ),
        ]))));
  }

  List<Nonprofits> getChartData() {
    final List<Nonprofits> chartData = [
      Nonprofits('Education', 50, Colors.deepPurple),
      Nonprofits('Cultural', 25, Colors.red),
      Nonprofits('Health', 15, Colors.teal),
      Nonprofits('Environment', 5, Colors.yellowAccent),
    ];
    return chartData;
  }
}

