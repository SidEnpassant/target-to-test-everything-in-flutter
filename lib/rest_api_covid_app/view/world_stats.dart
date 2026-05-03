import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:testapp/rest_api_covid_app/Models/WorldStatsModel.dart';
import 'package:testapp/rest_api_covid_app/Services/states_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'countries_list.dart';


class WorldStats extends StatefulWidget {
  const WorldStats({super.key});

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 3
      )
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color> [
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {

    StatsServices statsServices = StatsServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.01,
                  ),
                  FutureBuilder(
                      future: statsServices.fetchWorldStatsRecords(),
                      builder: (context , AsyncSnapshot<WorldStatsModel> snapshot){
                        print('This is api data :');
                        print(snapshot.data);
                        if(snapshot.hasData){
                          return Expanded(
                            child: Column(
                              children: [
                                PieChart(
                                  dataMap: {
                                    "Total": double.parse(snapshot.data!.cases!.toString()),
                                    "Recovered": double.parse(snapshot.data!.recovered.toString()),
                                    "Deaths": double.parse(snapshot.data!.deaths.toString()),

                                    // "Total": 20,
                                    // "Recovered": 15,
                                    // "Deaths": 5,
                                  },
                                  chartValuesOptions: const ChartValuesOptions(
                                    showChartValuesInPercentage: true,
                                  ),
                                  animationDuration: const Duration(
                                    milliseconds: 1200,
                                  ),
                                  chartType: ChartType.ring,
                                  colorList: colorList,
                                  chartRadius: MediaQuery.of(context).size.width*0.5,
                                  legendOptions: const LegendOptions(
                                      legendPosition: LegendPosition.left
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: MediaQuery.of(context).size.height*.06
                                  ),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        ReusableRow(title: 'Cases', value: snapshot.data!.cases.toString(),),
                                        ReusableRow(title: 'Deaths', value: snapshot.data!.deaths.toString(),),
                                        ReusableRow(title: 'Recovered', value: snapshot.data!.recovered.toString(),),
                                        ReusableRow(title: 'Active', value: snapshot.data!.active.toString(),),
                                        ReusableRow(title: 'Critical', value: snapshot.data!.critical.toString(),),
                                        ReusableRow(title: 'Tests per 1M', value: snapshot.data!.testsPerOneMillion.toString(),),
                                        // ReusableRow(title: 'Today Cases', value: snapshot.data!.todayCases.toString(),),
                                        // ReusableRow(title: 'Today Deaths', value: snapshot.data!.todayDeaths.toString(),),
                                        // ReusableRow(title: 'Today Recovered', value: snapshot.data!.todayRecovered.toString(),),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CountriesList()));
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xff4285F4),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text('Track Countries'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }else{
                          return Expanded(
                              flex: 1,
                              child: SpinKitFadingCircle(
                                color: Colors.white,
                                size: 50,
                                controller: _controller,
                              )
                          );
                        }
                      }
                  ),
                ],
              ),
          )
      ),
    );
  }
}



class ReusableRow extends StatelessWidget {
  String title , value;
  ReusableRow({super.key, required this.title , required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10 , top: 10 , bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider()
        ],
      ),
    );
  }
}
