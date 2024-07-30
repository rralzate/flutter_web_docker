//
import '../../../../core/utils/share_preferences_actions.dart';
import 'auth_storage_repository.dart';

const _userCredentialsStorageKey = "user_credentials";
// const _userHeadquarterPreferencesKey = "user_headquarter";

class AuthStorageRepositoryImpl extends AuthStorageRepository {
  @override
  Future<String> getSecureUserInfoStorage() async {
    String storage = await SharePreferencesAction.getActionFromSecureStorage(
        key: _userCredentialsStorageKey);

    return storage;
  }

  @override
  Future<String> setSecureUserInfoStorage({required String token}) async {
    await SharePreferencesAction.setActionFromSecureStorage(
      key: _userCredentialsStorageKey,
      value: token,
    );
    return token;
  }

  @override
  Future<bool> deleteSecurityStorageUserInfo() async {
    bool response = false;

    await SharePreferencesAction.deleteActionFromSecureStorage(
        key: _userCredentialsStorageKey);
    response = true;
    return response;
  }
}
