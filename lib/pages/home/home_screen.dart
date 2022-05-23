import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/images.dart';
import 'package:weather_app/utils/Binding/HomeBinding.dart';
import '../../controller/HomeController.dart';
import '../../widget/myList.dart';
import '../../widget/my_chart.dart';

class HomeScreen extends GetView<HomeController> {
  HomeBinding homeBinding = HomeBinding();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * .3,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(Colors.black38, BlendMode.dstOut),
                        image: AssetImage(
                          'assets/images/cloud-in-blue-sky.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * .15,
                    child: Container(
                      margin: EdgeInsets.only(left: size.width * .05),
                      width: size.width * .9,
                      child: TextField(
                        onChanged: (value) => controller.city = value,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => controller.updateWeather(),
                        decoration: InputDecoration(
                          suffix: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: 'Search'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * .05,
              ),
              Container(
                width: size.width,
                height: size.height * .27,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(top: 15, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      '${controller.currentWeatherData.name}'
                                          .toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Colors.black45,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'flutterfonts',
                                          ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      DateFormat()
                                          .add_MMMMEEEEd()
                                          .format(DateTime.now()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Colors.black45,
                                            fontSize: 16,
                                            fontFamily: 'flutterfonts',
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${controller.currentWeatherData.weather![0].description}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: Colors.black45,
                                              fontSize: 22,
                                              fontFamily: 'flutterfonts',
                                            ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts'),
                                      ),
                                      Text(
                                        'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: Colors.black45,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'flutterfonts',
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: LottieBuilder.asset(
                                            Images.cloudyAnim),
                                      ),
                                      Container(
                                        child: Text(
                                          'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                color: Colors.black45,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'flutterfonts',
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: EdgeInsets.only(top: 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'other city'.toUpperCase(),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontSize: 16,
                                        fontFamily: 'flutterfonts',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                          MyList(),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'forcast next 5 days'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                ),
                                Icon(
                                  Icons.next_plan_outlined,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                          MyChart(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
