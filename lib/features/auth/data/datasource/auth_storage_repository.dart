abstract class AuthStorageRepository {
  Future<String> getSecureUserInfoStorage();
  Future<String> setSecureUserInfoStorage({required String token});

  Future<bool> deleteSecurityStorageUserInfo();
}
