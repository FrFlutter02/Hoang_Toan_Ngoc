import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpSubmitted extends SignUpEvent {
  final String email;
  final String password;
  final String fullName;

  SignUpSubmitted(this.email, this.password, this.fullName);

  @override
  List<Object> get props => [email, password, fullName];
}
