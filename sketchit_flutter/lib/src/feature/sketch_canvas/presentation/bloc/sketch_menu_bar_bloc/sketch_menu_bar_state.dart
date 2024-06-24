part of 'sketch_menu_bar_bloc.dart';

final class SketchMenuBarState extends Equatable {
  final Color color;
  final SketchMode sketchMode;

  const SketchMenuBarState({
    required this.color,
    required this.sketchMode,
  });

  SketchMenuBarState copyWith({
    Color? color,
    SketchMode? sketchMode,
  }) =>
      SketchMenuBarState(
        color: color ?? this.color,
        sketchMode: sketchMode ?? this.sketchMode,
      );

  @override
  List<Object> get props => [color, sketchMode];
}
