import 'package:flutter/material.dart';

void navigate({required BuildContext context, required Widget screen}) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screen));
}
