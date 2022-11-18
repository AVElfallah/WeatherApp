import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:weather_app/config/context_extention.dart';

import '../../c_code.dart';
import '../../colors/colors.dart';

class HomepageSkeltonWidget extends StatelessWidget {
  const HomepageSkeltonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      isLoading: true,
      duration: const Duration(milliseconds: 7200),
      shimmerGradient: const LinearGradient(
        colors: [
          ProjectColors.purpleLight,
          Colors.white70,
        ],
        begin: Alignment.bottomCenter,
      ),
      skeleton: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: conditionGetter(
                context.isPortrait,
                MainAxisAlignment.start,
                MainAxisAlignment.center,
              ),
              children: [
                SizedBox(
                  width: context.width * .205,
                  height: context.height * .03,
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                      height: context.height * .03,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: context.width * .605,
                    height: context.height * .03,
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        height: context.height * .03,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: conditionGetter(
                context.isPortrait,
                MainAxisAlignment.spaceBetween,
                MainAxisAlignment.spaceEvenly,
              ),
              children: [
                SizedBox(
                  height: context.height * .2,
                  width: context.width * .40,
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                      height: context.height * 2,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: context.height * .036,
                      width: context.width * .40,
                      child: SkeletonLine(
                        style: SkeletonLineStyle(
                          height: context.height * 036,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height * .04,
                      width: context.width * .50,
                      child: SkeletonLine(
                        style: SkeletonLineStyle(
                          height: context.height * 04,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: context.height * .028,
                          width: context.width * .20,
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: context.height * 04,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: context.height * .028,
                          width: context.width * .20,
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: context.height * 04,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: conditionGetter(
              context.isPortrait,
              context.height * .28,
              context.height * .6,
            ),
            child: ListView(
              controller: ScrollController(initialScrollOffset: 92),
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: context.height * .008,
                    width: context.width * .40,
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        height: context.height * 004,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: context.height * .008,
                    width: context.width * .40,
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        height: context.height * 004,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: context.height * .008,
                    width: context.width * .40,
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        height: context.height * 004,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: SizedBox(
                width: context.width * .5,
                height: context.height * .03,
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                    height: context.height * .03,
                    width: context.width * .5,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: CircleList(
              showInitialAnimation: true,
              origin: const Offset(0, 0),
              centerWidget: SizedBox(
                width: context.width * .43,
                height: context.height * .3,
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                    height: context.height * .20,
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
              ),
              children: List.generate(
                4,
                (index) {
                  return SizedBox(
                    width: conditionGetter(
                      context.isPortrait,
                      context.width * .25,
                      context.width * .25,
                    ),
                    height: conditionGetter(
                      context.isPortrait,
                      context.height * .1,
                      context.height * .25,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: context.width * .15,
                          height: context.height * .07,
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: context.height * .07,
                              borderRadius: BorderRadius.circular(200),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.width * .15,
                          height: context.height * .02,
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: context.height * .02,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: conditionGetter(
              context.isPortrait,
              context.height * .2,
              context.height * .5,
            ),
            width: conditionGetter(
              context.isPortrait,
              context.width * .85,
              context.width * .1,
            ),
            child: Container(
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
                children: List.generate(
                  24,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: context.width * .25,
                      height: context.height * .2,
                      child: SkeletonLine(
                        style: SkeletonLineStyle(
                          height: context.height * .2,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      child: Text(''),
    );
  }
}
