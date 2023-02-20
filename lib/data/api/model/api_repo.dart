class ApiRepo {
  final int id;
  final String name;
  final String owner;
  final String description;
  final String htmlUrl;
  final int watchersCount;
  final String language;

  ApiRepo.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        owner = map['owner']['login'],
        description = map['description'],
        htmlUrl = map['url'],
        watchersCount = map['watchers_count'],
        language = map['language'] ?? '';
}
