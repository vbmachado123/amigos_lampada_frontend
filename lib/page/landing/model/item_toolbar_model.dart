import 'package:flutter/material.dart';

class ItemToolbarModel {
  final String label;
  final bool isSelected;
  final IconData? icons;

  ItemToolbarModel({required this.label, required this.isSelected, this.icons});
}
