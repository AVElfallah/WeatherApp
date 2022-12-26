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
          context.theme.primaryColor,
          context.theme.cardColor,
          context.theme.primaryColor,
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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: context.theme.splashColor,
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
                      vertical: context.height * .36,
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
                                  'العربية',
                                  style: TextStyle(
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
                                titleText: 'English',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.translate,
                color: context.theme.splashColor,
              ),
              title: Text(
                context.translate('language')!,
                style: TextStyle(
                  color: context.theme.splashColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SwitchListTile(
              title: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'darkmode'.tr(context)!,
                  style: TextStyle(
                    color: context.theme.splashColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              value: context.isDarkMode,
              onChanged: (bool? value) {
                var read = context.read<AppController>();
                read.changeAppTheme();
              },
            ),
            GFListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Routes.searchPage.name!,
                );
              },
              icon: Icon(
                Icons.search,
                color: context.theme.splashColor,
              ),
              title: Text(
                context.translate('search')!,
                style: TextStyle(
                  color: context.theme.splashColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            GFListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Routes.settings.name!,
                );
              },
              icon: Icon(
                Icons.settings,
                color: context.theme.splashColor,
              ),
              title: Text(
                context.translate('settings')!,
                style: TextStyle(
                  color: context.theme.splashColor,
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
