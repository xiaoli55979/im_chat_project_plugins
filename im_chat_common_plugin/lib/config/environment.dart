enum Environment {
  test('', ''),
  product('', '');

  final String domain;
  final String http3Domain;

  const Environment(this.domain, this.http3Domain);
}
