abstract class BaseApiService {
  Future<dynamic> getApi(
    String url,
    Map<String,String>? header,
  );
}
