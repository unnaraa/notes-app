// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:notes_app/data/datasources/auth_remote_datasource.dart';
import 'package:notes_app/data/models/response/auth_response.dart';

part 'avatar_bloc.freezed.dart';
part 'avatar_event.dart';
part 'avatar_state.dart';

class AvatarBloc extends Bloc<AvatarEvent, AvatarState> {
  final AuthRemoteDatasource authRemoteDatasources;
  AvatarBloc(
    this.authRemoteDatasources,
  ) : super(_Initial()) {
    on<AvatarEvent>((event, emit) {
      
    });
  }
}
