part of 'sketch_bloc.dart';

class SketchState {
  final List<Offset> points;
  final Color color;
  final double strokeWidth;

  SketchState({
    required this.points,
    required this.color,
    required this.strokeWidth,
  });

  SketchState copyWith({
    List<Offset>? points,
    Color? color,
    double? strokeWidth,
  }) {
    return SketchState(
      points: points ?? this.points,
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }
}
