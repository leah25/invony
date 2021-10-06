import 'package:flutter/material.dart';
import 'package:invony/api_call/api_data.dart';
import 'package:invony/models/users_model.dart';
import 'package:invony/screens/splash_screen.dart';
import 'package:invony/screens/utils/constants.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isSelected = false;
  bool _init = true;
  bool _isLoading = false;

  void didChangeDependencies() {
    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ApiCall>(context).getAppUsers().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<User> userList = Provider.of<ApiCall>(context).usersList;
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk$userList');
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/blur.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Container(
              width: 203,
              height: 45,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    'Select User',
                    style: AppConstants().kTextStyleMedium,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              height: 192.0,
              width: 344.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      shrinkWrap: true,
                      itemCount: userList.length,
                      itemBuilder: (context, int i) {
                        return SizedBox(
                          height: 35.0,
                          child: ListTile(
                            title: Text(
                              userList[i].name,
                              style: AppConstants().kTextStyleMediumLight,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 16.0),
                            dense: true,
                            onTap: () {
                              setState(() {
                                userList[i].isSelected =
                                    !userList[i].isSelected;
                              });
                              Navigator.pushNamed(
                                  context, SplashScreen.routeName);
                            },
                            trailing: userList[i].isSelected
                                ? Icon(
                                    Icons.check,
                                    color: AppConstants.primaryColor,
                                  )
                                : Container(
                                    height: 10,
                                    width: 10,
                                  ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 1.0,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
