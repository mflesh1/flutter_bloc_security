import 'package:bloc/bloc.dart';

import 'welcome.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {

  WelcomeBloc();

  @override
  WelcomeState get initialState => WelcomeInitial();

  @override
  Stream<WelcomeState> mapEventToState(WelcomeEvent event) async* {
      yield WelcomeInitial();
  }
}