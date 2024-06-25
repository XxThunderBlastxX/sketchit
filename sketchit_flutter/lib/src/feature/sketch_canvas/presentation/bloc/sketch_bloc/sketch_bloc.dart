import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/sketch_stroke.dart';

part 'sketch_event.dart';
part 'sketch_state.dart';

class SketchBloc extends Bloc<SketchEvent, SketchState> {
  final TransformationController transformationController =
      TransformationController();

  SketchBloc()
      : super(
          SketchState(
            historySketches: const [],
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
        historySketches: List<SketchStroke>.from(state.historySketches)
          ..addAll(state.sketchStrokes),
      ));
    });

    on<UndoSketch>((event, emit) {
      if (state.sketchStrokes.isEmpty) return;
      final lastStroke = state.sketchStrokes.last;
      final updatedSketchStrokes = List<SketchStroke>.from(state.sketchStrokes)
        ..removeLast();

      emit(state.copyWith(
        sketchStrokes: updatedSketchStrokes,
        historySketches: List<SketchStroke>.from(state.historySketches)
          ..add(lastStroke),
      ));
    });

    on<RedoSketch>((event, emit) {
      if (state.historySketches.isEmpty) return;
      final lastStroke = state.historySketches.last;
      final updatedHistorySketches =
          List<SketchStroke>.from(state.historySketches)..removeLast();

      emit(state.copyWith(
        sketchStrokes: List<SketchStroke>.from(state.sketchStrokes)
          ..add(lastStroke),
        historySketches: updatedHistorySketches,
      ));
    });
  }

  @override
  Future<void> close() async {
    await super.close();
    transformationController.dispose();
    return;
  }
}
