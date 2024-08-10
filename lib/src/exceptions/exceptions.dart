class Exceptions implements Exception {
  final String message;

  /// {@macro log_in_with_email_and_password_failure}
  const Exceptions([this.message = 'An unknown exception occurred.']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory Exceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const Exceptions('Email already exists.');
      case 'invalid-email':
        return const Exceptions('Email is not valid or badly formatted.');
      case 'weak-password':
        return const Exceptions('Please enter a stronger password.');
      case 'user-disabled':
        return const Exceptions(
            'This user has been disabled. Please contact support for help.');
      case 'user-not-found':
        return const Exceptions('Invalid Details, please create an account.');
      case 'wrong-password':
        return const Exceptions('Incorrect password, please try again.');
      case 'too-many-requests':
        return const Exceptions(
            'Too many requests, Service Temporarily blocked.');
      case 'invalid-argument':
        return const Exceptions(
            'An invalid argument was provided to an Authentication method.');
      case 'invalid-password':
        return const Exceptions('Incorrect password, please try again.');
      case 'invalid-phone-number':
        return const Exceptions('The provided Phone Number is invalid.');
      case 'operation-not-allowed':
        return const Exceptions(
            'The provided sign-in provider is disabled for your firebase project.');
      case 'session-cookie-expired':
        return const Exceptions(
            'The provided Firebase session cookie is expired.');
      case 'uid-already-exists':
        return const Exceptions(
            'The provided uid is already in use by an existing user.');
      default:
        return const Exceptions();
    }
  }
}
