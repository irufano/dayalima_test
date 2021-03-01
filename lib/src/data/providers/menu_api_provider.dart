import 'package:dayalima_test/src/app/helpers/api_url.dart';
import 'package:dayalima_test/src/app/helpers/constants.dart';
import 'package:dayalima_test/src/data/models/response/menu.dart';
import 'package:dayalima_test/src/data/models/response/menu_detail.dart';
import 'package:dayalima_test/src/data/result.dart';
import 'package:dio/dio.dart';

class MenuApiProvider {
  final Dio dio = Dio(BaseOptions(responseType: ResponseType.json));

  Future getMenuList() async {
    print('@Api.getMenuList()');
    String endpoint = ApiUrl.MENU_URL;

    Response response = await dio.get(
      endpoint,
    );

    List<Menu> data =
        List<Menu>.from(response.data['data'].map((menu) => Menu.fromMap(menu)))
            .toList();

    print('getMenuList Success');
    return Result(
      ResultType.Success,
      'getMenuList success',
      data: data,
    );
  }

  Future getMenuDetailList(String dataUrl) async {
    print('@Api.getMenuDetailList()');
    String endpoint =  Constants.BASE_API_URL + '$dataUrl';

    Response response = await dio.get(
      endpoint,
    );

    List<MenuDetail> data = List<MenuDetail>.from(
        response.data['data'].map((menu) => MenuDetail.fromMap(menu))).toList();

    print('getMenuDetailList Success');
    return Result(
      ResultType.Success,
      'getMenuDetailList success',
      data: data,
    );
  }
}
