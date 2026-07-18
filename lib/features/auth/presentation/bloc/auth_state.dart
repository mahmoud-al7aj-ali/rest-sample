import 'package:rest_sample/features/auth/domain/entities/user.dart';

class AuthState {
  final User? user;
  final bool isLoading;
  final String? errorMsg;

  AuthState({this.user, required this.isLoading, this.errorMsg});

  factory AuthState.initial() =>  AuthState(
    user: null,
    isLoading: false,
    errorMsg: null,
  );

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? errorMsg,
    bool emptyError = false,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMsg: emptyError ? null: errorMsg ?? this.errorMsg,
    );
  }

}