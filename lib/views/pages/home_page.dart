import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/assets.dart';
import 'package:weather_app/controllers/home_controller.dart';
import 'package:weather_app/views/widgets/circle_weather_timeline.dart';
import 'package:weather_app/views/widgets/day_overview.dart';
import 'package:weather_app/views/widgets/weather_card.dart';

import '../widgets/app_drawer.dart';
import 'package:weather_app/config/context_extention.dart';

import '../widgets/homepage_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    //SECTION - initilzation of some variables
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    var now = DateTime.now();

    return ChangeNotifierProvider(
      create: (_) => HomePageController(
        args['dayForecast'],
        args['currentForcast'],
        args['location'],
      ),
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,

        drawer: const AppDrawerWidget(),
        backgroundColor: ProjectColors.purple,
        //SECTION - AppBar

        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: HomePageAppBarWidget(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        body: Builder(builder: (context) {
          var watch = context.watch<HomePageController>();
          return ListView(
            children: [
              SizedBox(
                height: context.isPortrait
                    ? context.height * .052
                    : context.height * .15,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Chip(
                          label: Text(
                            "Today",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: ProjectColors.orange,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //TODO - add function
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Chip(
                          label: Text(
                            "Tomorrow",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: ProjectColors.purpleLight,
                        ),
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
                      Assets().getWeatherImage(
                        watch.current.isDay!,
                        watch.current.condition!.icon!,
                      ),
                      scale: 3,
                    ),
                    Column(
                      children: [
                        Text(
                          '${watch.current.tempC}°C',
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: context.width * .48,
                          child: Text(
                            watch.dayModel.day!.condition!.text!,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.arrow_upward_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              'Max:${watch.dayModel.day!.maxtempC}°C',
                              style: const TextStyle(
                                fontSize: 11.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                            Text(
                              'Min:${watch.dayModel.day!.mintempC}°C',
                              style: const TextStyle(
                                fontSize: 11.5,
                                color: Colors.white,
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
                height: context.isPortrait
                    ? context.height * .28
                    : context.height * .6,
                child: ListView(
                  controller:
                      context.watch<HomePageController>().scrollController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    WeatherCardWidget(
                      assetsImage: Assets.umbrella,
                      title: 'Chance of rain',
                      subBoldTitle: '${watch.dayModel.day!.dailyChanceOfRain}%',
                    ),
                    WeatherCardWidget(
                      assetsImage: Assets.freshair,
                      title: 'Wind Speed',
                      subBoldTitle:
                          '${watch.current.windDir} ${watch.current.windKph} km/h',
                    ),
                    WeatherCardWidget(
                      assetsImage: Assets.waterdrops,
                      title: 'Humidity',
                      subBoldTitle: '${watch.current.humidity}%',
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
                height: context.isPortrait
                    ? context.height * .2
                    : context.height * .5,
                width: context.isPortrait
                    ? context.width * .85
                    : context.width * .1,
                child: const DayOverviewWidget(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
