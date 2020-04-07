import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_security/models/models.dart';

import 'package:flutter_bloc_security/repositories/data_repository.dart';

import 'barrel.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final DataRepository dataRepository;

  AuthBloc({@required this.dataRepository});

  @override
  AuthState get initialState => AuthenticationUnknown();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoggingOutEvent) {
      yield* _mapLoggingOutEvent(event);
    } else if (event is UnauthorizedEvent) {
      yield* _mapUnauthorizedEvent(event);
    } else if (event is LoadingEvent) {
      yield* _mapLoadingEvent(event);
    } else if (event is AuthorizedEvent) {
      yield* _mapAuthorizedEvent(event);
    }
  }

  Stream<AuthState> _mapAuthorizedEvent(AuthorizedEvent event) async* {
    await dataRepository.setUser(event.user);
    yield AuthenticatedState(event.user);
  }

  Stream<AuthState> _mapLoggingOutEvent(LoggingOutEvent event) async* {
      await dataRepository.setUser(null);
      yield UnauthenticatedState();
  }

  Stream<AuthState> _mapUnauthorizedEvent(UnauthorizedEvent event) async* {
    await dataRepository.setUser(null);
    yield UnauthenticatedState();
  }

  Stream<AuthState> _mapLoadingEvent(LoadingEvent event) async* {
    User user = await dataRepository.getUser();
    if (user == null) {
      yield UnauthenticatedState();
    } else {
      yield AuthenticatedState(user);
    }
  }

}