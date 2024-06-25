import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketchit_flutter/src/app/theme/theme.dart';

import '../../model/sketch_stroke.dart';

part 'sketch_menu_bar_event.dart';
part 'sketch_menu_bar_state.dart';

class SketchMenuBarBloc extends Bloc<SketchMenuBarEvent, SketchMenuBarState> {
  SketchMenuBarBloc()
      : super(SketchMenuBarState(
          strokeColor: Colors.black,
          sketchMode: SketchMode.draw,
          eraserColor: AppTheme.theme.colorScheme.surface,
        )) {
    on<ChangeColor>((event, emit) {
      emit(state.copyWith(
        strokeColor: event.color,
      ));
    });

    on<ChangeSketchMode>((event, emit) {
      // if (event.sketchMode == SketchMode.erase) {
      //   emit(state.copyWith(
      //     sketchMode: event.sketchMode,
      //     strokeColor: ,
      //   ));
      //   return;
      // }
      emit(state.copyWith(
        sketchMode: event.sketchMode,
      ));
    });
  }
}
