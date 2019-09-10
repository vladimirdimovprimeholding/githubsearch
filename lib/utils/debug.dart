import 'package:flutter/material.dart';

Function debug(Object prefix) {
  return (object) => print("${prefix} - ${object}");
}
