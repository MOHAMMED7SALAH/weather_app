import 'package:flutter/material.dart';

customError() {
  return ErrorWidget.builder = ((details) {
    
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity ,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(child: CircularProgressIndicator(),),
            Text('Please check the internet connection and close app and come back'),],
        ),
      ),
    );
  });
}
