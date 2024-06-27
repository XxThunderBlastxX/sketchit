part of 'side_bar_bloc.dart';

class SideBarState extends Equatable {
  final bool isSideBarOpen;

  const SideBarState({required this.isSideBarOpen});

  SideBarState copyWith({bool? isSideBarOpen}) => SideBarState(
        isSideBarOpen: isSideBarOpen ?? this.isSideBarOpen,
      );

  @override
  List<Object> get props => [isSideBarOpen];
}
