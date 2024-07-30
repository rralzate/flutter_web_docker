abstract class AuthDatasource {
  Future<String> login(String email, String password);
}
