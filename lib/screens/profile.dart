import 'package:flutter/material.dart';
import 'package:invony/screens/utils/constants.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Profile',
            style: AppConstants().kTextStyleMedium.copyWith(fontSize: 18),
          ),
        ),
        backgroundColor: AppConstants.secondColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE5E5E5),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Material(
              elevation: 5,
              child: ListTile(
                title: IntrinsicHeight(
                  child: Row(
                    children: [
                      VerticalDivider(
                        thickness: 1.5,
                      ),
                      Text(
                        'Login',
                        style: AppConstants()
                            .kTextStyleMediumLight
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                leading: Icon(
                  Icons.person_outline,
                  color: AppConstants.primaryColor,
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstants.primaryColor,
                    )),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Material(
              elevation: 5,
              child: ListTile(
                title: IntrinsicHeight(
                  child: Row(
                    children: [
                      VerticalDivider(
                        thickness: 1.5,
                      ),
                      Text(
                        'Addresses',
                        style: AppConstants()
                            .kTextStyleMediumLight
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                leading: Icon(
                  Icons.location_pin,
                  color: AppConstants.primaryColor,
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstants.primaryColor,
                    )),
              ),
            ),
            Material(
              elevation: 5,
              child: ListTile(
                title: IntrinsicHeight(
                  child: Row(
                    children: [
                      VerticalDivider(
                        thickness: 1.5,
                      ),
                      Text(
                        'Support',
                        style: AppConstants()
                            .kTextStyleMediumLight
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                leading: Icon(
                  Icons.help_outline_outlined,
                  color: AppConstants.primaryColor,
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstants.primaryColor,
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Language - Langue',
                    style: AppConstants()
                        .kTextStyleMediumLight
                        .copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
            Material(
              elevation: 5,
              child: ListTile(
                title: IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        'English',
                        style: AppConstants()
                            .kTextStyleMediumLight
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstants.primaryColor,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
