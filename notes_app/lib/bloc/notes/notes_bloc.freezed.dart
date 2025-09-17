// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NotesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncNotes,
    required TResult Function() getLocalNotes,
    required TResult Function(Notes model) createNotes,
    required TResult Function(Notes model) updateNotes,
    required TResult Function(Notes model) deleteNotes,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncNotes,
    TResult? Function()? getLocalNotes,
    TResult? Function(Notes model)? createNotes,
    TResult? Function(Notes model)? updateNotes,
    TResult? Function(Notes model)? deleteNotes,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncNotes,
    TResult Function()? getLocalNotes,
    TResult Function(Notes model)? createNotes,
    TResult Function(Notes model)? updateNotes,
    TResult Function(Notes model)? deleteNotes,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncNotes value) syncNotes,
    required TResult Function(_GetNotesLocal value) getLocalNotes,
    required TResult Function(_CreateNotes value) createNotes,
    required TResult Function(_UpdateNotes value) updateNotes,
    required TResult Function(_DeleteNotes value) deleteNotes,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncNotes value)? syncNotes,
    TResult? Function(_GetNotesLocal value)? getLocalNotes,
    TResult? Function(_CreateNotes value)? createNotes,
    TResult? Function(_UpdateNotes value)? updateNotes,
    TResult? Function(_DeleteNotes value)? deleteNotes,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncNotes value)? syncNotes,
    TResult Function(_GetNotesLocal value)? getLocalNotes,
    TResult Function(_CreateNotes value)? createNotes,
    TResult Function(_UpdateNotes value)? updateNotes,
    TResult Function(_DeleteNotes value)? deleteNotes,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesEventCopyWith<$Res> {
  factory $NotesEventCopyWith(
    NotesEvent value,
    $Res Function(NotesEvent) then,
  ) = _$NotesEventCopyWithImpl<$Res, NotesEvent>;
}

