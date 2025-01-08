import 'package:app_kiloit/Profile_Screen/Widget/Cable.dart';
import 'package:app_kiloit/Profile_Screen/Widget/GroupIcon.dart';
import 'package:app_kiloit/Profile_Screen/Widget/Icon_Group.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 90, left: 50, right: 50),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu91U1pA6XCQh3M65eynACLt22hooZei1M5w&s"),
                ),
                Text(
                  "Polin",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconGroup(
                      text: 'Heart rate',
                      titl: '216bpm',
                      image:
                          'https://cdn-icons-png.flaticon.com/512/6946/6946423.png',
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Cable(h: 46, w: 0.5),
                    SizedBox(
                      width: 30,
                    ),
                    IconGroup(
                      text: 'Calories',
                      titl: '729Cal',
                      image:
                          'https://cdn-icons-png.freepik.com/256/1710/1710794.png?semt=ais_hybrid',
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Cable(h: 46, w: 0.5),
                    SizedBox(
                      width: 30,
                    ),
                    IconGroup(
                      text: 'Weight',
                      titl: '116lbs',
                      image:
                          'https://cdn-icons-png.freepik.com/256/10650/10650415.png?semt=ais_hybrid',
                    ),
                  ],
                ),
                Groupicon(
                  icon: Icons.favorite_border,
                  text: 'My Saved',
                ),
                Cable(h: 0.5, w: 280),
                Groupicon(
                  icon: Icons.article,
                  text: 'Appointmnent',
                ),
                Cable(h: 0.5, w: 280),
                Groupicon(
                  icon: Icons.account_balance_wallet_outlined,
                  text: 'Bayment Mothod',
                ),
                Cable(h: 0.5, w: 280),
                Groupicon(
                  icon: Icons.sms,
                  text: 'FAQs',
                ),
                Cable(h: 0.5, w: 280),
                Groupicon(
                  icon: Icons.login,
                  text: 'LogOut',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// arrow_forward_ios
