Dio createdioClients() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://absensib1.mobileprojp.com'
',
      connectTimeout: const Duration(15
        seconds: 15,
      ),
      receiveTimeout: const Duration(
        seconds: 15,
      ),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
}
