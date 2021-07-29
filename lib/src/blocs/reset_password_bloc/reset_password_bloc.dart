import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/user_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc({required this.userRepository})
      : super(ResetPasswordInitial());
  final UserRepository userRepository;

  @override
  Stream<ResetPasswordState> mapEventToState(
    ResetPasswordEvent event,
  ) async* {
    switch (event.runtimeType) {
    }
  }
}
