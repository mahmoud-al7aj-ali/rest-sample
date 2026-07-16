import 'package:flutter/cupertino.dart';

extension NumExt on num{
  SizedBox get vs => SizedBox(height: this.toDouble());
  SizedBox get hs => SizedBox(width: this.toDouble());
}