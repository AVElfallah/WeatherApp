import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/c_code.dart';

import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/controllers/home_controller.dart';
import 'package:weather_app/views/widgets/homepage_skelton.dart';
import 'package:weather_app/views/widgets/homepage_weather_displayer.dart';

import '../widgets/app_drawer.dart';
import 'package:weather_app/config/context_extention.dart';

import '../widgets/homepage_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    //SECTION - initilzation of some variables
    debugPrint('Home page rebuild');
    final args = getArgument(context);

    return ChangeNotifierProvider(
      create: (_) => HomePageController(
        args['dayForecast'],
        args['currentForcast'],
        args['location'],
      ),
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,

        drawer: const AppDrawerWidget(),
        backgroundColor: ProjectColors.purple,
        //SECTION - AppBar

        appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            context.height * .12,
          ),
          child: HomePageAppBarWidget(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        body: Builder(
          builder: (context) {
            var watch = context.watch<HomePageController>();
            return conditionGetter(
              watch.isLoading,
              const Hero(
                tag: 'home_d',
                child: HomepageSkeltonWidget(),
              ),
              Hero(
                tag: 'home_d',
                child: HomePageWeatherDisplayerWidget(
                  dayModel: watch.dayModel,
                  current: watch.current,
                  scrollController: watch.scrollController,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
