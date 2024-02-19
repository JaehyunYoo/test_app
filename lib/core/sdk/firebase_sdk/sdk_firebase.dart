import 'package:google_sign_in/google_sign_in.dart';

class FirebaseSDKManager {
  FirebaseSDKManager._();
  static Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? account = await GoogleSignIn().signIn();
      print(account?.serverAuthCode);
    } catch (e) {
      print(e);
    }

    // ServiceProviderModel googleUser = ServiceProviderModel(
    //   provider: SocialProvider.google.name,
    //   email: account?.email,
    //   providerId: account?.id,
    //   nickname: account?.displayName,
    // );
    // GoogleSignIn().disconnect();
    // return googleUser;
  }
}
