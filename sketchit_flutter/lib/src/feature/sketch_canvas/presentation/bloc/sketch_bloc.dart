import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sketch_event.dart';
part 'sketch_state.dart';

class SketchBloc extends Bloc<SketchEvent, SketchState> {
  SketchBloc()
      : super(SketchState(
          points: [],
          color: Colors.red,
          strokeWidth: 2.0,
        )) {
    on<StartSketch>((event, emit) {
      emit(state.copyWith(points: List.from(state.points)..add(event.offset)));
    });

    on<ContinueSketch>((event, emit) {
      emit(state.copyWith(points: List.from(state.points)..add(event.offset)));
    });

    on<ChangeColor>((event, emit) {
      emit(state.copyWith(color: event.color));
    });

    on<ChangeStrokeWidth>((event, emit) {
      emit(state.copyWith(strokeWidth: event.strokeWidth));
    });
  }
}
