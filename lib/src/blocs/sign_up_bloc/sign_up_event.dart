import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;

  SignUpEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;

  SignUpPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class SignUpSubmitted extends SignUpEvent {
  final String email;
  final String password;
  final String fullName;

  SignUpSubmitted(
      {required this.email, required this.password, required this.fullName});

  @override
  List<Object> get props => [email, password];
}
