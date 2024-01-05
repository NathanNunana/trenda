part of utils;

// request status
enum Status { failed, successful }

final httpProvider = Provider((ref) => HttpProvider());

class HttpProvider {
  final http = Dio(BaseOptions(
    baseUrl: "https://trenda.onrender.com",
    contentType: "application/json",
  ));

// save token
  void saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    http.options.headers['Authorization'] = 'Bearer $token';
    await prefs.setString('token', token);
  }

// remove token
  Future deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

// Error handling
  Future<Resp<dynamic>> handler({required Future Function() func}) async {
    try {
      final resp = await func.call();
      return Resp(status: Status.successful, data: resp.data);
    } catch (err) {
      if (err is DioException) {
        print('response: ${err.response}');
        if (err.response != null) {
          final resp = err.response;
          final message = resp!.data["message"];
          return Resp(status: Status.failed, data: message);
        }
      }
      rethrow;
    }
  }
}

class Resp<T> {
  final Status status;
  final T? data;
  const Resp({required this.status, this.data});

  static toNull() {
    return const Resp(status: Status.failed);
  }
}
