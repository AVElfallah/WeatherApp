import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/model/forecast_hour_model.dart';

import '../../colors/colors.dart';
import '../../config/assets.dart';

class RowCardWidget extends StatelessWidget {
  const RowCardWidget({Key? key, this.hour}) : super(key: key);
  final ForecastHourModel? hour;

  @override
  Widget build(BuildContext context) {
    var date =
        DateTime.fromMillisecondsSinceEpoch(hour!.lastUpdatedEpoch! * 1000);
    var formater = DateFormat.jm(context.watchAppCtrl.appLanguage.languageCode)
        .format(date);
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: ProjectColors.purpleLight,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${hour!.tempC}°C',
            style: const TextStyle(
              //   color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Image.asset(
            Assets().getWeatherImage(hour!.isDay!, hour!.condition!.icon!),
            scale: 8,
          ),
          Text(
            formater,
            style: const TextStyle(
              //    color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
