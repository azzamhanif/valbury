import 'package:get/get.dart';

import '../rumah_sakit_model.dart';

class RumahSakitProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return RumahSakit.fromJson(map);
      if (map is List)
        return map.map((item) => RumahSakit.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<RumahSakit?> getRumahSakit(int id) async {
    final response = await get('rumahsakit/$id');
    return response.body;
  }

  Future<Response<RumahSakit>> postRumahSakit(RumahSakit rumahsakit) async =>
      await post('rumahsakit', rumahsakit);
  Future<Response> deleteRumahSakit(int id) async =>
      await delete('rumahsakit/$id');
}
