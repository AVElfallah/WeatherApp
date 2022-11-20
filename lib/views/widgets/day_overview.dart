import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/assets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/controllers/home_controller.dart';
import 'package:weather_app/model/forecast_hour_model.dart';

class DayOverviewWidget extends StatelessWidget {
  const DayOverviewWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var watch = context.watch<HomePageController>();
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
        children: watch.dayModel.hour!
            .map((hour) => HoursCardWidget(
                  hourModel: hour,
                ))
            .toList(),
      ),
    );
  }
}

class HoursCardWidget extends StatelessWidget {
  const HoursCardWidget({Key? key, this.hourModel}) : super(key: key);
  final ForecastHourModel? hourModel;
  @override
  Widget build(BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(
        hourModel!.lastUpdatedEpoch! * 1000);
    var formater =
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
          '${hourModel!.tempC}°C',
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
