import '../entities/user_profile.dart';

abstract class ProfileRepository {
  Future<UserProfile> getUserProfile();
  Future<void> updateUserProfile(UserProfile profile);
  Future<void> toggleAvailability(bool isAvailable);
  Future<List<PortfolioItem>> getPortfolioItems();
  Future<void> addPortfolioItem(PortfolioItem item);
}
