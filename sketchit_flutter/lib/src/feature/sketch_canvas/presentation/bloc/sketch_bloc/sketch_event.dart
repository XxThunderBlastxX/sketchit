part of 'sketch_bloc.dart';

sealed class SketchEvent extends Equatable {}

class StartSketch extends SketchEvent {
  final SketchStroke sketchStroke;

  StartSketch(this.sketchStroke);

  @override
  List<Object?> get props => [sketchStroke];
}

class ContinueSketch extends SketchEvent {
  final SketchStroke sketchStroke;

  ContinueSketch(this.sketchStroke);

  @override
  List<Object?> get props => [sketchStroke];
}

class EndSketch extends SketchEvent {
  @override
  List<Object?> get props => [];
}

class ClearSketch extends SketchEvent {
  @override
  List<Object?> get props => [];
}

class UndoSketch extends SketchEvent {
  @override
  List<Object?> get props => [];
}

class RedoSketch extends SketchEvent {
  @override
  List<Object?> get props => [];
}