/// @nodoc
class _$NotesEventCopyWithImpl<$Res, $Val extends NotesEvent>
    implements $NotesEventCopyWith<$Res> {
  _$NotesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'NotesEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncNotes,
    required TResult Function() getLocalNotes,
    required TResult Function(Notes model) createNotes,
    required TResult Function(Notes model) updateNotes,
    required TResult Function(Notes model) deleteNotes,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncNotes,
    TResult? Function()? getLocalNotes,
    TResult? Function(Notes model)? createNotes,
    TResult? Function(Notes model)? updateNotes,
    TResult? Function(Notes model)? deleteNotes,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncNotes,
    TResult Function()? getLocalNotes,
    TResult Function(Notes model)? createNotes,
    TResult Function(Notes model)? updateNotes,
    TResult Function(Notes model)? deleteNotes,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncNotes value) syncNotes,
    required TResult Function(_GetNotesLocal value) getLocalNotes,
    required TResult Function(_CreateNotes value) createNotes,
    required TResult Function(_UpdateNotes value) updateNotes,
    required TResult Function(_DeleteNotes value) deleteNotes,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncNotes value)? syncNotes,
    TResult? Function(_GetNotesLocal value)? getLocalNotes,
    TResult? Function(_CreateNotes value)? createNotes,
    TResult? Function(_UpdateNotes value)? updateNotes,
    TResult? Function(_DeleteNotes value)? deleteNotes,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncNotes value)? syncNotes,
    TResult Function(_GetNotesLocal value)? getLocalNotes,
    TResult Function(_CreateNotes value)? createNotes,
    TResult Function(_UpdateNotes value)? updateNotes,
    TResult Function(_DeleteNotes value)? deleteNotes,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements NotesEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SyncNotesImplCopyWith<$Res> {
  factory _$$SyncNotesImplCopyWith(
    _$SyncNotesImpl value,
    $Res Function(_$SyncNotesImpl) then,
  ) = __$$SyncNotesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncNotesImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$SyncNotesImpl>
    implements _$$SyncNotesImplCopyWith<$Res> {
  __$$SyncNotesImplCopyWithImpl(
    _$SyncNotesImpl _value,
    $Res Function(_$SyncNotesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SyncNotesImpl implements _SyncNotes {
  const _$SyncNotesImpl();

  @override
  String toString() {
    return 'NotesEvent.syncNotes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncNotesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncNotes,
    required TResult Function() getLocalNotes,
    required TResult Function(Notes model) createNotes,
    required TResult Function(Notes model) updateNotes,
    required TResult Function(Notes model) deleteNotes,
  }) {
    return syncNotes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncNotes,
    TResult? Function()? getLocalNotes,
    TResult? Function(Notes model)? createNotes,
    TResult? Function(Notes model)? updateNotes,
    TResult? Function(Notes model)? deleteNotes,
  }) {
    return syncNotes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncNotes,
    TResult Function()? getLocalNotes,
    TResult Function(Notes model)? createNotes,
    TResult Function(Notes model)? updateNotes,
    TResult Function(Notes model)? deleteNotes,
    required TResult orElse(),
  }) {
    if (syncNotes != null) {
      return syncNotes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncNotes value) syncNotes,
    required TResult Function(_GetNotesLocal value) getLocalNotes,
    required TResult Function(_CreateNotes value) createNotes,
    required TResult Function(_UpdateNotes value) updateNotes,
    required TResult Function(_DeleteNotes value) deleteNotes,
  }) {
    return syncNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncNotes value)? syncNotes,
    TResult? Function(_GetNotesLocal value)? getLocalNotes,
    TResult? Function(_CreateNotes value)? createNotes,
    TResult? Function(_UpdateNotes value)? updateNotes,
    TResult? Function(_DeleteNotes value)? deleteNotes,
  }) {
    return syncNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncNotes value)? syncNotes,
    TResult Function(_GetNotesLocal value)? getLocalNotes,
    TResult Function(_CreateNotes value)? createNotes,
    TResult Function(_UpdateNotes value)? updateNotes,
    TResult Function(_DeleteNotes value)? deleteNotes,
    required TResult orElse(),
  }) {
    if (syncNotes != null) {
      return syncNotes(this);
    }
    return orElse();
  }
}

abstract class _SyncNotes implements NotesEvent {
  const factory _SyncNotes() = _$SyncNotesImpl;
}

/// @nodoc
abstract class _$$GetNotesLocalImplCopyWith<$Res> {
  factory _$$GetNotesLocalImplCopyWith(
    _$GetNotesLocalImpl value,
    $Res Function(_$GetNotesLocalImpl) then,
  ) = __$$GetNotesLocalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotesLocalImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$GetNotesLocalImpl>
    implements _$$GetNotesLocalImplCopyWith<$Res> {
  __$$GetNotesLocalImplCopyWithImpl(
    _$GetNotesLocalImpl _value,
    $Res Function(_$GetNotesLocalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotesLocalImpl implements _GetNotesLocal {
  const _$GetNotesLocalImpl();

  @override
  String toString() {
    return 'NotesEvent.getLocalNotes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetNotesLocalImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncNotes,
    required TResult Function() getLocalNotes,
    required TResult Function(Notes model) createNotes,
    required TResult Function(Notes model) updateNotes,
    required TResult Function(Notes model) deleteNotes,
  }) {
    return getLocalNotes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncNotes,
    TResult? Function()? getLocalNotes,
    TResult? Function(Notes model)? createNotes,
    TResult? Function(Notes model)? updateNotes,
    TResult? Function(Notes model)? deleteNotes,
  }) {
    return getLocalNotes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncNotes,
    TResult Function()? getLocalNotes,
    TResult Function(Notes model)? createNotes,
    TResult Function(Notes model)? updateNotes,
    TResult Function(Notes model)? deleteNotes,
    required TResult orElse(),
  }) {
    if (getLocalNotes != null) {
      return getLocalNotes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncNotes value) syncNotes,
    required TResult Function(_GetNotesLocal value) getLocalNotes,
    required TResult Function(_CreateNotes value) createNotes,
    required TResult Function(_UpdateNotes value) updateNotes,
    required TResult Function(_DeleteNotes value) deleteNotes,
  }) {
    return getLocalNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncNotes value)? syncNotes,
    TResult? Function(_GetNotesLocal value)? getLocalNotes,
    TResult? Function(_CreateNotes value)? createNotes,
    TResult? Function(_UpdateNotes value)? updateNotes,
    TResult? Function(_DeleteNotes value)? deleteNotes,
  }) {
    return getLocalNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncNotes value)? syncNotes,
    TResult Function(_GetNotesLocal value)? getLocalNotes,
    TResult Function(_CreateNotes value)? createNotes,
    TResult Function(_UpdateNotes value)? updateNotes,
    TResult Function(_DeleteNotes value)? deleteNotes,
    required TResult orElse(),
  }) {
    if (getLocalNotes != null) {
      return getLocalNotes(this);
    }
    return orElse();
  }
}

