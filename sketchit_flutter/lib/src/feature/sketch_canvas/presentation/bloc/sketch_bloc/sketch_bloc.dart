import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/sketch_stroke.dart';

part 'sketch_event.dart';
part 'sketch_state.dart';

class SketchBloc extends Bloc<SketchEvent, SketchState> {
  SketchBloc()
      : super(
          SketchState(
            sketchStrokes: const [],
            currentSketchStroke: SketchStroke(
              sketchMode: SketchMode.draw,
              color: Colors.black,
              offsetList: [],
              strokeWidth: 5.0,
            ),
          ),
        ) {
    on<StartSketch>((event, emit) {
      emit(state.copyWith(currentSketchStroke: event.sketchStroke));
    });

    on<ContinueSketch>((event, emit) {
      emit(state.copyWith(currentSketchStroke: event.sketchStroke));
    });

    on<EndSketch>((event, emit) {
      final updatedSketchStrokes = List<SketchStroke>.from(state.sketchStrokes)
        ..add(state.currentSketchStroke);

      emit(state.copyWith(
          sketchStrokes: updatedSketchStrokes,
          currentSketchStroke: SketchStroke(
            offsetList: [],
            color: state.currentSketchStroke.color,
            strokeWidth: state.currentSketchStroke.strokeWidth,
            sketchMode: state.currentSketchStroke.sketchMode,
          )));
    });

    on<ClearSketch>((event, emit) {
      emit(SketchState(
        sketchStrokes: const [],
        currentSketchStroke: state.currentSketchStroke,
      ));
    });
  }
}
