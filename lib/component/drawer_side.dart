import 'package:flutter/material.dart';
import 'package:grocery_app/providers/user_porvider.dart';
import 'package:grocery_app/screen/home/home_screen.dart';
import 'package:grocery_app/screen/my_profile/profile_screen.dart';
import 'package:grocery_app/screen/review_cart/review_cart.dart';
import 'package:grocery_app/screen/wish_list/wish_list_screen.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';

class DrawerSide extends StatefulWidget {
  final UserProvider userProvider;
  const DrawerSide({Key? key, required this.userProvider}) : super(key: key);

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  @override
  Widget build(BuildContext context) {
    final userData = widget.userProvider.currentUserList;
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 43,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(userData
                              .userImage.isNotEmpty
                          ? userData.userImage
                          : "https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-yellow-vegetable-and-fruit-background-main-picture-image_182664.jpg"),
                      backgroundColor: Colors.red,
                      radius: 40,
                      child: Center(
                        child: TextWidget(
                          text: userData.userImage.isNotEmpty ? "" : "Grocery",
                          color: Colors.white,
                          size: 19,
                          fontWeight: FontWeight.bold,
                          shadow: const [
                            Shadow(blurRadius: 4, offset: Offset(3, 3))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(userData.userName ?? ""),
                      Text(userData.userEmail ?? ""),
                      Container(
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
            listTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              icon: Icons.home,
              title: "Home",
            ),
            listTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReviewCart()));
                },
                icon: Icons.shop_outlined,
                title: "Review Cart"),
            listTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                                userProvider: widget.userProvider,
                              )));
                },
                icon: Icons.person_outline,
                title: "My profile"),
            listTile(
                onTap: () {},
                icon: Icons.notifications_outlined,
                title: "Notification"),
            listTile(
                onTap: () {},
                icon: Icons.star_outline,
                title: "Rating & Review"),
            listTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WishListScreen()));
                },
                icon: Icons.favorite_outline,
                title: "Wishlist"),
            listTile(
                onTap: () {},
                icon: Icons.copy_outlined,
                title: "Raise a Complaint"),
            listTile(
                onTap: () {}, icon: Icons.format_quote_outlined, title: "FAQs"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: "Contact Support"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      TextWidget(text: "Call us: "),
                      const SizedBox(
                        width: 10,
                      ),
                      TextWidget(text: "+52545214554562")
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TextWidget(text: "Mail us: "),
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget(text: "rrk@gmail.com")
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listTile(
      {required VoidCallback onTap,
      required IconData icon,
      required String title}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
