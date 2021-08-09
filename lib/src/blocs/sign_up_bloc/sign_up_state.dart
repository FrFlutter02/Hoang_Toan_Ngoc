import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpLoading extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpEmailValidatorsFailure extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpEmailValidatorsSuccess extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpPassWordValidatorsSuccess extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpPassWordValidatorsFailure extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpFullNameValidatorsSuccess extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpFullNameValidatorsFailure extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpFullNameAlreadyExist extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpSuccess extends SignUpState {
  final User user;
  SignUpSuccess(this.user);
  @override
  List<Object> get props => [];
}

class SignUpAuthFailure extends SignUpState {
  final FirebaseAuthException exception;
  SignUpAuthFailure(this.exception);
  @override
  List<Object> get props => [exception];
}
