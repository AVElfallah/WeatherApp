import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/c_code.dart';
import 'package:weather_app/controllers/home_controller.dart';

import '../../config/assets.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/config/context_extention.dart';

class CircleWeatherTimeLine extends StatefulWidget {
  const CircleWeatherTimeLine({Key? key}) : super(key: key);

  @override
  State<CircleWeatherTimeLine> createState() => _CircleWeatherTimeLineState();
}

class _CircleWeatherTimeLineState extends State<CircleWeatherTimeLine> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomePageController>();
    return CircleList(
      showInitialAnimation: true,
      origin: const Offset(0, 0),
      centerWidget: Image.asset(
        Assets.planetearth,
        scale: 3.5,
      ),
      children: List.generate(
        4,
        (index) {
          var i = [
            Assets.wakeupSun,
            Assets.sleepSun,
            Assets.wakeupMoon,
            Assets.sleepMoon
          ];
          var word = [
            watch.dayModel.astro!.sunrise,
            watch.dayModel.astro!.sunset,
            watch.dayModel.astro!.moonrise,
            watch.dayModel.astro!.moonset,
          ];
          return SizedBox(
            width: conditionGetter(
              context.isPortrait,
              context.width * .25,
              context.width * .25,
            ),
            height: conditionGetter(
              context.isPortrait,
              context.height * .1,
              context.height * .25,
            ),
            child: Column(
              children: [
                Image.asset(
                  i[index],
                  scale: 8,
                ),
                Text(
                  word[index]!,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
