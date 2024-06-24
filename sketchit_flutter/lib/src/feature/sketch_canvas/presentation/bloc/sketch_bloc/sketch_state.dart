part of 'sketch_bloc.dart';

class SketchState extends Equatable {
  final List<SketchStroke?> sketchStrokes;

  const SketchState({required this.sketchStrokes});

  SketchState copyWith({required List<SketchStroke?> sketchStrokes}) =>
      SketchState(sketchStrokes: sketchStrokes);

  @override
  List<Object?> get props => [sketchStrokes];
}
