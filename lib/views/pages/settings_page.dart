import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/controllers/settings_controller.dart';
import 'package:weather_app/model/forecast_enums.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsController>(
      create: ((context) => SettingsController()),
      child: Scaffold(
        backgroundColor: ProjectColors.purple,
        appBar: AppBar(
          title: Text(context.translate('settings')!),
          elevation: 0,
          backgroundColor: ProjectColors.purple,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: ListView(
              children: [
                Center(
                  child: Text(
                    context.translate('UFTM')!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.amber,
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                ),
                StatefulBuilder(
                  builder: (context, st) {
                    var wt = context.watch<SettingsController>();
                    var rd = context.read<SettingsController>();
                    return Column(
                      children: [
                        GFRadioListTile<Temperature>(
                          value: Temperature.c,
                          groupValue: wt.currentTemperature,
                          onChanged: rd.changeTemperature,
                          type: GFRadioType.blunt,
                          title: Text(
                            context.translate('in_celsius')!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GFRadioListTile<Temperature>(
                          value: Temperature.f,
                          groupValue: wt.currentTemperature,
                          onChanged: rd.changeTemperature,
                          type: GFRadioType.blunt,
                          title: Text(
                            context.translate('in_fahr')!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                //ANCHOR -
                Center(
                  child: Text(
                    context.translate('PMU')!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.amber,
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                ),
                StatefulBuilder(
                  builder: (context, st) {
                    var wt = context.watch<SettingsController>();
                    var rd = context.read<SettingsController>();
                    return Column(
                      children: [
                        GFRadioListTile<PressureIn>(
                          value: PressureIn.mb,
                          groupValue: wt.currentPressure,
                          onChanged: rd.changePressure,
                          type: GFRadioType.blunt,
                          title: Text(
                            context.translate('in_millis')!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GFRadioListTile<PressureIn>(
                          value: PressureIn.inc,
                          groupValue: wt.currentPressure,
                          onChanged: rd.changePressure,
                          type: GFRadioType.blunt,
                          title: Text(
                            context.translate('in_inch')!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
                //ANCHOR -
                const SizedBox(
                  height: 30,
                ),
                //ANCHOR -
                Center(
                  child: Text(
                    context.translate('WMU')!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.amber,
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                ),
                StatefulBuilder(
                  builder: (context, st) {
                    var wt = context.watch<SettingsController>();
                    var rd = context.read<SettingsController>();
                    return Column(
                      children: [
                        GFRadioListTile<WindSpeed>(
                          value: WindSpeed.kph,
                          groupValue: wt.currentWindSpeed,
                          onChanged: rd.changeWindSpeed,
                          type: GFRadioType.blunt,
                          title: Text(
                            context.translate('speed_km')!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GFRadioListTile<WindSpeed>(
                          value: WindSpeed.mph,
                          groupValue: wt.currentWindSpeed,
                          onChanged: rd.changeWindSpeed,
                          type: GFRadioType.blunt,
                          title: Text(
                            context.translate('speed_m')!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
                //ANCHOR -
              ],
            ),
          ),
        ),
      ),
    );
  }
}