abstract class _GetNotesLocal implements NotesEvent {
  const factory _GetNotesLocal() = _$GetNotesLocalImpl;
}

/// @nodoc
abstract class _$$CreateNotesImplCopyWith<$Res> {
  factory _$$CreateNotesImplCopyWith(
    _$CreateNotesImpl value,
    $Res Function(_$CreateNotesImpl) then,
  ) = __$$CreateNotesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Notes model});
}

/// @nodoc
class __$$CreateNotesImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$CreateNotesImpl>
    implements _$$CreateNotesImplCopyWith<$Res> {
  __$$CreateNotesImplCopyWithImpl(
    _$CreateNotesImpl _value,
    $Res Function(_$CreateNotesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? model = null}) {
    return _then(
      _$CreateNotesImpl(
        null == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                as Notes,
      ),
    );
  }
}

/// @nodoc

class _$CreateNotesImpl implements _CreateNotes {
  const _$CreateNotesImpl(this.model);

  @override
  final Notes model;

  @override
  String toString() {
    return 'NotesEvent.createNotes(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNotesImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNotesImplCopyWith<_$CreateNotesImpl> get copyWith =>
      __$$CreateNotesImplCopyWithImpl<_$CreateNotesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncNotes,
    required TResult Function() getLocalNotes,
    required TResult Function(Notes model) createNotes,
    required TResult Function(Notes model) updateNotes,
    required TResult Function(Notes model) deleteNotes,
  }) {
    return createNotes(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncNotes,
    TResult? Function()? getLocalNotes,
    TResult? Function(Notes model)? createNotes,
    TResult? Function(Notes model)? updateNotes,
    TResult? Function(Notes model)? deleteNotes,
  }) {
    return createNotes?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncNotes,
    TResult Function()? getLocalNotes,
    TResult Function(Notes model)? createNotes,
    TResult Function(Notes model)? updateNotes,
    TResult Function(Notes model)? deleteNotes,
    required TResult orElse(),
  }) {
    if (createNotes != null) {
      return createNotes(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncNotes value) syncNotes,
    required TResult Function(_GetNotesLocal value) getLocalNotes,
    required TResult Function(_CreateNotes value) createNotes,
    required TResult Function(_UpdateNotes value) updateNotes,
    required TResult Function(_DeleteNotes value) deleteNotes,
  }) {
    return createNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncNotes value)? syncNotes,
    TResult? Function(_GetNotesLocal value)? getLocalNotes,
    TResult? Function(_CreateNotes value)? createNotes,
    TResult? Function(_UpdateNotes value)? updateNotes,
    TResult? Function(_DeleteNotes value)? deleteNotes,
  }) {
    return createNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncNotes value)? syncNotes,
    TResult Function(_GetNotesLocal value)? getLocalNotes,
    TResult Function(_CreateNotes value)? createNotes,
    TResult Function(_UpdateNotes value)? updateNotes,
    TResult Function(_DeleteNotes value)? deleteNotes,
    required TResult orElse(),
  }) {
    if (createNotes != null) {
      return createNotes(this);
    }
    return orElse();
  }
}

