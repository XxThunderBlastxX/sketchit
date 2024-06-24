import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/sketch_stroke.dart';

part 'sketch_menu_bar_event.dart';
part 'sketch_menu_bar_state.dart';

class SketchMenuBarBloc extends Bloc<SketchMenuBarEvent, SketchMenuBarState> {
  SketchMenuBarBloc()
      : super(const SketchMenuBarState(
          color: Colors.black,
          sketchMode: SketchMode.draw,
        )) {
    on<ChangeColor>((event, emit) {
      emit(state.copyWith(
        color: event.color,
      ));
    });

    on<ChangeSketchMode>((event, emit) {
      emit(state.copyWith(
        sketchMode: event.sketchMode,
      ));
    });
  }
}
