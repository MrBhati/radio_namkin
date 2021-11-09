import 'package:flutter/material.dart';

class ColorsModel {
  Color? primeryColor;
  Color? secondaryColor;
  Color? assetColor;
  bool? isSelected;

  ColorsModel({this.primeryColor, this.secondaryColor, this.assetColor, this.isSelected});

  ColorsModel.fromJson(Map<String, dynamic> json) {
    primeryColor = json['primeryColor'];
    secondaryColor = json['secondaryColor'];
    assetColor = json['assetColor'];
    isSelected = json['isSelected'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primeryColor'] = this.primeryColor;
    data['secondaryColor'] = this.secondaryColor;
    data['assetColor'] = this.assetColor;
    data['isSelected'] = this.isSelected;
    return data;
  }
}
