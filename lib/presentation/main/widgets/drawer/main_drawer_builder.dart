import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:weather_algoriza/presentation/main/widgets/drawer/weather_tag.dart';
import '../../../../network/weather_cubit/cubit/weather_cubit.dart';
import '../../../resources/size_config.dart';
import '../../../resources/styles_manager.dart';
import 'dotted_divider.dart';
import 'drawer_tag.dart';

buildMenu(String region, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 5),
    child: Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20))),
      color: const Color.fromRGBO(49, 60, 70, 1),
      child: SizedBox(
        height: SizeConfig.screenHeight,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                )),
            const DrawerTag(
              iconData: Icons.star,
              text: "Favourite Locations",
              prephralIcon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
            ),
            WeatherTag(
              iconData: Icons.pin_drop_sharp,
              text: region,
              temp: "33°",
            ),
            const DottedDivider(),
            DrawerTag(
                //*Others
                iconData: Icons.location_on_outlined,
                text: "Other Locations"),
            Column(
              children: WeatherCubit.get(context).locations.isEmpty
                  ? []
                  : List.generate(
                      WeatherCubit.get(context).locations.length,
                      (index) => WeatherTag(
                            text: WeatherCubit.get(context).locations[index],
                            temp: WeatherCubit.get(context).temps[index] + "°",
                          )),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(79, 87, 98, 1)),
                onPressed: () {
                  if (WeatherCubit.get(context).managemntBoardopened) {
                    WeatherCubit.get(context).ManageLocationData();
                  } else {
                    WeatherCubit.get(context).changeBoard();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      WeatherCubit.get(context).managemntBoardopened
                          ? "submit"
                          : "Manage Location",
                      style: getRegularStyle(),
                    ),
                  ],
                )),
            (WeatherCubit.get(context).managemntBoardopened)
                ? Column(
                    children: [
                      SelectState(
                        onCountryChanged: (value) {
                          WeatherCubit.get(context).changeCountry(value);
                        },
                        onStateChanged: (value) {
                          WeatherCubit.get(context).changeState(value);
                        },
                        onCityChanged: (value) {
                          WeatherCubit.get(context).changeCity(value);
                        },
                      ),
                    ],
                  )
                : SizedBox(),
          ]),
        ),
      ),
    ),
  );
}
