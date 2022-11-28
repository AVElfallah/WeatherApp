import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/config/context_extention.dart';
import 'package:weather_app/controllers/search_controller.dart';
import 'package:weather_app/model/location_model.dart';

import '../../config/assets.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.locationModel}) : super(key: key);
  final LocationModel locationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
        elevation: 30,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          height: context.height * .385,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  locationModel.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${locationModel.region} - ${locationModel.country}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              Image.asset(
                Assets.get_location,
                height: context.height * .22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Latitude- ${locationModel.lat}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Longitud- ${locationModel.lon}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              IconButton(
                splashRadius: 12,
                icon: Icon(
                  Icons.remove_red_eye,
                  size: 50,
                  color: Colors.black.withOpacity(.7),
                ),
                onPressed: () {
                  context
                      .read<SearchController>()
                      .openSearchResult(context, locationModel);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
