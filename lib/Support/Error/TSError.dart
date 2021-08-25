enum TSErrorType { webservice, persistence }

class TSError extends Error {
  final TSErrorType errorType;
  final String? message;
  TSError({required this.errorType, this.message});
  String toString() {
    var message = this.message;
    return (message != null) ? "$errorType: $message" : "$errorType";
  }
}
