import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../colors/colors.dart';
import '../../controllers/home_controller.dart';

class HomePageAppBarWidget extends StatelessWidget {
  const HomePageAppBarWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
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
        onTap: onTap,
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
    );
  }
}
