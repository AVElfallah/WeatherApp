import 'package:flutter/material.dart';
import 'package:weather_app/config/app_config.dart';

import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/model/forecast_enums.dart';
import 'package:weather_app/views/widgets/weather_card.dart';
import 'package:intl/intl.dart';
import '../../c_code.dart';
import '../../config/assets.dart';
import '../../model/forecast_day_model.dart';
import '../../model/forecast_hour_model.dart';
import 'circle_weather_timeline.dart';
import 'day_overview.dart';

class HomePageWeatherDisplayerWidget extends StatelessWidget {
  const HomePageWeatherDisplayerWidget({
    Key? key,
    required this.dayModel,
    required this.current,
    required this.scrollController,
  }) : super(key: key);
  final ForecastDayModel dayModel;
  final ForecastHourModel current;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    //get date time in iso format
    var dateTime =
        DateTime.fromMillisecondsSinceEpoch(current.lastUpdatedEpoch! * 1000);

    //reformation data time
    var dateFormat =
        DateFormat.MMMEd(context.watchAppCtrl.appLanguage.languageCode)
            .format(dateTime);

    return ListView(
      children: [
        Row(
          mainAxisAlignment: conditionGetter(
            context.isPortrait,
            MainAxisAlignment.start,
            MainAxisAlignment.center,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: Text(
                '${dateTime.isBefore(DateTime.now()) ? context.translate('today')! : context.translate('tomorrow')!} -',
                style: const TextStyle(
                  //   color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              dateFormat,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                //   color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Row(
            mainAxisAlignment: conditionGetter(
              context.isPortrait,
              MainAxisAlignment.spaceBetween,
              MainAxisAlignment.spaceEvenly,
            ),
            children: [
              Image.asset(
                Assets().getWeatherImage(
                  current.isDay!,
                  current.condition!.icon!,
                ),
                scale: 3,
              ),
              Column(
                children: [
                  Text(
                    conditionGetter(
                      Appconfig.instance.temperature == Temperature.c,
                      '${current.tempC}°C',
                      '${current.tempF}°F',
                    ),
                    style: const TextStyle(
                      fontSize: 32,
                      //    color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: context.width * .48,
                    child: Text(
                      current.condition!.text!,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 23,
                        //  color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_upward_rounded,
                        color: context.theme.splashColor,
                      ),
                      Text(
                        '${context.translate('max')}:${conditionGetter(
                          Appconfig.instance.temperature == Temperature.c,
                          '${current.tempC}°C',
                          '${current.tempF}°F',
                        )}',
                        style: const TextStyle(
                          fontSize: 11.5,
                          //  color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_downward,
                        color: context.theme.splashColor,
                      ),
                      Text(
                        '${context.translate('min')}:${conditionGetter(
                          Appconfig.instance.temperature == Temperature.c,
                          '${current.tempC}°C',
                          '${current.tempF}°F',
                        )}',
                        style: const TextStyle(
                          fontSize: 11.5,
                          //   color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: conditionGetter(
            context.isPortrait,
            context.height * .31,
            context.height * .6,
          ),
          child: ListView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            children: [
              WeatherCardWidget(
                assetsImage: Assets.umbrella,
                title: context.translate('chance_of_rain'),
                subBoldTitle: '${dayModel.day!.dailyChanceOfRain}%',
              ),
              WeatherCardWidget(
                assetsImage: Assets.freshair,
                title: context.translate('wind_speed'),
                subBoldTitle: '${current.windDir} ${conditionGetter(
                  Appconfig.instance.windSpeed == WindSpeed.kph,
                  '${current.windKph} km/h',
                  '${current.windMph} m/h',
                )}',
              ),
              WeatherCardWidget(
                assetsImage: Assets.waterdrops,
                title: context.translate('humidity'),
                subBoldTitle: '${current.humidity}%',
              ),
              WeatherCardWidget(
                assetsImage: Assets.cloud,
                title: context.translate('clouds'),
                subBoldTitle: '${current.cloud}%',
              ),
              WeatherCardWidget(
                assetsImage: Assets.pressure,
                title: context.translate('pressure'),
                subBoldTitle: conditionGetter(
                  Appconfig.instance.pressureIn == PressureIn.inc,
                  '${current.pressureIn} Inc',
                  '${current.pressureMb} Mb',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Center(
            child: Text(
              context.translate("sun_moon_status")!,
              style: const TextStyle(
                //   color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Center(
          child: CircleWeatherTimeLine(
            astro: dayModel.astro!,
          ),
        ),
        SizedBox(
          height: conditionGetter(
            context.isPortrait,
            context.height * .22,
            context.height * .5,
          ),
          width: conditionGetter(
            context.isPortrait,
            context.width * .85,
            context.width * .1,
          ),
          child: DayOverviewWidget(
            hours: dayModel.hour!,
          ),
        ),
      ],
    );
  }
}
