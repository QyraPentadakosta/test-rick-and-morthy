abstract class BaseApi {
  Future<dynamic> get(String url, {dynamic params});
  Future<dynamic> post(String url, {dynamic params});
  Future<dynamic> put(String url, {dynamic params});
  Future<dynamic> delete(String url, {dynamic params});
}
