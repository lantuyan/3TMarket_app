import 'package:flutter/material.dart';
import 'package:market3t/managers/data_manager.dart';
import 'package:market3t/shared/constants/color_constants.dart';
import 'package:market3t/views/main/home/home_screen_admin.dart';
import 'package:market3t/views/main/home/home_screen_collecter.dart';
import 'package:market3t/views/main/home/home_screen_person.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final String role = DataManager().getData('role');
  @override
  Widget build(BuildContext context) {
    if(role == "admin"){
      return HomeAdminScreen();
    }else if(role == "person"){
      return HomeScreenPerson();
    }else if(role == "collector"){
      return HomeScreenCollector();
    }else{
      return Center(
        child: CircularProgressIndicator(color: ColorsConstants.kMainColor,),
      );
    }
  }
}