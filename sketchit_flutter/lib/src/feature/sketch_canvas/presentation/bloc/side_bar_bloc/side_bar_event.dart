part of 'side_bar_bloc.dart';

sealed class SideBarEvent extends Equatable {
  const SideBarEvent();
}

class ToggleSideBar extends SideBarEvent {
  const ToggleSideBar();

  @override
  List<Object?> get props => [];
}
