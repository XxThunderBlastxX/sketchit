part of 'sketch_bloc.dart';

sealed class SketchEvent {}

class StartSketch extends SketchEvent {
  final SketchStroke sketchStroke;

  StartSketch(this.sketchStroke);
}

class ContinueSketch extends SketchEvent {
  final SketchStroke sketchStroke;

  ContinueSketch(this.sketchStroke);
}

class EndSketch extends SketchEvent {}
