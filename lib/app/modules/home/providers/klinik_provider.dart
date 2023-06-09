import 'package:get/get.dart';

import '../klinik_model.dart';

class KlinikProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Klinik.fromJson(map);
      if (map is List) return map.map((item) => Klinik.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Klinik?> getKlinik(int id) async {
    final response = await get('klinik/$id');
    return response.body;
  }

  Future<Response<Klinik>> postKlinik(Klinik klinik) async =>
      await post('klinik', klinik);
  Future<Response> deleteKlinik(int id) async => await delete('klinik/$id');
}
