
import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/error.dart';
import 'package:weather_app/utils/Binding/HomeBinding.dart';
import 'package:weather_app/welcome.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
customError();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(    
      child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => MyConnectionState(),
          
          binding: HomeBinding(),
        )
      ],
    ));
  }
}
