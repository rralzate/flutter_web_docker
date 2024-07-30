import '../../main/environment.dart';

/// Constant type authorization to the header
const String authHeaderKey = 'Authorization';

/// Constant to verify server schema
String serverSchema = env['protocol'];

//const String serverAuthority = ""; // Prod URL enviroment
String serverAuthorityApiFecuritySec =
    env['serviceUrlApiFecuritySec'] ?? ''; // Development URL enviroment

String serverAuthorityApiFecurity = env['serviceUrlApiFecurity'] ?? '';

String serverAuthorityApiMovies = env['serviceUrlApiMovies'] ?? '';

String serverAuthorityUrlBlobStorage = env['urlBlob'] ?? '';

String blobStorageConnection = env['blobConection'] ?? '';

String secretKeyOfEncrip = env['secretKey'] ?? '';

///secret key of encript

String initializationVectorOfEncrip = env['initializationVector'] ?? '';

///initialization Vector of encript
