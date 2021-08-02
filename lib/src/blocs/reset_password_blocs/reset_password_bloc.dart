import 'package:bloc/bloc.dart';

import '../../repositories/user_repository.dart';
import '../../constants/constants.dart';
import '../reset_password_blocs/reset_password_event.dart';
import '../reset_password_blocs/reset_password_state.dart';
import '../../utils/validators.dart';

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
      case EmailChanged:
        final emailChangedEvent = event as EmailChanged;
        yield EmailChangeSuccess(
            isValidEmail: Validators.isValidEmail(emailChangedEvent.email));
        break;
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