abstract class _CreateNotes implements NotesEvent {
  const factory _CreateNotes(final Notes model) = _$CreateNotesImpl;

  Notes get model;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateNotesImplCopyWith<_$CreateNotesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateNotesImplCopyWith<$Res> {
  factory _$$UpdateNotesImplCopyWith(
    _$UpdateNotesImpl value,
    $Res Function(_$UpdateNotesImpl) then,
  ) = __$$UpdateNotesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Notes model});
}

/// @nodoc
class __$$UpdateNotesImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$UpdateNotesImpl>
    implements _$$UpdateNotesImplCopyWith<$Res> {
  __$$UpdateNotesImplCopyWithImpl(
    _$UpdateNotesImpl _value,
    $Res Function(_$UpdateNotesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? model = null}) {
    return _then(
      _$UpdateNotesImpl(
        null == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                as Notes,
      ),
    );
  }
}

/// @nodoc

class _$UpdateNotesImpl implements _UpdateNotes {
  const _$UpdateNotesImpl(this.model);

  @override
  final Notes model;

  @override
  String toString() {
    return 'NotesEvent.updateNotes(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNotesImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNotesImplCopyWith<_$UpdateNotesImpl> get copyWith =>
      __$$UpdateNotesImplCopyWithImpl<_$UpdateNotesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncNotes,
    required TResult Function() getLocalNotes,
    required TResult Function(Notes model) createNotes,
    required TResult Function(Notes model) updateNotes,
    required TResult Function(Notes model) deleteNotes,
  }) {
    return updateNotes(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncNotes,
    TResult? Function()? getLocalNotes,
    TResult? Function(Notes model)? createNotes,
    TResult? Function(Notes model)? updateNotes,
    TResult? Function(Notes model)? deleteNotes,
  }) {
    return updateNotes?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncNotes,
    TResult Function()? getLocalNotes,
    TResult Function(Notes model)? createNotes,
    TResult Function(Notes model)? updateNotes,
    TResult Function(Notes model)? deleteNotes,
    required TResult orElse(),
  }) {
    if (updateNotes != null) {
      return updateNotes(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncNotes value) syncNotes,
    required TResult Function(_GetNotesLocal value) getLocalNotes,
    required TResult Function(_CreateNotes value) createNotes,
    required TResult Function(_UpdateNotes value) updateNotes,
    required TResult Function(_DeleteNotes value) deleteNotes,
  }) {
    return updateNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncNotes value)? syncNotes,
    TResult? Function(_GetNotesLocal value)? getLocalNotes,
    TResult? Function(_CreateNotes value)? createNotes,
    TResult? Function(_UpdateNotes value)? updateNotes,
    TResult? Function(_DeleteNotes value)? deleteNotes,
  }) {
    return updateNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncNotes value)? syncNotes,
    TResult Function(_GetNotesLocal value)? getLocalNotes,
    TResult Function(_CreateNotes value)? createNotes,
    TResult Function(_UpdateNotes value)? updateNotes,
    TResult Function(_DeleteNotes value)? deleteNotes,
    required TResult orElse(),
  }) {
    if (updateNotes != null) {
      return updateNotes(this);
    }
    return orElse();
  }
}

abstract class _UpdateNotes implements NotesEvent {
  const factory _UpdateNotes(final Notes model) = _$UpdateNotesImpl;

  Notes get model;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateNotesImplCopyWith<_$UpdateNotesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteNotesImplCopyWith<$Res> {
  factory _$$DeleteNotesImplCopyWith(
    _$DeleteNotesImpl value,
    $Res Function(_$DeleteNotesImpl) then,
  ) = __$$DeleteNotesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Notes model});
}

/// @nodoc
class __$$DeleteNotesImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$DeleteNotesImpl>
    implements _$$DeleteNotesImplCopyWith<$Res> {
  __$$DeleteNotesImplCopyWithImpl(
    _$DeleteNotesImpl _value,
    $Res Function(_$DeleteNotesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? model = null}) {
    return _then(
      _$DeleteNotesImpl(
        null == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                as Notes,
      ),
    );
  }
}

