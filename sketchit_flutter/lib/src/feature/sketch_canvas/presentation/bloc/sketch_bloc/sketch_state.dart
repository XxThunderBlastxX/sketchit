part of 'sketch_bloc.dart';

class SketchState extends Equatable {
  final List<SketchStroke> sketchStrokes;
  final SketchStroke currentSketchStroke;
  final List<SketchStroke> historySketches;

  const SketchState({
    required this.sketchStrokes,
    required this.currentSketchStroke,
    required this.historySketches,
  });

  SketchState copyWith({
    List<SketchStroke>? sketchStrokes,
    SketchStroke? currentSketchStroke,
    List<SketchStroke>? historySketches,
  }) {
    return SketchState(
      sketchStrokes: sketchStrokes ?? this.sketchStrokes,
      currentSketchStroke: currentSketchStroke ?? this.currentSketchStroke,
      historySketches: historySketches ?? this.historySketches,
    );
  }

  @override
  List<Object> get props => [
        sketchStrokes,
        currentSketchStroke,
        historySketches,
      ];
}
