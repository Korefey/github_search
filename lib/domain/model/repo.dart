class Repo {
  final int id;
  final String name;
  final String owner;
  final String description;
  final String htmlUrl;
  final int watchersCount;
  final String language;

  Repo({
    required this.id,
    required this.name,
    required this.owner,
    required this.description,
    required this.htmlUrl,
    required this.watchersCount,
    required this.language,
  });

  Repo.empty(
    this.id,
    this.name,
    this.owner,
    this.description,
    this.htmlUrl,
    this.watchersCount,
    this.language,
  );

  @override
  bool operator ==(Object other) => identical(this, other) || other is Repo && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
