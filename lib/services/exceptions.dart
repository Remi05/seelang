class AlreadySignedInException implements Exception {
  @override
  String toString() {
    return "Cannot sign in, a user is already signed in.";
  }
}