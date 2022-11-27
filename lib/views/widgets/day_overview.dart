import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/app_config.dart';
import 'package:weather_app/config/assets.dart';
import 'package:intl/intl.dart' as intl;
import 'package:weather_app/c_code.dart';

import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/model/forecast_enums.dart';
import 'package:weather_app/model/forecast_hour_model.dart';

class DayOverviewWidget extends StatelessWidget {
  const DayOverviewWidget({Key? key, required this.hours}) : super(key: key);
  final List<ForecastHourModel>? hours;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ProjectColors.purple,
            ProjectColors.purpleLight.withOpacity(.4),
            ProjectColors.purple,
          ],
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(25),
        children: [
          //NOTE - using for instead of map to make build more faster
          for (var hour in hours!)
            HoursCardWidget(
              hourModel: hour,
            )
        ],
      ),
    );
  }
}

class HoursCardWidget extends StatelessWidget {
  const HoursCardWidget({Key? key, this.hourModel}) : super(key: key);
  final ForecastHourModel? hourModel;
  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMillisecondsSinceEpoch(
        hourModel!.lastUpdatedEpoch! * 1000);
    final formater =
        intl.DateFormat.jm(context.watchAppCtrl.appLanguage.languageCode)
            .format(date);

    return TimelineTile(
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.center,
      indicatorStyle: IndicatorStyle(
        drawGap: true,
        width: 60,
        height: 60,
        indicator: Image.asset(
          Assets().getWeatherImage(
            hourModel!.isDay!,
            hourModel!.condition!.icon!,
          ),
        ),
      ),
      afterLineStyle: const LineStyle(
        color: Colors.green,
        thickness: 1.5,
      ),
      beforeLineStyle: const LineStyle(
        color: Colors.pink,
        thickness: 1.5,
      ),
      startChild: Container(
        constraints: const BoxConstraints(
          minWidth: 80,
        ),
        child: Text(
          conditionGetter(
            Appconfig.instance.temperature == Temperature.c,
            '${hourModel!.tempC}°C',
            '${hourModel!.tempF}°F',
          ),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      endChild: Text(
        formater,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
