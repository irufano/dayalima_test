import 'package:dayalima_test/src/app/helpers/routes.dart';
import 'package:dayalima_test/src/app/services/dialog_service.dart';
import 'package:dayalima_test/src/app/services/locator_service.dart';
import 'package:dayalima_test/src/app/services/navigation_service.dart';
import 'package:dayalima_test/src/app/utils/utility.dart';
import 'package:dayalima_test/src/bloc/menu_detail/menu_detail_bloc.dart';
import 'package:dayalima_test/src/data/models/response/menu.dart';
import 'package:dayalima_test/src/data/repositories/menu_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuDetailPage extends StatefulWidget {
  final dynamic data;

  MenuDetailPage({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  _MenuDetailPageState createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  final navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();

  Menu selectedMenu;

  @override
  void initState() {
    selectedMenu = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utility.dismissKeyboard(context);
      },
      child: BlocProvider(
        create: (context) => MenuDetailBloc(MenuRepository()),
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
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedMenu.name.toString().toUpperCase(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            BlocBuilder<MenuDetailBloc, MenuDetailState>(
                              builder: (context, state) {
                                return IconButton(
                                  icon: Icon(Icons.refresh, color: Colors.grey),
                                  onPressed: () {
                                    BlocProvider.of<MenuDetailBloc>(context)
                                        .add(Refresh(selectedMenu.listData));
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
                          'Select to view ${selectedMenu.name} detail',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: BlocBuilder<MenuDetailBloc, MenuDetailState>(
                            builder: (context, state) {
                          if (state is MenuDetailInitial) {
                            BlocProvider.of<MenuDetailBloc>(context)
                                .add(GetMenuDetails(selectedMenu.listData));
                          }
                          return _createMenuList(state);
                        }),
                      )
                    ],
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }

  Widget _createMenuList(MenuDetailState state) {
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
                Routes.DETAIL_PAGE,
                arguments: state.menuDetails[index],
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
                          state.menuDetails[index].name.toString().toUpperCase(),
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
                        image: new NetworkImage(
                          state.menuDetails[index].img,
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
