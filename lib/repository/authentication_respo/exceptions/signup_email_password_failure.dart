class SignupEPFailure {
  final String message;

  const SignupEPFailure([this.message = 'An Unknown error occured.']);

  factory SignupEPFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignupEPFailure('Please enter a strong Password');

      case 'invalid-email':
        return SignupEPFailure('Use a Valid Email');

      case 'email-already-in-use':
        return SignupEPFailure('An Account already exists for the email');

      case 'operation-not-allowed':
        return SignupEPFailure(
            'Operation is not allowed. Please contact support');

      case 'user-disabled':
        return SignupEPFailure(
            'This user has been disabled.Please contact the customer service.');

      default:
        return SignupEPFailure();
    }
  }
}
