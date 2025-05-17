class NoNetworkExpection implements Exception {
  String cause;
  NoNetworkExpection(this.cause);
}

class VtopErrorExpection implements Exception {
  String cause;
  VtopErrorExpection(this.cause);
}
