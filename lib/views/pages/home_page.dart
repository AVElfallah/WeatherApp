import 'dart:convert';

import 'package:date_time_format/date_time_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/assets.dart';
import 'package:weather_app/model/forecast_day_model.dart';
import 'package:weather_app/views/widgets/circle_weather_timeline.dart';
import 'package:weather_app/views/widgets/day_overview.dart';
import 'package:weather_app/views/widgets/weather_card.dart';

import '../widgets/app_drawer.dart';
import 'package:weather_app/config/context_extention.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //SECTION - initilzation of some variables

    var now = DateTime.now();
    var scrollController = ScrollController(initialScrollOffset: 92);
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return
        //SECTION - Scaffold
        Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawerWidget(),
      backgroundColor: ProjectColors.purple,
      //SECTION - AppBar
      appBar: AppBar(
        backgroundColor: ProjectColors.purple,
        elevation: 0,
        //SECTION - AppBar Title text
        title: Text(
          "Kafr El-Tir`A El-Gedid".substring(0, 22),
          softWrap: false,
          overflow: TextOverflow.fade,
          maxLines: 1,
        ),
        centerTitle: true,
        //SECTION - leading icon
        leading: InkWell(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: ProjectColors.purpleLight,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.blur_on),
          ),
        ),
        //SECTION - actions icon
        actions: [
          IconButton(
            onPressed: () async {
              var v = await Dio().get(
                  'http://api.weatherapi.com/v1/forecast.json?key=b0b1aa2a67de481f810235705222910&q=Ras el khalig&days=1&aqi=no&alerts=yes');
              var res = const JsonDecoder().convert(v.toString());
              print(
                  ForecastDayModel.fromJson(res['forecast']['forecastday'][0]));
            },
            icon: const Icon(
              Icons.compare_arrows_sharp,
              size: 32,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: context.isPortrait
                ? context.height * .052
                : context.height * .15,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Chip(
                    label: Text(
                      "Today",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: ProjectColors.orange,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Chip(
                    label: Text(
                      "Tomorrow",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: ProjectColors.purpleLight,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: context.isPortrait
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Today -',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                DateTimeFormat.format(now, format: "D, d F"),
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: context.isPortrait
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  Assets.dayImages.i['230']!,
                  scale: 3,
                ),
                Column(
                  children: [
                    const Text(
                      '21°C',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Partly Cloudy',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.arrow_upward_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          'Max: 21°C',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        Text(
                          'Min: 21°C',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
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
            height:
                context.isPortrait ? context.height * .28 : context.height * .6,
            child: ListView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              children: const [
                WeatherCardWidget(
                  assetsImage: Assets.umbrella,
                  title: 'Chance of rain',
                  subBoldTitle: '80%',
                ),
                WeatherCardWidget(
                  assetsImage: Assets.freshair,
                  title: 'Wind Speed',
                  subBoldTitle: 'NW 8 km/h',
                ),
                WeatherCardWidget(
                  assetsImage: Assets.waterdrops,
                  title: 'Humidity',
                  subBoldTitle: '94%',
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                'Sun & Moon Status',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Center(child: CircleWeatherTimeLine()),
          SizedBox(
            height:
                context.isPortrait ? context.height * .2 : context.height * .5,
            width:
                context.isPortrait ? context.width * .85 : context.width * .1,
            child: const DayOverviewWidget(),
          ),
        ],
      ),
    );
  }
}
