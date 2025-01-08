import 'package:app_kiloit/Cating_Screen/Cating_Screen.dart';
import 'package:app_kiloit/Messengeer-Page_Screen/Widget/Cat_Messenger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Messenger extends StatelessWidget {
  const Messenger({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Add the "Emergency consult" text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: const Text(
            style: TextStyle(fontSize: 18),
            "Emergency consult with your recommended doctor",
          ),
        ),

        // Add the horizontal ListView for CatMessenger
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return const CatMessenger();
            },
          ),
        ),

        const SizedBox(height: 10),

        // Add the "All Messenger" text
        Padding(
          padding: const EdgeInsets.only(left: 19, bottom: 10),
          child: const Text(
            style: TextStyle(fontSize: 15),
            "All Messenger",
          ),
        ),

        const SizedBox(height: 20),

        // Add the list of messages
        ListView.builder(
          shrinkWrap: true, // Allow this ListView to shrink-wrap its content
          physics:
              const NeverScrollableScrollPhysics(), // Disable scrolling for this ListView
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              enableFeedback: false,
              onTap: () => Get.to(
                () => CatingScreen(),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 17, right: 17, bottom: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/37a8/5839/e3a76938e4f4575e19306a2608838924?Expires=1736121600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=pWL8RNmtA3n~~dEZiHYSkFIownCKzjzeHGSJcSKseaugxSSZxdYPwfeuLbckD~oWZF2S61JFJ~sdvLbso95ugsK3xxRquvplYG-dD0j~2p7AHDslhNgADISbJngD6L5yDretEN2Mvcnq7iTDCKoDgEVSwxwexDJYhTMdq5n4yUacHCpX8QdXWtM7xJ3FD~pZ3dwtrfDr-f81Hrigw-wX5fM~e7nbV63cwSTDf7VIr5FWglCkcDME4Y-HT3LJozlWTe1FWZ5R3h27vyGuw5Mjh88lpqleEZDj2OYMF~tQo9QX7Jh9Kesz~cFhZtdnJ7S~Zi8WkgIxJVZsrahS2XqJgg__',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mr.Pruitt",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                          ),
                          SizedBox(height: 1),
                          Text(
                            maxLines: 1,
                            "You: See you soon",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("09:00"),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
