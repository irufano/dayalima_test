import 'package:dayalima_test/src/data/providers/menu_api_provider.dart';

class MenuRepository {
  final _menuApiProvider = MenuApiProvider();

  Future fetchMenu() async => _menuApiProvider.getMenuList();
  Future fetchMenuDetail(String data) async =>
      _menuApiProvider.getMenuDetailList(data);
}
