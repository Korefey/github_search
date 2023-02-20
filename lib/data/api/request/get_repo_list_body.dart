class GetRepoListBody {
  final String search;
  final String sort;
  final String order;
  final String page;
  final String perPage;

  GetRepoListBody({
    this.search = 'q',
    this.sort = 'stars',
    this.order = 'desc',
    required this.page,
    required this.perPage,
  });

  Map<String, dynamic> toApi() {
    return {
      'q': search,
      'sort': sort,
      'order': order,
      'page': page,
      'per_page': perPage,
    };
  }
}
