import '../../repository/home/entity/response_home_entity.dart';
import '../../repository/home/home_repository.dart';

class HomeServices {
  final HomeRepository _homeRepository = HomeRepository();

  Future<ModelHomeResponseEntity?> getHomeData(int id) async {
    var resp = await _homeRepository.getInquiry(id);
    if (resp != null) {
      return resp;
    }
    return null;
  }
}
