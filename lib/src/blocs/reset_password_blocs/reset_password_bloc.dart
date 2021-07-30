import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/user_repository.dart';
import '../../constants/constants.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc({required this.userRepository})
      : super(ResetPasswordInitial());

  final UserRepository userRepository;
  bool success = false;

  @override
  Stream<ResetPasswordState> mapEventToState(
    ResetPasswordEvent event,
  ) async* {
    switch (event.runtimeType) {
      case ResetPasswordSubmitted:
        final resetPasswordSubmittedEvent = event as ResetPasswordSubmitted;
        userRepository.sendPasswordResetMail(resetPasswordSubmittedEvent.email);
        yield ResetPasswordSubmitSuccess(success: !success);
        break;
      default:
        yield ResetPasswordSubmitFailure(
            errorMessage: AppConstants.errorMessage);
        break;
    }
  }
}
