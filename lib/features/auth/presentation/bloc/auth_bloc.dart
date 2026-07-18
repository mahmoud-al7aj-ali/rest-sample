import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rest_sample/core/network/app_reponse.dart';
import 'package:rest_sample/core/network/app_request.dart';
import 'package:rest_sample/features/auth/domain/usecases/login_usecase.dart';
import 'package:rest_sample/features/auth/domain/usecases/register_usecase.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_event.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  AuthBloc(this.registerUseCase, this.loginUseCase) : super(AuthState.initial()){
    on<AuthRegisterEvent>(_register);
    on<AuthLoginEvent>(_login);
  }

  FutureOr<void> _register(AuthRegisterEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, emptyError: true));
      final user = await registerUseCase(request: event.request);
      emit(state.copyWith(isLoading: false, user: user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMsg: e.toString()));
    }
  }

  FutureOr<void> _login(AuthLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, emptyError: true));
      final user = await loginUseCase(request: event.request);
      emit(state.copyWith(isLoading: false, user: user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMsg: e.toString()));
    }
  }

}