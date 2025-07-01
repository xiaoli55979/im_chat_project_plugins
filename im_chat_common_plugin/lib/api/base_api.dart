enum BaseAPI {
  //App
  getIMNode('/v1/users/uid/im');

  const BaseAPI(this.path);

  final String path;
}