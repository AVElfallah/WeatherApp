import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/context_extention.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.purple,
      appBar: GFAppBar(
        backgroundColor: ProjectColors.purple,
        elevation: 0,
        title: Row(
          mainAxisAlignment: context.isPortrait
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: context.isPortrait
                      ? context.height * .050
                      : context.height * .1,
                  maxWidth: context.width * .7,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.black),
                  gapPadding: 2,
                ),
              ),
            ),
            const Icon(
              Icons.search,
              color: Colors.white,
              size: 26,
            )
          ],
        ),
      ),
    );
  }
}
