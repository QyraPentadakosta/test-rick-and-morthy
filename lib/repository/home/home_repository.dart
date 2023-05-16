import 'package:rick_and_morty/core/api/api.dart';

import 'entity/response_home_entity.dart';

class HomeRepository extends Api {
  Future<ModelHomeResponseEntity?> getInquiry(int id) async {
    var resp = await get(
      "/character/$id",
    );
    if (resp != null) {
      return ModelHomeResponseEntity.fromJson(resp);
    }
    return null;
  }
}
