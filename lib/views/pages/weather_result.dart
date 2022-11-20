// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:weather_app/c_code.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/views/widgets/circle_weather_timeline.dart';

import '../../config/assets.dart';
import '../../controllers/weather_result_controller.dart';
import '../widgets/row_card.dart';

class WeatherResultPage extends StatefulWidget {
  const WeatherResultPage({Key? key}) : super(key: key);

  @override
  State<WeatherResultPage> createState() => _WeatherResultPageState();
}

class _WeatherResultPageState extends State<WeatherResultPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        LocationModel.fromJson(getArgument(context) as Map<String, dynamic>);
    final wCtrl = context.watch<WeatherResultContoller>();
    final rCtrl = context.read<WeatherResultContoller>();
    rCtrl.setForecast(args.name, context.watchAppCtrl.appLanguage.languageCode);
    var day = wCtrl.wholeDay;
    var current = wCtrl.currentHour;

    return Scaffold(
      backgroundColor: ProjectColors.purple,
      appBar: AppBar(
        backgroundColor: ProjectColors.purple,
        centerTitle: true,
        title: Text(args.name),
        elevation: 0,
      ),
      body: conditionGetter(
        wCtrl.isLoading!,
        const Center(
          child: CircularProgressIndicator(),
        ),
        ListView(
          children: [
            Center(
              child: Text(
                DateFormat.MMMMEEEEd(
                  context.watchAppCtrl.appLanguage.languageCode,
                ).format(
                  DateTime.fromMillisecondsSinceEpoch(day!.dateEpoch! * 1000),
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      width: 80,
                      height: 120,
                      indicator: Image.asset(
                        Assets.sleepMoon,
                        height: 120,
                        width: 80,
                      ),
                    ),
                    endChild: Column(
                      children: [
                        Text(
                          current!.condition!.text!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${current.tempC!}°C',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${context.translate("humidity")} ${day.day!.avghumidity}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    startChild: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            '${context.translate('rain_avg')}: ${day.day!.dailyChanceOfRain}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${context.translate('wind')}: ${current.windKph} km/h',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${context.translate('WindDir')}: ${current.windDir}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    beforeLineStyle: const LineStyle(
                      color: ProjectColors.purpleLight,
                    ),
                    isFirst: true,
                    alignment: TimelineAlign.center,
                  ),
                  const _TimeLine(),
                  TimelineTile(
                    alignment: TimelineAlign.center,
                    indicatorStyle: IndicatorStyle(
                      width: 260,
                      height: 60,
                      indicator: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ProjectColors.purpleLight,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            context.translate("sun_moon_status")!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    beforeLineStyle: const LineStyle(
                      color: ProjectColors.purpleLight,
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: CircleWeatherTimeLine(
                      astro: day.astro!,
                    ),
                  ),
                  _TimeLine(
                    isDay: current.isDay,
                    hasIndicator: true,
                    indicatorStyle: IndicatorStyle(
                      width: 280,
                      height: 60,
                      indicator: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: ProjectColors.purpleLight,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            context.translate('day_hours')!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //REVIEW - TimeLine day hours
                  //NOTE - in this code lines wem use "for" to place all hours in card
                  //and display it in ui
                  ...<Widget>[
                    for (var hour in day.hour!) ...[
                      const _TimeLine(
                        hasIndicator: false,
                      ),
                      _TimeLine(
                        hasIndicator: true,
                        indicatorStyle: IndicatorStyle(
                          width: 270,
                          height: 370,
                          indicator: RowCardWidget(
                            hour: hour,
                          ),
                        ),
                        isDay: current.isDay,
                      ),
                    ]
                  ],
                  //REVIEW - End of TimeLine
                  _TimeLine(
                    isLast: true,
                    hasIndicator: false,
                    isDay: current.isDay,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeLine extends StatelessWidget {
  const _TimeLine({
    super.key,
    this.isDay = false,
    this.isLast = false,
    this.hasIndicator = false,
    this.isFirst = false,
    this.indicatorStyle = const IndicatorStyle(width: 20, height: 20),
  });
  final bool? isDay;
  final bool? isLast;
  final bool? hasIndicator;
  final IndicatorStyle? indicatorStyle;
  final bool? isFirst;
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      indicatorStyle: indicatorStyle!,
      hasIndicator: hasIndicator!,
      isFirst: isFirst!,
      isLast: isLast!,
      beforeLineStyle: LineStyle(
        color: conditionGetter(
          isDay!,
          Colors.yellow,
          ProjectColors.purpleLight,
        ),
      ),
    );
  }
}
