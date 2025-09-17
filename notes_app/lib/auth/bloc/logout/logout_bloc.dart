import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/data/datasources/auth_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDatasource _authRemoteDatasources;
  LogoutBloc(this._authRemoteDatasources) : super(_Initial()) {
    on<_Logout>((event, emit) async {
      emit(_Loading());
      final hasil = await _authRemoteDatasources.logout();

      hasil.fold(
        (blubuk) => emit(_Error(blubuk)),
        (success) => emit(_Success()),
      );
    });
  }
}
