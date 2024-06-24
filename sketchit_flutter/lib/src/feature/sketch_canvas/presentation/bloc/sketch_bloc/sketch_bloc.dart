import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/sketch_stroke.dart';

part 'sketch_event.dart';
part 'sketch_state.dart';

class SketchBloc extends Bloc<SketchEvent, SketchState> {
  SketchBloc() : super(const SketchState(sketchStrokes: [])) {
    on<StartSketch>((event, emit) {
      emit(state.copyWith(
          sketchStrokes: List.from(state.sketchStrokes)
            ..add(event.sketchStroke)));
    });

    on<ContinueSketch>((event, emit) {
      emit(state.copyWith(
          sketchStrokes: List.from(state.sketchStrokes)
            ..add(event.sketchStroke)));
    });

    on<EndSketch>((event, emit) {
      emit(
        state.copyWith(
          sketchStrokes: [...state.sketchStrokes, null],
        ),
      );
    });
  }
}
