import '../entities/video_pitch.dart';
import '../entities/comment.dart';

abstract class MarketplaceRepository {
  Future<List<VideoPitch>> getVideoPitches();
  Future<void> toggleLike(String pitchId);
  Future<void> toggleBookmark(String pitchId);
  Future<void> addVideoPitch(VideoPitch pitch);
  Future<List<Comment>> getComments(String pitchId);
  Future<void> addComment(Comment comment);
  Future<List<VideoPitch>> searchPitches({
    String? query,
    String? category,
    double? maxRadiusKm,
    double? userLat,
    double? userLng,
    double? maxHourlyRate,
  });
}
