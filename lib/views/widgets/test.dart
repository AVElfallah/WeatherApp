import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/assets.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
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
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            Assets.freshair,
            scale: 9,
          ),
          const Text(
            'Now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
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
        padding: const EdgeInsets.all(20),
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
