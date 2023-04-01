abstract class MainState {
  final int index;
  const MainState(this.index);
}

class HomeState extends MainState {
  HomeState() : super(0);
}

class SendRequestState extends MainState {
  SendRequestState() : super(1);
}

class ViewRequestState extends MainState {
  ViewRequestState() : super(2);
}

class ViewProfileState extends MainState {
  ViewProfileState() : super(3);
}
