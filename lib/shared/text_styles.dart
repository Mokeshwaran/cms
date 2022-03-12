// ignore_for_file: non_constant_identifier_names

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

const help_textstyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

const help_textstyle_about = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);

const help_textstyle_intro = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
);

const help_textstyle_welcome = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.w800,
  decoration: TextDecoration.underline,
);

const help_textstyle_thankyou = TextStyle(
  color: Colors.white,
  fontSize: 21.0,
  fontWeight: FontWeight.w900,
  decoration: TextDecoration.underline,
);

const help_textstyle_withlove = TextStyle(
  color: Colors.white,
  fontSize: 13.0,
  fontWeight: FontWeight.bold,
);
