import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'side_bar_event.dart';
part 'side_bar_state.dart';

class SideBarBloc extends Bloc<SideBarEvent, SideBarState> {
  SideBarBloc() : super(const SideBarState(isSideBarOpen: false)) {
    on<ToggleSideBar>((event, emit) {
      emit(state.copyWith(
        isSideBarOpen: !state.isSideBarOpen,
      ));
    });
  }
}
