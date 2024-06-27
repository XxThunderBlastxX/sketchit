part of 'sketch_menu_bar_bloc.dart';

final class SketchMenuBarState extends Equatable {
  final Color strokeColor;
  final Color eraserColor;
  final SketchMode sketchMode;
  final double strokeSize;
  final double eraserSize;

  const SketchMenuBarState({
    required this.strokeColor,
    required this.sketchMode,
    required this.eraserColor,
    required this.strokeSize,
    required this.eraserSize,
  }) : assert(
          strokeSize >= 3.0 &&
              strokeSize <= 20.0 &&
              eraserSize >= 5.0 &&
              eraserSize <= 30,
        );

  SketchMenuBarState copyWith({
    Color? strokeColor,
    SketchMode? sketchMode,
    Color? eraserColor,
    double? strokeSize,
    double? eraserSize,
  }) =>
      SketchMenuBarState(
        strokeColor: strokeColor ?? this.strokeColor,
        sketchMode: sketchMode ?? this.sketchMode,
        eraserColor: eraserColor ?? this.eraserColor,
        strokeSize: strokeSize ?? this.strokeSize,
        eraserSize: eraserSize ?? this.eraserSize,
      );

  @override
  List<Object> get props => [
        strokeColor,
        sketchMode,
        eraserColor,
        strokeSize,
        eraserSize,
      ];
}
