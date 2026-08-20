import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rest_sample/core/storage/app_storage.dart';
import 'package:rest_sample/core/storage/storage_keys.dart';
import 'package:rest_sample/features/auth/domain/entities/user.dart';
import 'package:rest_sample/features/auth/domain/usecases/login_usecase.dart';
import 'package:rest_sample/features/auth/domain/usecases/register_usecase.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_event.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final AppStorage _appStorage;

  AuthBloc(this.registerUseCase, this.loginUseCase, this._appStorage) : super(AuthState.initial()) {
    on<AuthRegisterEvent>(_register);
    on<AuthLoginEvent>(_login);
    on<AuthLogoutEvent>(_logout);
  }

  FutureOr<void> _register(AuthRegisterEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, emptyError: true));
      final user = await registerUseCase(request: event.request);
      await _auth(user);
      emit(state.copyWith(isLoading: false, authStatus: AuthStatus.authenticated));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMsg: e.toString()));
    }
  }

  FutureOr<void> _login(AuthLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, emptyError: true));
      final user = await loginUseCase(request: event.request);
      await _auth(user);
      emit(state.copyWith(isLoading: false, authStatus: AuthStatus.authenticated));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMsg: e.toString()));
    }
  }

  Future<void> _auth(User user) async {
    await _appStorage.writeSecure(key: StorageKeys.tokenKey, value: user.token);
    await _appStorage.writeUnSecure<bool>(key: StorageKeys.isLoggedInKey, value: true);
  }

  FutureOr<void> _logout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    await _appStorage.clearSecure(StorageKeys.tokenKey);
    await _appStorage.writeUnSecure<bool>(key: StorageKeys.isLoggedInKey, value: false);
    emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
  }
}
