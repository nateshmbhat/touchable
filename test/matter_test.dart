import 'package:flutter_test/flutter_test.dart';

import 'shape_handler/shape_handler.dart';
import 'shapes/shape.dart';

void main() {
  group('test library', () {
    testShapes();
    testShapeHandler();
  });
}
