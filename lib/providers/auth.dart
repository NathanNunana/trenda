part of providers;

final authProvider = ChangeNotifierProvider((ref) => AuthProvider(ref));

class AuthProvider extends ChangeNotifier {
  late Ref ref;
  late Dio http;
  late HttpProvider prov;
  AuthProvider(this.ref) {
    init();
  }

  init() {
    prov = ref.read(httpProvider);
    http = prov.http;
  }

  Future<Resp> login({email, password}) async {
    final resp = await prov.handler(
      func: () => http.post("/api/v1/auth/login", data: {
        "email": email,
        "password": password,
      }),
    );
    prov.saveToken(resp.data["token"]);
    return resp.data;
  }

  Future logout() async {
    await ref.read(httpProvider).deleteToken();
  }
}
