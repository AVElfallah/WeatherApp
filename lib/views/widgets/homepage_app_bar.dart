import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/config/context_extention.dart';

import '../../c_code.dart';
import '../../colors/colors.dart';
import '../../controllers/home_controller.dart';

class HomePageAppBarWidget extends StatefulWidget {
  const HomePageAppBarWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final void Function()? onTap;

  @override
  State<HomePageAppBarWidget> createState() => _HomePageAppBarWidgetState();
}

class _HomePageAppBarWidgetState extends State<HomePageAppBarWidget> {
  bool isToday = true;

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<HomePageController>();
    return AppBar(
      backgroundColor: ProjectColors.purple,
      elevation: 0,
      //SECTION - AppBar Title text
      title: Text(
        watch.locationModel.name,
        softWrap: false,
        overflow: TextOverflow.fade,
        maxLines: 1,
      ),
      centerTitle: true,
      //SECTION - leading icon
      leading: InkWell(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: ProjectColors.purpleLight,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.blur_on),
        ),
      ),
      //SECTION - actions icon
      actions: [
        IconButton(
          onPressed: () async {},
          icon: const Icon(
            Icons.compare_arrows_sharp,
            size: 32,
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size(
            double.infinity,
            conditionGetter<double>(
              context.isPortrait,
              context.height * .052,
              context.height * .15,
            )),
        child: SizedBox(
          height: conditionGetter<double>(
            context.isPortrait,
            context.height * .052,
            context.height * .15,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              InkWell(
                onTap: () {
                  context.read<HomePageController>().getTodayForecast();
                  setState(
                    () {
                      isToday = true;
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(
                    5,
                  ),
                  child: Chip(
                    label: const Text(
                      "Today",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: conditionGetter(
                      isToday,
                      ProjectColors.orange,
                      ProjectColors.purpleLight,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<HomePageController>().getTomorrowForecast();
                  setState(() {
                    isToday = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(
                    5,
                  ),
                  child: Chip(
                    label: const Text(
                      "Tomorrow",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: conditionGetter(
                      !isToday,
                      ProjectColors.orange,
                      ProjectColors.purpleLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
