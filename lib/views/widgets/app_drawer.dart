import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:weather_app/config/routes.dart';

import '../../colors/colors.dart';
import '../../config/assets.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          ProjectColors.purple,
          ProjectColors.purpleLight.withOpacity(.5),
          ProjectColors.purple,
        ],
      ),
      child: SafeArea(
        child: ListView(
          children: [
            GFCard(
              showImage: true,
              image: Image.asset(
                Assets.sleepMoon,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
              color: ProjectColors.purpleLight.withOpacity(
                .1,
              ),
              content: const Text(
                'Night',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const GFListTile(
              icon: Icon(
                Icons.translate,
                color: Colors.white,
              ),
              title: Text(
                'Language',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            GFListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Routes.searchPage.name!,
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              title: const Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
