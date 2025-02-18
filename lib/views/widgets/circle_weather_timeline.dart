import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/c_code.dart';
import 'package:weather_app/model/astronomy_model.dart';
import '../../config/assets.dart';
import 'package:weather_app/config/context_extention.dart';

class CircleWeatherTimeLine extends StatefulWidget {
  const CircleWeatherTimeLine({super.key, required this.astro});
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
      children: [
        for (var ind = 0; ind < 4; ind++)
          SizedBox(
            width: conditionGetter(
              context.isPortrait,
              context.width * .28,
              context.width * .28,
            ),
            height: conditionGetter(
              context.isPortrait,
              context.height * .135,
              context.height * .25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: Image.asset(
                    i[ind],
                    scale: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    conditionGetter(
                      word[ind]!.contains(
                        RegExp('[AM+P+:]'),
                      ),
                      word[ind]!.replaceFirstMapped(
                        RegExp('AM|PM'),
                        (s) => context.translate(
                          s[0]!.toLowerCase(),
                        )!,
                      ),
                      word[ind]!.toUpperCase(),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        //    color: Colors.white,
                        ),
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
