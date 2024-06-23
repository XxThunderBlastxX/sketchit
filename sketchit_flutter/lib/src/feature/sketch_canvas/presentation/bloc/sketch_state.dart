part of 'sketch_bloc.dart';

class SketchState {
  final List<SketchStroke?> sketchStrokes;

  SketchState({required this.sketchStrokes});

  SketchState copyWith({required List<SketchStroke?> sketchStrokes}) =>
      SketchState(sketchStrokes: sketchStrokes);
}
