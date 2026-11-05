class Comment {
  final String id;
  final String pitchId;
  final String authorName;
  final String authorAvatar;
  final String content;
  final String createdAt;

  const Comment({
    required this.id,
    required this.pitchId,
    required this.authorName,
    required this.authorAvatar,
    required this.content,
    required this.createdAt,
  });

  Comment copyWith({
    String? id,
    String? pitchId,
    String? authorName,
    String? authorAvatar,
    String? content,
    String? createdAt,
  }) {
    return Comment(
      id: id ?? this.id,
      pitchId: pitchId ?? this.pitchId,
      authorName: authorName ?? this.authorName,
      authorAvatar: authorAvatar ?? this.authorAvatar,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pitch_id': pitchId,
      'author_name': authorName,
      'author_avatar': authorAvatar,
      'content': content,
      'created_at': createdAt,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] as String,
      pitchId: map['pitch_id'] as String,
      authorName: map['author_name'] as String,
      authorAvatar: map['author_avatar'] as String,
      content: map['content'] as String,
      createdAt: map['created_at'] as String,
    );
  }
}
