part of 'sketch_menu_bar_bloc.dart';

sealed class SketchMenuBarEvent extends Equatable {
  const SketchMenuBarEvent();
}

class ChangeColor extends SketchMenuBarEvent {
  final Color color;

  const ChangeColor(this.color);

  @override
  List<Object?> get props => [color];
}

class ChangeSketchMode extends SketchMenuBarEvent {
  final SketchMode sketchMode;

  const ChangeSketchMode(this.sketchMode);

  @override
  List<Object?> get props => [sketchMode];
}
