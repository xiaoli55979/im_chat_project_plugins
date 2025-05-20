enum API {
  //App

  getFriend('/v1/friend/sync'),
  searchFriend('/v1/friend/search'),
  getContacts('/v1/user/maillist');

  const API(this.path);

  final String path;
}
