import 'package:dayalima_test/src/app/helpers/routes.dart';
import 'package:dayalima_test/src/app/services/dialog_service.dart';
import 'package:dayalima_test/src/app/services/locator_service.dart';
import 'package:dayalima_test/src/app/services/navigation_service.dart';
import 'package:dayalima_test/src/app/utils/utility.dart';
import 'package:dayalima_test/src/bloc/menu/menu_bloc.dart';
import 'package:dayalima_test/src/data/repositories/menu_repository.dart';
import 'package:dayalima_test/src/presentation/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuPage extends StatefulWidget {
  final dynamic data;

  MenuPage({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utility.dismissKeyboard(context);
      },
      child: BlocProvider(
        create: (context) => MenuBloc(MenuRepository()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Menu',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            BlocBuilder<MenuBloc, MenuState>(
                              builder: (context, state) {
                                return IconButton(
                                  icon: Icon(Icons.refresh, color: Colors.grey),
                                  onPressed: () {
                                    BlocProvider.of<MenuBloc>(context)
                                        .add(Refresh());
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Please Select Entity',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: BlocBuilder<MenuBloc, MenuState>(
                            builder: (context, state) {
                          if (state is MenuInitial) {
                            BlocProvider.of<MenuBloc>(context).add(GetMenus());
                          }
                          return _createMenuList(state);
                        }),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  color: Styles.lightColor(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'v1.0.0',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _createMenuList(MenuState state) {
    if (state is Loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is Error) {
      return Center(
        child: Text(
          state.error.toString(),
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
      );
    } else if (state is MenuLoaded) {
      return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        shrinkWrap: true,
        itemCount: 3,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              navigationService.navigateTo(
                Routes.MENU_DETAIL_PAGE,
                arguments: state.menus[index],
              );
            },
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: (index % 2 == 0)
                        ? Colors.orange[100]
                        : Colors.lightBlue[100],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 6.0,
                        offset: Offset.zero,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          state.menus[index].name.toString().toUpperCase(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            (index % 2 == 0)
                                ? Colors.orange[100]
                                : Colors.lightBlue[100],
                            BlendMode.multiply),
                        image: new NetworkImage(
                          state.menus[index].img,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Container();
  }
}
