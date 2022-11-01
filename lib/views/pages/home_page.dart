import 'dart:math';

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/assets.dart';
import 'package:weather_app/views/widgets/circle_weather_timeline.dart';
import 'package:weather_app/views/widgets/test.dart';
import 'package:weather_app/views/widgets/weather_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    var now = DateTime.now();
    var scrollController = ScrollController(initialScrollOffset: 92);
    return Scaffold(
      backgroundColor: ProjectColors.purple,
      appBar: AppBar(
        backgroundColor: ProjectColors.purple,
        elevation: 0,
        title: Text(
          "Kafr El-Tir`A El-Gedid".substring(0, 22),
          softWrap: false,
          overflow: TextOverflow.fade,
          maxLines: 1,
        ),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: ProjectColors.purpleLight,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.blur_on),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
            height: mqSize.height * .052,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            height: mqSize.height * .28,
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
          const Center(
            child: Text(
              'Sun & Moon Status',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const CircleWeatherTimeLine(),
          SizedBox(
            height: mqSize.height * .5,
            width: mqSize.width * .8,
            child: Column(
              children: [
                SizedBox(
                  height: 270,
                  width: mqSize.width * .85,
                  child: TestWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
