import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/c_code.dart';

import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/controllers/search_controller.dart';

import 'package:weather_app/views/widgets/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Search page rebuild');
    var wCtrl = context.watch<SearchController>();
    var rCtrl = context.read<SearchController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //   backgroundColor: const Color.fromARGB(255, 38, 2, 92),
      appBar: GFAppBar(
          //  backgroundColor: const Color.fromARGB(255, 38, 2, 92),
          elevation: 0,
          centerTitle: true,
          title: conditionGetter(
            wCtrl.isSearchButtonClicked,
            AnimatedTextKit(
              onTap: () {
                rCtrl.clickSearchButton();
              },
              animatedTexts: [
                WavyAnimatedText(wCtrl.txtController.text),
              ],
            ),
            Row(
              mainAxisAlignment: conditionGetter(
                context.isPortrait,
                MainAxisAlignment.spaceBetween,
                MainAxisAlignment.spaceEvenly,
              ),
              children: [
                TextFormField(
                  onFieldSubmitted: (value) {
                    rCtrl.clickSearchButton();
                    rCtrl.search();
                  },
                  controller: wCtrl.txtController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    hintText: context.translate('search'),
                    constraints: BoxConstraints(
                      maxHeight: conditionGetter(
                        context.isPortrait,
                        context.height * .050,
                        context.height * .1,
                      ),
                      maxWidth: context.width * .64,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      gapPadding: 2,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    rCtrl.clickSearchButton();
                    rCtrl.search();
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
          )),
      body: Visibility(
        visible: wCtrl.searchResult.isNotEmpty,
        child: ListView.builder(
          itemCount: wCtrl.searchResult.length,
          itemBuilder: (context, index) {
            return SearchWidget(
              locationModel: wCtrl.searchResult[index],
            );
          },
        ),
      ),
    );
  }
}
