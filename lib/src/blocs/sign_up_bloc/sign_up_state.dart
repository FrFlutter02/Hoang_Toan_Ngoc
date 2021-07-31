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

class SignUpSuccess extends SignUpState {
  final UserCredential user;
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
