import 'package:flutter/material.dart';
import 'package:music_player/pages/tabs/albums.dart';
import 'package:music_player/pages/tabs/artests.dart';
import 'package:music_player/pages/tabs/folders.dart';
import 'package:music_player/pages/tabs/songs.dart';
import 'package:music_player/utils/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = true;
  late TabController tabController;
  TabController? _tabController;
  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mobileBackgroundColor,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: TextFormField(
            decoration: const InputDecoration(
                prefixIconColor: Colors.white,
                filled: true,
                fillColor: mobileSearchColor,
                border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RotatedBox(
                        quarterTurns: 1, child: Icon(Icons.horizontal_rule)),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.mic_none),
                    ),
                  ],
                ),
                suffixIconColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'Search songs , playlist and artists'),
            cursorRadius: const Radius.circular(50),
          ),
          leading: IconButton(
            icon: const Icon(Icons.settings_brightness_sharp),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ),
        drawer: const Drawer(
          child: Text(''),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 2.5, left: 2.5),
                          child: MaterialButton(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            onPressed: () {},
                            color: const Color.fromARGB(255, 77, 18, 87),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.favorite),
                                Text("Favourites")
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 2.5, left: 2.5),
                          child: MaterialButton(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            onPressed: () {},
                            color: const Color.fromARGB(255, 3, 53, 5),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.playlist_play),
                                Text("Playlists")
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 2.5, left: 2.5),
                          child: MaterialButton(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            onPressed: () {},
                            color: const Color.fromARGB(255, 120, 83, 8),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.recent_actors),
                                Text("Recent")
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Form(
                key: _formKey,
                child: Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TabBar(
                            controller: tabController,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(
                                child: Text("Songs"),
                              ),
                              Tab(child: Text("Artists")),
                              Tab(
                                child: Text("Albums"),
                              ),
                              Tab(child: Text("Folders"))
                            ]),
                        TabBarView(
                            controller: tabController,
                            children: [Songs(), Artists(), Albums(), Folders()])
                      ],
                    ),
                  ),
                ),
              )
            ])));
  }
}
