import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:weather_app/colors/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    final bool isPorrate =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: ProjectColors.purple,
      appBar: GFAppBar(
        backgroundColor: ProjectColors.purple,
        elevation: 0,
        title: Row(
          mainAxisAlignment: isPorrate
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight:
                      isPorrate ? mqSize.height * .050 : mqSize.height * .1,
                  maxWidth: mqSize.width * .7,
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
