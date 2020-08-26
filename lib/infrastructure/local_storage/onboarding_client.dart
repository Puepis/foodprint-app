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

  /// Check if walkthrough has been completed
  Future<String> checkWalkthroughFinished(String username) async {
    final finished = await storage.read(key: "${username}_walkthrough");
    if (finished != null) return finished;
    throw WalkthroughUnfinishedException();
  }

  /// User has finished the walkthrough
  Future<void> markWalkthroughFinished(String username) async {
    await storage.write(key: "${username}_walkthrough", value: "finished");
  }

  // Reset the user's walkthrough status
  Future<void> resetWalkthroughStatus(String username) async {
    await storage.delete(key: "${username}_walkthrough");
  }

  /// Called when the user switches their username
  Future<void> transferWalkthroughStatus(
      String username, String newUsername) async {
    final status = await storage.read(key: "${username}_walkthrough");
    if (status != null) {
      await storage.write(key: "${newUsername}_walkthrough", value: status);
    }
    await storage.delete(key: "${username}_walkthrough");
  }
}
