import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:invony/api_call/api_data.dart';
import 'package:invony/screens/profile.dart';

import 'package:invony/screens/utils/constants.dart';
import 'package:invony/screens/widgets/eleven_to_fifteen.dart';
import 'package:invony/screens/widgets/one_to_ten.dart';
import 'package:invony/screens/widgets/sixteen_to_twenty.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const routeName = "/homePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  bool _init = false;
  bool _isLoading = false;

  void didChangeDependencies() {
    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ApiCall>(context).getProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
    super.didChangeDependencies();
  }

  int _currentIndex = 0;

  final List<Widget> _children = [HomeWidget(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        selectedItemColor: AppConstants.primaryColor, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: " ",
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: " ",
          )
        ],
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late TabController _tabController;
  bool _init = false;
  bool _isLoading = false;

  void didChangeDependencies() {
    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ApiCall>(context).getProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.secondColor,
        title: Column(
          children: [
            Hero(
              tag: "icon",
              child: Center(
                child: Container(
                  height: 100,
                  width: 200.23,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/name.png'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Stack(
                  children: [
                    Container(
                      height: 27,
                      width: 74,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: AppConstants.primaryColor)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            size: 15,
                            color: AppConstants.primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          height: 27,
                          width: 47,
                          decoration: BoxDecoration(
                            color: AppConstants.primaryColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0)),
                          ),
                          child: Center(
                            child: Text(
                              'Empty',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                radius: 17,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                backgroundColor: AppConstants.secondColor,
                controller: _tabController,
                unselectedBackgroundColor: Colors.white,
                unselectedLabelStyle: AppConstants().kTextStyleMediumLight,
                labelStyle: TextStyle(
                    color: AppConstants.primaryColor,
                    fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    icon: _tabController.index == 0
                        ? Icon(Icons.check)
                        : Container(),
                    text: " 1 - 10 Products",
                  ),
                  Tab(
                    icon: _tabController.index == 1
                        ? Icon(Icons.check)
                        : Container(),
                    text: " 11 - 15 Products",
                  ),
                  Tab(
                    icon: _tabController.index == 2
                        ? Icon(Icons.check)
                        : Container(),
                    text: " 16 - 20 Products",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    FirstSection(),
                    SecondSection(),
                    ThirdSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
