import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/c_code.dart';
import 'package:weather_app/model/astronomy_model.dart';
import '../../config/assets.dart';
import 'package:weather_app/config/context_extention.dart';

class CircleWeatherTimeLine extends StatefulWidget {
  const CircleWeatherTimeLine({Key? key, required this.astro})
      : super(key: key);
  final AstronomyModel astro;
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
    return CircleList(
      animationSetting: AnimationSetting(
        duration: const Duration(milliseconds: 3000),
        curve: Curves.easeInOutBack,
      ),
      dragAngleRange: DragAngleRange(0, 270),
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
            widget.astro.sunrise,
            widget.astro.sunset,
            widget.astro.moonrise,
            widget.astro.moonset,
          ];
          return SizedBox(
            width: conditionGetter(
              context.isPortrait,
              context.width * .25,
              context.width * .25,
            ),
            height: conditionGetter(
              context.isPortrait,
              context.height * .112,
              context.height * .25,
            ),
            child: Column(
              children: [
                Image.asset(
                  i[index],
                  scale: 8,
                ),
                Text(
                  word[index]!.substring(0, 6) +
                      context.translate(
                        word[index]!.substring(6).toLowerCase(),
                      )!,
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
