import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('SplashPage Rebuild');

    return ChangeNotifierProvider(
      create: ((context) => SplashPageController(context)),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: ProjectColors.purple,
          appBar: PreferredSize(
            preferredSize: Size(
              double.infinity,
              context.height * .08,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 38.0,
              ),
              child: IconStepper(
                enableNextPreviousButtons: false,
                enableStepTapping: false,
                stepReachedAnimationEffect: Curves.easeOutBack,
                icons: const [
                  Icon(Icons.network_check_sharp),
                  Icon(Icons.location_on),
                  Icon(Icons.cloud),
                ],
                activeStep: context.watch<SplashPageController>().stateIndex,
                stepColor: Colors.green.shade50,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: context.watch<SplashPageController>().isLoaded,
                  child: const GFLoader(
                    type: GFLoaderType.circle,
                    size: GFSize.LARGE,
                  ),
                ),
                Visibility(
                  visible: !context.watch<SplashPageController>().isLoaded,
                  child: Center(
                    child: TextButton.icon(
                      onPressed: () {
                        context.read<SplashPageController>().startEvents();
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 120,
                      ),
                      label: const Text(''),
                    ),
                  ),
                ),
                Visibility(
                  visible: context.watch<SplashPageController>().isLoaded,
                  child: Text(
                    context.watch<SplashPageController>().stateText,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
