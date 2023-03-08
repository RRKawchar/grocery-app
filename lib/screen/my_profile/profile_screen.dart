import 'package:flutter/material.dart';
import 'package:grocery_app/component/drawer_side.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: const DrawerSide(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: TextWidget(
          text: "My Profile",
          size: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 200,
            color: primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              decoration: const BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: ListView(
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(height: 80,width: 250,padding: const EdgeInsets.only(left: 20),child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     TextWidget(text: "Riyazur Rohman Kawchar",size: 14,color: textColor,),
                                     const SizedBox(height: 10,),
                                     TextWidget(text: "riyazurrohmankawchar@gmail.com",size: 12,color: textColor,),

                                  ],
                                ),
                            const CircleAvatar(
                              radius: 15,

                              backgroundColor: primaryColor,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: scaffoldBackgroundColor,
                                child: Icon(Icons.edit,color: primaryColor,),
                              ),
                            )
                          ],
                        ),)
                      ],
                    ),
                  _listTile(icon: Icons.shop_outlined, title: "My orders"),
                  _listTile(icon: Icons.location_on_outlined, title: "My Delivery Address"),
                  _listTile(icon: Icons.person_outline, title: "Refer A Friend"),
                  _listTile(icon: Icons.file_copy_rounded, title: "Terms & Condition"),
                  _listTile(icon: Icons.policy_outlined, title: "Privacy policy"),
                  _listTile(icon: Icons.add_chart, title: "About"),
                  _listTile(icon: Icons.exit_to_app_outlined, title: "Log Out"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: scaffoldBackgroundColor,
                backgroundImage: const NetworkImage(
                    "https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-yellow-vegetable-and-fruit-background-main-picture-image_182664.jpg"),
                child: Center(
                  child: TextWidget(
                    text: "Grocery",
                    color: Colors.white,
                    size: 19,
                    fontWeight: FontWeight.bold,
                    shadow: const [Shadow(blurRadius: 4, offset: Offset(3, 3))],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _listTile({required IconData icon,required String title}){
    return Column(
      children: [
        const Divider(height: 1,),
        ListTile(
          leading: Icon(icon),
          title: TextWidget(text: title,),
          trailing: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}
