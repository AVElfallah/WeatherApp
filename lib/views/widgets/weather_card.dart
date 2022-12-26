import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget(
      {Key? key, this.subBoldTitle, this.assetsImage, this.title})
      : super(key: key);
  final String? subBoldTitle;
  final String? title;
  final String? assetsImage;

  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: mqSize.width * .488,
        decoration: BoxDecoration(
          //  color: ProjectColors.purpleLight,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              assetsImage!,
              scale: 5,
            ),
            Text(
              subBoldTitle!,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                //  color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Text(
              title!,
              maxLines: 1,
              style: const TextStyle(
                //    color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
