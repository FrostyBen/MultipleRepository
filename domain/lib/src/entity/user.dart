class User {
  User({
    required this.avatarUrl,
    required this.id,
    required this.fullName,
    required this.description,
    required this.url,
    required this.languagesUrl,
    required this.source,
  });

  final dynamic id;
  final String? languagesUrl;
  final String? fullName;
  final String? avatarUrl;
  final String? url;
  final String? source;
  final String? description;

  factory User.fromGithub(Map<String, dynamic> json) {
    return User(
      avatarUrl: json['owner']['avatar_url'] as String?,
      id: json['id'] as int,
      fullName: json['fullName'] as String?,
      description: json['description'] as String?,
      url: json['owner']['html_url'] as String?,
      source: 'GitHub',
      languagesUrl: json['languagesUrl'] as String?,
    );
  }

  factory User.fromBitbucket(Map<String, dynamic> json) {
    return User(
        avatarUrl: json['owner']['links']['avatar']['href'] as String?,
        id: json['uuid'],
        fullName: json['owner']['display_name'] as String?,
        description: json['description'] as String?,
        url: json['owner']['links']['html']['href'] as String?,
        source: 'BitBucked',
        languagesUrl: json['language'] as String?);
  }
}
