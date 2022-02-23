import 'package:flutter/material.dart';

final textstyles = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.green.shade500),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7.5),
      side: BorderSide(
        color: Colors.green.shade500,
        width: 2.0,
      ),
    ),
  ),
);

final textstyles_delete = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.red.shade500),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7.5),
      side: BorderSide(
        color: Colors.red.shade500,
        width: 2.0,
      ),
    ),
  ),
);

final textstyles_main = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.orange.shade400),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7.5),
      side: BorderSide(
        color: Colors.orange.shade400,
        width: 2.0,
      ),
    ),
  ),
);