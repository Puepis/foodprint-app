/// User doesn't have a refresh token  
class RefreshTokenNotFoundException implements Exception {}

/// Indicates that the user hasn't launched the app on this device before
class NotPreviouslyLaunchedException implements Exception {}

/// Indicates that the user hasn't finished the walkthrough
class WalkthroughUnfinishedException implements Exception {}
