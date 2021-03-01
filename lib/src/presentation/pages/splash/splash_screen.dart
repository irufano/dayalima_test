import 'package:dayalima_test/src/bloc/splash/splash_bloc.dart';
import 'package:dayalima_test/src/presentation/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  final dynamic data;

  SplashScreen({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: Scaffold(
        backgroundColor: Styles.backgroundColor(),
        body: BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
          if (state is SplashInitial) {
            BlocProvider.of<SplashBloc>(context).add(SetSplash());
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
                //   child: Image.asset(Assets.LOGO),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Styles.primaryColor(),
                        BlendMode.modulate,
                      ),
                      child: FlutterLogo(size: 90)),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Styles.primaryColor()),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
