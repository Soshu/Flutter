// All response models should extend this class

abstract class ResponseObject {
  fromJson(Map<String, dynamic> json);
}

abstract class ResponseObjectList {
  fromJson(List jsonList);
}

/*
 * An instance of this class is returned from all webservice calls
 */
class NetworkResponse<T> {
  int httpStatusCode;
  final T responseObject;
  NetworkResponse({this.responseObject}) {
    httpStatusCode = -1;
  }
}
