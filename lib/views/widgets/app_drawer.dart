import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/c_code.dart';
import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/config/routes.dart';
import 'package:weather_app/controllers/application_controller.dart';
import 'package:weather_app/controllers/home_controller.dart';

import '../../colors/colors.dart';
import '../../config/assets.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homepageCtrl = context.watch<HomePageController>();
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
                conditionGetter(
                  homepageCtrl.current.isDay!,
                  Assets.wakeupSun,
                  Assets.sleepMoon,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
              color: ProjectColors.purpleLight.withOpacity(
                .1,
              ),
              content: Text(
                conditionGetter(
                  homepageCtrl.current.isDay!,
                  context.translate('day')!,
                  context.translate('night')!,
                ),
                maxLines: 1,
                overflow: TextOverflow.visible,
                softWrap: false,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            GFListTile(
              onTap: () {
                showDialog(
                  context: context,
                  barrierLabel: 'Change language',
                  builder: (con) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 76,
                      vertical: context.height * .37,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              child: GFListTile(
                                onTap: () {
                                  con.readAppCtrl.changeAppLocale(AppLang.ar);
                                  homepageCtrl.changeCurrentForecast(
                                      con.readAppCtrl.appLanguage.languageCode);
                                },
                                title: const Text(
                                  'اللغة العربية',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              child: GFListTile(
                                onTap: (() {
                                  con.readAppCtrl.changeAppLocale(AppLang.en);
                                  homepageCtrl.changeCurrentForecast(
                                    con.readAppCtrl.appLanguage.languageCode,
                                  );
                                }),
                                titleText: 'English Language',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.translate,
                color: Colors.white,
              ),
              title: Text(
                context.translate('language')!,
                style: const TextStyle(
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
              title: Text(
                context.translate('search')!,
                style: const TextStyle(
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
