import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/data/datasources/auth_remote_datasource.dart';
import 'package:notes_app/data/models/request/register_request.dart';
import 'package:notes_app/data/models/response/auth_response.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRemoteDatasource daftarYuk;
  RegisterBloc(this.daftarYuk) : super(_Initial()) {
    on<_Register>((event, emit) async {
      emit(_Loading());

      final requestData = RegisterRequestModel(
        name: event.name,
        username: event.username,
        email: event.email,
        password: event.password,
        phone: event.phone,
      );

      final response = await daftarYuk.register(requestData);

      response.fold((duh) => emit(_Error(duh)), (yey) => emit(_Success(yey)));
    });
  }
}
