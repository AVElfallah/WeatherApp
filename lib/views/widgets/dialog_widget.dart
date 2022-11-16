import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:weather_app/config/assets.dart';

class WeatherCustomDailog extends StatelessWidget {
  const WeatherCustomDailog({Key? key, required this.title}) : super(key: key);
  static show(
      {Key? key, required String title, required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) => WeatherCustomDailog(title: title),
    );
  }

  final String title;

  @override
  Widget build(BuildContext context) {
    return GFCard(
      margin: const EdgeInsets.symmetric(vertical: 140, horizontal: 40),
      title: GFListTile(
        title: GFListTile(
          title: Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      image: Image.asset(Assets.nerworkError),
      showImage: true,
    );
  }
}
