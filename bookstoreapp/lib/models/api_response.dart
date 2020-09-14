class APIResponse<T> {
  T data;
  bool error;
  String errormessage;

  APIResponse({this.data, this.error, this.errormessage});
}
