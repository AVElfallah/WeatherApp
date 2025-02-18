import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _textAnimation;
  late final ValueNotifier<int> _currentStateTextIndex;
  @override
  void initState() {
    super.initState();
    _currentStateTextIndex = ValueNotifier(0);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _textAnimation = Tween(begin: 0.0, end: 1.0).animate(
      _animationController,
    );
    _animationController.repeat(min: 0, max: 1, reverse: true);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.reverse) {
        _currentStateTextIndex.value = (_currentStateTextIndex.value + 1) % 3;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('SplashPage Rebuild');
    return ChangeNotifierProvider(
      create: ((context) => SplashPageController(context)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            appBar: PreferredSize(
              preferredSize: Size(
                double.infinity,
                context.height * .08,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: context.aspectR * 38,
                ),
                child: IconStepper(
                  enableNextPreviousButtons: false,
                  enableStepTapping: false,
                  stepReachedAnimationEffect: Curves.easeInOutCubicEmphasized,
                  stepReachedAnimationDuration:
                      const Duration(milliseconds: 1200),
                  icons: const [
                    Icon(Icons.network_check_sharp),
                    Icon(Icons.location_on),
                    Icon(Icons.cloud),
                  ],
                  activeStep: context.watch<SplashPageController>().stateIndex,
                  stepColor: context.theme.primaryColor,
                ),
              ),
            ),
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    colors: [
                      context.theme.primaryColor,
                      context.theme.scaffoldBackgroundColor,
                    ],
                  ),
                ),
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
                            context.read<SplashPageController>().startEvents(
                                  context.watchAppCtrl.appLanguage.languageCode,
                                );
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
                    AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return FadeTransition(
                            opacity: _textAnimation,
                            child: ValueListenableBuilder<int>(
                                valueListenable: _currentStateTextIndex,
                                builder: (_, index, __) {
                                  return Text(
                                    [
                                      context.translate(
                                          'check network connection')!,
                                      context.translate(
                                          'get your current location')!,
                                      context.translate(
                                          'geting forcastes & open the app')!,
                                    ][index],
                                  );
                                }),
                          );
                        })
                    /* Visibility(
                      visible: context.watch<SplashPageController>().isLoaded,
                      child: SizedBox(
                        width: context.width * .76,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 20,
                            //  color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              context.translate('check network connection')!,
                              context.translate('get your current location')!,
                              context.translate(
                                  'geting forcastes & open the app')!,
                            ]
                                .map(
                                  (txt) => RotateAnimatedText(
                                    txt.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    textStyle: TextStyle(
                                      color: context.theme.splashColor,
                                    ),
                                  ),
                                )
                                .toList(),
                            repeatForever: true,
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
