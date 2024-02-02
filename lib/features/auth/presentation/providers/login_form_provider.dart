import 'package:teslo_shop/features/shared/shared.dart';

//! 1 - State de este provider

class LoginFormState{

  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;

  LoginFormState({
    this.isPosting = false, 
    this.isFormPosted = false, 
    this.isValid = false, 
    this.email = const Email.pure(),
    this.password = const Password.pure()
    });
}


//! 2 - Como implementamos un notifier



//! 3 - Como se consume un StatenotifierProvider
