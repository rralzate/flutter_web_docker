import '../../../../core/network/server_api_client.dart';
import '../../../../core/network/server_api_constants.dart';
import '../../../../core/network/server_info.dart';
import 'auth_datasource.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final ServerApiClient apiClient;

  AuthDatasourceImpl({
    required this.apiClient,
  });
  //*login management
  @override
  Future<String> login(String email, String password) async {
    final result = await apiClient.post(
      serverAuthorityApiFecuritySec,
      ServerApiConstants.postLoginEndpoint,
      serverSchema,
      body: {
        "NombreUsuario": email,
        "Contrasena": password,
      },
    );
    return result.body;
  }
}
