enum FailureType { client, server }

class MainFailures {
  final FailureType failureType;

  MainFailures({required this.failureType});
}