/// @nodoc

class _$DeleteNotesImpl implements _DeleteNotes {
  const _$DeleteNotesImpl(this.model);

  @override
  final Notes model;

  @override
  String toString() {
    return 'NotesEvent.deleteNotes(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNotesImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteNotesImplCopyWith<_$DeleteNotesImpl> get copyWith =>
      __$$DeleteNotesImplCopyWithImpl<_$DeleteNotesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncNotes,
    required TResult Function() getLocalNotes,
    required TResult Function(Notes model) createNotes,
    required TResult Function(Notes model) updateNotes,
    required TResult Function(Notes model) deleteNotes,
  }) {
    return deleteNotes(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncNotes,
    TResult? Function()? getLocalNotes,
    TResult? Function(Notes model)? createNotes,
    TResult? Function(Notes model)? updateNotes,
    TResult? Function(Notes model)? deleteNotes,
  }) {
    return deleteNotes?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncNotes,
    TResult Function()? getLocalNotes,
    TResult Function(Notes model)? createNotes,
    TResult Function(Notes model)? updateNotes,
    TResult Function(Notes model)? deleteNotes,
    required TResult orElse(),
  }) {
    if (deleteNotes != null) {
      return deleteNotes(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncNotes value) syncNotes,
    required TResult Function(_GetNotesLocal value) getLocalNotes,
    required TResult Function(_CreateNotes value) createNotes,
    required TResult Function(_UpdateNotes value) updateNotes,
    required TResult Function(_DeleteNotes value) deleteNotes,
  }) {
    return deleteNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncNotes value)? syncNotes,
    TResult? Function(_GetNotesLocal value)? getLocalNotes,
    TResult? Function(_CreateNotes value)? createNotes,
    TResult? Function(_UpdateNotes value)? updateNotes,
    TResult? Function(_DeleteNotes value)? deleteNotes,
  }) {
    return deleteNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncNotes value)? syncNotes,
    TResult Function(_GetNotesLocal value)? getLocalNotes,
    TResult Function(_CreateNotes value)? createNotes,
    TResult Function(_UpdateNotes value)? updateNotes,
    TResult Function(_DeleteNotes value)? deleteNotes,
    required TResult orElse(),
  }) {
    if (deleteNotes != null) {
      return deleteNotes(this);
    }
    return orElse();
  }
}

abstract class _DeleteNotes implements NotesEvent {
  const factory _DeleteNotes(final Notes model) = _$DeleteNotesImpl;

  Notes get model;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteNotesImplCopyWith<_$DeleteNotesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Notes> notes) loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Notes> notes)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Notes> notes)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesStateCopyWith<$Res> {
  factory $NotesStateCopyWith(
    NotesState value,
    $Res Function(NotesState) then,
  ) = _$NotesStateCopyWithImpl<$Res, NotesState>;
}

/// @nodoc
class _$NotesStateCopyWithImpl<$Res, $Val extends NotesState>
    implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NotesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Notes> notes) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Notes> notes)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Notes> notes)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotesState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'NotesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Notes> notes) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Notes> notes)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Notes> notes)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements NotesState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Notes> notes});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notes = null}) {
    return _then(
      _$SuccessImpl(
        null == notes
            ? _value._notes
            : notes // ignore: cast_nullable_to_non_nullable
                as List<Notes>,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<Notes> notes) : _notes = notes;

  final List<Notes> _notes;
  @override
  List<Notes> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString() {
    return 'NotesState.loaded(notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notes));

  /// Create a copy of NotesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Notes> notes) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Notes> notes)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Notes> notes)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Success implements NotesState {
  const factory _Success(final List<Notes> notes) = _$SuccessImpl;

  List<Notes> get notes;

  /// Create a copy of NotesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NotesState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NotesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Notes> notes) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Notes> notes)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Notes> notes)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements NotesState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of NotesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
