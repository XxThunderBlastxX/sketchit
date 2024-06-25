part of 'sketch_menu_bar_bloc.dart';

final class SketchMenuBarState extends Equatable {
  final Color strokeColor;
  final Color eraserColor;
  final SketchMode sketchMode;

  const SketchMenuBarState({
    required this.strokeColor,
    required this.sketchMode,
    required this.eraserColor,
  });

  SketchMenuBarState copyWith({
    Color? strokeColor,
    SketchMode? sketchMode,
    Color? eraserColor,
  }) =>
      SketchMenuBarState(
        strokeColor: strokeColor ?? this.strokeColor,
        sketchMode: sketchMode ?? this.sketchMode,
        eraserColor: eraserColor ?? this.eraserColor,
      );

  @override
  List<Object> get props => [strokeColor, sketchMode];
}
