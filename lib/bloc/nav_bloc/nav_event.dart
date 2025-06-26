abstract class NavBarEvent {}

class ChangeIndex extends NavBarEvent {
  final int navIndex;

  ChangeIndex(this.navIndex);
}
