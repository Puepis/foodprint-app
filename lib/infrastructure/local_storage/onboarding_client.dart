import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodprint/domain/core/exceptions.dart';

/// Responsible for checking if the user has launched the app / logged in 
/// previously. This is used to determine whether to display the onboarding 
/// screen and/or walkthrough overlay.
class OnboardingClient {
  final FlutterSecureStorage storage;

  OnboardingClient(this.storage);

  /// Check if the user has launched the app before
  Future<String> getAppLaunched() async {
    final launchedBefore = await storage.read(key: "onboard");
    if (launchedBefore != null) {
      return launchedBefore;
    } else {
      throw NotPreviouslyLaunchedException();
    }
  }

  /// User has launched the app  
  Future<void> markAppLaunched() async {
    await storage.write(key: "onboard", value: "launched");
  }
}
