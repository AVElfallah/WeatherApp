import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';

import '../../config/assets.dart';

class CircleWeatherTimeLine extends StatelessWidget {
  const CircleWeatherTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    final bool isPortrate =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return CircleList(
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
          var word = ['06:09 AM', '05:04 PM', '01:11 PM', '11:43 PM'];
          return SizedBox(
            width: isPortrate ? mqSize.width * .25 : mqSize.width * 4,
            height: isPortrate ? mqSize.height * .1 : mqSize.height * .25,
            child: Column(
              children: [
                Image.asset(
                  i[index],
                  scale: 8,
                ),
                Text(
                  word[index],
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
