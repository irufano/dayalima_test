import 'package:dayalima_test/src/data/models/response/menu_detail.dart';
import 'package:dayalima_test/src/presentation/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailPage extends StatefulWidget {
  final dynamic data;

  DetailPage({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  MenuDetail selectedMenu;

  @override
  void initState() {
    selectedMenu = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height / 2.5,
          floating: false,
          pinned: true,
          backgroundColor: Styles.lightColor(),
          elevation: 0.5,
          leading: IconButton(
              icon: Icon(
                MdiIcons.arrowLeftCircle,
                color: Colors.orange[100],
                size: 32,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          iconTheme: IconThemeData(color: Styles.primaryColor()),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Container(
              child: Image.network(
                selectedMenu.img,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(30),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  selectedMenu.name.toString().toUpperCase(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    selectedMenu.desc.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    selectedMenu.desc.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    selectedMenu.desc.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    selectedMenu.desc.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    selectedMenu.desc.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
