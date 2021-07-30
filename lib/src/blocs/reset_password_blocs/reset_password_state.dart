part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

// class ResetPasswordSubmitLoading extends ResetPasswordState {
//   final bool isEmailValid;
//   final bool loading;
//   const ResetPasswordSubmitLoading(
//       {required this.loading, required this.isEmailValid});
//   List<Object> get props => [loading];
// }

class ResetPasswordSubmitSuccess extends ResetPasswordState {
  final bool success;
  const ResetPasswordSubmitSuccess({required this.success});

  @override
  List<Object> get props => [success];
}

class EmailUpdateSuccess extends ResetPasswordState {
  final bool isEmailValid;
  const EmailUpdateSuccess({required this.isEmailValid});

  @override
  List<Object> get props => [isEmailValid];
}
