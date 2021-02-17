import 'package:pizza_delivery/app/helpers/rest_client.dart';
import 'package:pizza_delivery/app/models/menu_model.dart';

class MenuRepository {
  final RestClient restClient;

  MenuRepository(this.restClient);

  Future<List<MenuModel>> findAll() async {
    final response = await restClient.get<List<MenuModel>>('/menu/', decoder: (resp) {
      if (resp is List) {
        return resp.map<MenuModel>((m) => MenuModel.fromMap(m)).toList();
      }
      return null;
    });
    if (response.hasError) {
      throw RestClientException('Erro ao buscar cardápio');
    }
    return response.body;
  }
}
