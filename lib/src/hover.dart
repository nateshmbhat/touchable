import 'package:flutter/material.dart';

class OnHoverDetail {
  final Offset localPosition;
  final bool? hovering;

  const OnHoverDetail(this.localPosition, this.hovering);
}


typedef GestureOnHover = void Function(OnHoverDetail details);