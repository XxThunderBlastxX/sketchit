import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/theme/theme.dart';
import '../../model/sketch_stroke.dart';

part 'sketch_menu_bar_event.dart';
part 'sketch_menu_bar_state.dart';

class SketchMenuBarBloc extends Bloc<SketchMenuBarEvent, SketchMenuBarState> {
  SketchMenuBarBloc()
      : super(SketchMenuBarState(
          strokeColor: Colors.black,
          sketchMode: SketchMode.draw,
          eraserColor: AppTheme.theme.colorScheme.surface,
          strokeSize: 4.0,
          eraserSize: 10.0,
        )) {
    on<ChangeColor>((event, emit) {
      emit(state.copyWith(
        strokeColor: event.color,
      ));
    });

    on<ChangeSketchMode>((event, emit) {
      emit(state.copyWith(
        sketchMode: event.sketchMode,
      ));
    });

    on<ChangeEraserSize>((event, emit) {
      emit(state.copyWith(
        eraserSize: event.eraserSize,
      ));
    });

    on<ChangeStrokeSize>((event, emit) {
      emit(state.copyWith(
        strokeSize: event.strokeSize,
      ));
    });
  }
}
