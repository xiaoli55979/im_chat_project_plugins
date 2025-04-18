enum API {
  //App

  getFriend('/v1/friend/sync'),
  searchFriend('/v1/friend/search');

  const API(this.path);

  final String path;
}
