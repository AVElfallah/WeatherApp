import 'package:flutter/material.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/assets.dart';

class DayOverviewWidget extends StatelessWidget {
  const DayOverviewWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    final bool isPortrate =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var sizedBox = SizedBox(
      width: mqSize.width * .2,
      height: mqSize.height * .03,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            '21°C',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            Assets.waterdrops,
            scale: 11,
          ),
          const Text(
            '2 PM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
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
        children: [
          sizedBox,
          sizedBox,
          sizedBox,
          sizedBox,
          sizedBox,
          sizedBox,
          sizedBox,
          sizedBox,
        ],
      ),
    );
  }
}
