class GenericException implements Exception {
  final String reason;
  const GenericException([this.reason='An error occured']);
}
