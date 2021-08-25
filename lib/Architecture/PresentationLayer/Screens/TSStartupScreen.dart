import 'package:flutter/material.dart';
import 'package:last_artist/Architecture/PresentationLayer/Screens/TSArtistSearchScreen.dart';
import 'package:last_artist/Support/Navigation/TSNavigation.dart';

class TSStartupScreen extends StatefulWidget {
  const TSStartupScreen({Key? key}) : super(key: key);

  @override
  _TSStartupScreenState createState() => _TSStartupScreenState();
}

class _TSStartupScreenState extends State<TSStartupScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () => TSNavigation.replaceModal(screen: TSArtistSearchScreen(), context: context),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0XFF10102c),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Last.fm Artist',
              style: TextStyle(
                color: Colors.white,
                fontSize: themeData.textTheme.headline3?.fontSize,
                fontWeight: themeData.textTheme.headline1?.fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
