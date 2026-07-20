
enum AuthStatus{
  idle,
  authenticated,
  unauthenticated;
}

class AuthState {
  final AuthStatus authStatus;
  final bool isLoading;
  final String? errorMsg;

  AuthState({required this.authStatus, required this.isLoading, this.errorMsg});

  factory AuthState.initial() =>  AuthState(
    authStatus: AuthStatus.idle,
    isLoading: false,
    errorMsg: null,
  );

  AuthState copyWith({
    AuthStatus? authStatus,
    bool? isLoading,
    String? errorMsg,
    bool emptyError = false,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      isLoading: isLoading ?? this.isLoading,
      errorMsg: emptyError ? null: errorMsg ?? this.errorMsg,
    );
  }

}