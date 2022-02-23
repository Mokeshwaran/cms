import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
  hintStyle: TextStyle(fontSize: 15.0, color: Colors.blue.shade100),
  fillColor: Colors.blue[600],
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue.shade400, width: 1.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orange.shade400, width: 1.0),
      borderRadius: BorderRadius.circular(20)),
);
