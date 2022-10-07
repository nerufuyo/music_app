// Server Exception
class ServerException implements Exception {}

// Database Exception
class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}
