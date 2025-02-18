import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.all(10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(15),
        itemCount: hours!.length,
        itemBuilder: (context, index) {
          return HoursCardWidget(
            hourModel: hours![index],
          );
        },
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

    return Container(
      width: context.width * .25,
      height: context.height * .95,
      decoration: BoxDecoration(
        color: !context.isDarkMode ? Colors.white54 : Colors.black38,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              conditionGetter(
                Appconfig.instance.temperature == Temperature.c,
                '${hourModel!.tempC}°C',
                '${hourModel!.tempF}°F',
              ),
              style: const TextStyle(
                //   color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Image.asset(
              Assets().getWeatherImage(
                hourModel!.isDay!,
                hourModel!.condition!.icon!,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              formater,
              style: const TextStyle(
                //  color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
