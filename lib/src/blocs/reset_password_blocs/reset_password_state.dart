import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class EmailChangeSuccess extends ResetPasswordState {
  bool isValidEmail;
  EmailChangeSuccess({required this.isValidEmail});

  @override
  List<Object> get props => [isValidEmail];
}

class ResetPasswordSubmitSuccess extends ResetPasswordState {
  bool success;
  ResetPasswordSubmitSuccess({required this.success});

  @override
  List<Object> get props => [success];
}

class ResetPasswordSubmitFailure extends ResetPasswordState {
  final String errorMessage;
  const ResetPasswordSubmitFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
