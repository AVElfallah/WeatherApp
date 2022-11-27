import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../c_code.dart';
import '../../colors/colors.dart';

class TimeLineCustomWidget extends StatelessWidget {
  const TimeLineCustomWidget({
    super.key,
    this.isDay = false,
    this.isLast = false,
    this.hasIndicator = false,
    this.isFirst = false,
    this.indicatorStyle = const IndicatorStyle(width: 20, height: 20),
  });
  final bool? isDay;
  final bool? isLast;
  final bool? hasIndicator;
  final IndicatorStyle? indicatorStyle;
  final bool? isFirst;
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      indicatorStyle: indicatorStyle!,
      hasIndicator: hasIndicator!,
      isFirst: isFirst!,
      isLast: isLast!,
      beforeLineStyle: LineStyle(
        color: conditionGetter(
          isDay!,
          Colors.yellow,
          ProjectColors.purpleLight,
        ),
      ),
    );
  }
}
