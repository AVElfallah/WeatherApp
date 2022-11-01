import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

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
    return SizedBox(
      width: mqSize.width * .482,
      child: GFCard(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: ProjectColors.purpleLight,
        title: GFListTile(
          title: Image.asset(
            assetsImage!,
          ),
        ),
        content: Column(
          children: [
            Text(
              subBoldTitle!,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              title!,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}