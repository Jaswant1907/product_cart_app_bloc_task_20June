abstract class NavBarState {}

class ChangeNavState extends NavBarState {
  final int selectIndex;

  ChangeNavState(this.selectIndex);
}
