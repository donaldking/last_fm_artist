import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/PresentationLayer/Bloc/TSArtistBloc.dart';
import 'package:last_artist/Architecture/PresentationLayer/Widgets/TSTextFieldContainerWidget.dart';

class TSArtistSearchScreen extends StatefulWidget {
  const TSArtistSearchScreen({Key? key}) : super(key: key);

  @override
  _TSArtistSearchScreenState createState() => _TSArtistSearchScreenState();
}

class _TSArtistSearchScreenState extends State<TSArtistSearchScreen> {
  TSArtistBloc _bloc = TSArtistBloc.defaultArtistBloc();
  late TextEditingController _searchTextFieldController = TextEditingController();
  late FocusNode _searchTextFieldFocus = FocusNode();

  Future searchArtist({required String searchTerm}) async {
    _bloc.searchTermSink.add(searchTerm);
  }

  void _getArtistInfo({required TSAArtistModel artist}) {
    /// TODO: Navigate to details
    debugPrint("Get artist details: ${artist.name}");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TSTextFieldContainerWidget(
                  child: TextField(
                    controller: _searchTextFieldController,
                    style: themeData.textTheme.headline6,
                    autocorrect: false,
                    autofocus: false,
                    focusNode: _searchTextFieldFocus,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.grey,
                        size: 17,
                      ),
                      hintText: "Search artist by name",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                          width: 0.5,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (String value) {
                      _searchTextFieldFocus.unfocus();
                      searchArtist(searchTerm: value);
                    },
                  ),
                ),
              ),
            ),
            StreamBuilder<List<TSAArtistModel>>(
              stream: _bloc.artistStream,
              initialData: [],
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return _noResultWidget(context: context);
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return _resultWidget(
                      context: context,
                      result: snapshot.data ?? [],
                      onPressed: (itemSelected) {
                        _getArtistInfo(artist: itemSelected);
                      },
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _noResultWidget({required BuildContext context}) {
    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Icon(
            FontAwesomeIcons.compactDisc,
            size: 100,
            color: Colors.blueGrey,
          ),
        ),
        Container(
          child: Text(
            'No Result',
            style: TextStyle(
              color: Colors.black,
              fontSize: themeData.textTheme.headline3?.fontSize,
              fontWeight: themeData.textTheme.headline1?.fontWeight,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _resultWidget({
    required BuildContext context,
    required List<TSAArtistModel> result,
    Function(TSAArtistModel)? onPressed,
  }) {
    ThemeData themeData = Theme.of(context);
    if (result.length == 0) return _noResultWidget(context: context);
    return Positioned(
      top: 120,
      left: 0,
      right: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 20, right: 20),
          shrinkWrap: false,
          itemCount: result.length,
          itemBuilder: (context, index) {
            TSAArtistModel artist = result[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    onPressed?.call(artist);
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      artist.name ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: themeData.textTheme.bodyText1?.fontSize,
                          fontWeight: themeData.textTheme.bodyText1?.fontWeight),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Divider()
              ],
            );
          },
        ),
      ),
    );
  }
}
