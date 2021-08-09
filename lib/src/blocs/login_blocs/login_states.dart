import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState extends Equatable {
  LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User firebaseUser;

  LoginSuccess({required this.firebaseUser});

  @override
  List<Object> get props => [firebaseUser];
}

class LoginFailure extends LoginState {}
