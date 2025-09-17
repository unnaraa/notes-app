import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/data/datasources/auth_remote_datasource.dart';
import 'package:notes_app/data/models/request/login_request.dart';
import 'package:notes_app/data/models/response/auth_response.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource authRemoteDatasources;
  LoginBloc(this.authRemoteDatasources) : super(_Initial())  {
    on<_Login>((event, emit) async {
      emit(_Loading());
      final requestData = LoginRequestModel(email: event.email, password: event.password);

      final response = await authRemoteDatasources.login(requestData);
      response.fold((error) => emit(_Error(error)), (success) => emit(_Success(success)));
    });
  }
}
