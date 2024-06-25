part of 'sketch_bloc.dart';

class SketchState extends Equatable {
  final List<SketchStroke> sketchStrokes;
  final SketchStroke currentSketchStroke;

  const SketchState({
    required this.sketchStrokes,
    required this.currentSketchStroke,
  });

  SketchState copyWith({
    List<SketchStroke>? sketchStrokes,
    SketchStroke? currentSketchStroke,
  }) {
    return SketchState(
      sketchStrokes: sketchStrokes ?? this.sketchStrokes,
      currentSketchStroke: currentSketchStroke ?? this.currentSketchStroke,
    );
  }

  @override
  List<Object> get props => [sketchStrokes, currentSketchStroke];
}
