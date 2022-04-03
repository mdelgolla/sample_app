import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


enum MainCategoryTypes{guitar,piano,drums}
enum CategoryFilters{all,guitar,piano,drums}
class Category{
  String? name;
  Color? color;
  String? image;
  Category({this.name,this.color,this.image});
}