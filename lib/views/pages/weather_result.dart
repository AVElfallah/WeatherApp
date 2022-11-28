// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:weather_app/c_code.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/model/forecast_day_model.dart';
import 'package:weather_app/model/forecast_hour_model.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/views/widgets/circle_weather_timeline.dart';
import 'package:weather_app/views/widgets/timeline_custom_widget.dart';

import '../../config/app_config.dart';
import '../../config/assets.dart';
import '../../model/forecast_enums.dart';
import '../widgets/row_card.dart';

class WeatherResultPage extends StatefulWidget {
  const WeatherResultPage({Key? key}) : super(key: key);

  @override
  State<WeatherResultPage> createState() => _WeatherResultPageState();
}

class _WeatherResultPageState extends State<WeatherResultPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint('result page rebuild');
    final args = getArgument(context) as Map<String, dynamic>;
    ForecastDayModel day = args['day'];
    ForecastHourModel current = args['current'];
    LocationModel location = args['location'];
    return Scaffold(
      backgroundColor: ProjectColors.purple,
      appBar: AppBar(
        backgroundColor: ProjectColors.purple,
        centerTitle: true,
        title: Text(location.name),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              DateFormat.MMMMEEEEd(
                context.watchAppCtrl.appLanguage.languageCode,
              ).format(
                DateTime.fromMillisecondsSinceEpoch(day.dateEpoch! * 1000),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            current.condition!.text!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${context.translate('pressure')}: ${conditionGetter(
              Appconfig.instance.pressureIn == PressureIn.inc,
              '${current.pressureIn} Inc',
              '${current.pressureMb} Mb',
            )}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
                  //SECTION -  left
                  endChild: Column(
                    children: [
                      Text(
                        conditionGetter(
                          Appconfig.instance.temperature == Temperature.c,
                          '${current.tempC}°C',
                          '${current.tempF}°F',
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                          Text(
                            '${context.translate('max')}:${conditionGetter(
                              Appconfig.instance.temperature == Temperature.c,
                              '${day.day!.maxtempC}°C',
                              '${day.day!.maxtempF}°F',
                            )}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          Text(
                            '${context.translate('min')}:${conditionGetter(
                              Appconfig.instance.temperature == Temperature.c,
                              '${day.day!.mintempC}°C',
                              '${day.day!.mintempF}°F',
                            )}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${context.translate("humidity")} ${day.day!.avghumidity!}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  //SECTION -  right
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
                          '${context.translate('wind')}: ${conditionGetter(
                            Appconfig.instance.windSpeed == WindSpeed.kph,
                            '${current.windKph} km/h',
                            '${current.windMph} m/h',
                          )}',
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
                        Text(
                          '${context.translate('clouds')}: ${current.cloud}%',
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
                const TimeLineCustomWidget(),
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
                TimeLineCustomWidget(
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
                    const TimeLineCustomWidget(
                      hasIndicator: false,
                    ),
                    TimeLineCustomWidget(
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
                TimeLineCustomWidget(
                  isLast: true,
                  hasIndicator: false,
                  isDay: current.isDay,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
