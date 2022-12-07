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
  final String languagesUrl;
  final String fullName;
  final String avatarUrl;
  final String url;
  final String source;
  final String description;

  String get name => fullName == '' ? 'name: unknown' : 'name: $fullName';
  String get descriptions => description == ''
      ? 'description: no description added  '
      : 'description: $description';
  String get language =>
      languagesUrl == '' ? 'language: unknown' : 'language: $languagesUrl';

  String get selfUrl => url == '' ? 'link: no lins provided' : 'link: $url';

  factory User.fromGithub(Map<String, dynamic> json) {
    return User(
      avatarUrl: json['owner']['avatar_url'] == null
          ? ''
          : json['owner']['avatar_url'] as String,
      id: json['id'] as int,
      fullName: json['name'] == null ? '' : json['name'] as String,
      description:
          json['description'] == null ? '' : json['description'] as String,
      url: json['owner']['html_url'] == null
          ? ''
          : json['owner']['html_url'] as String,
      source: 'GitHub',
      languagesUrl:
          json['languagesUrl'] == null ? '' : json['languagesUrl'] as String,
    );
  }

  factory User.fromBitbucket(Map<String, dynamic> json) {
    return User(
      avatarUrl: json['owner']['links']['avatar']['href'] == null
          ? ''
          : json['owner']['links']['avatar']['href'] as String,
      id: json['uuid'],
      fullName: json['full_name'] == null ? '' : json['full_name'] as String,
      description:
          json['description'] == null ? '' : json['description'] as String,
      url: json['owner']['links']['html']['href'] == null
          ? ''
          : json['owner']['links']['html']['href'] as String,
      source: 'BitBucked',
      languagesUrl: json['language'] == null ? '' : json['language'] as String,
    );
  }
}
