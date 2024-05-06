import 'package:flutter/material.dart';
import 'package:market3t/managers/data_manager.dart';
import 'package:market3t/shared/constants/color_constants.dart';
import 'package:market3t/views/main/map/map_admin.dart';
import 'package:market3t/views/main/map/map_screen.dart';
import 'package:market3t/views/main/map/map_collecter_screen.dart';

class Map extends StatelessWidget {
  Map({super.key});

  final String role = DataManager().getData('role');
  @override
  Widget build(BuildContext context) {
    if(role == "admin"){
      return MapAdminScreen();
    }else if(role == "person"){
      return MapScreen();
    }else if(role == "collector"){
      return MapCollecterScreen();
    }else{
      return Center(
        child: CircularProgressIndicator(color: ColorsConstants.kMainColor,),
      );
    }
  }
}