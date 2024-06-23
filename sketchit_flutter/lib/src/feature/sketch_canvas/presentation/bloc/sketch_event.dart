part of 'sketch_bloc.dart';

sealed class SketchEvent {}

class StartSketch extends SketchEvent {
  final Offset offset;

  StartSketch(this.offset);
}

class ContinueSketch extends SketchEvent {
  final Offset offset;

  ContinueSketch(this.offset);
}

class ChangeColor extends SketchEvent {
  final Color color;

  ChangeColor(this.color);
}

class ChangeStrokeWidth extends SketchEvent {
  final double strokeWidth;

  ChangeStrokeWidth(this.strokeWidth);
}
