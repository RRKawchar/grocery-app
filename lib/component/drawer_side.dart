import 'package:flutter/material.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color:primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 43,

                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 40,

                      ),
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Welcome Guest"),
                        Container(
                          height: 30,
                          child: OutlinedButton(
                            onPressed: (){},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),

                              ),

                            ),
                            child: const Text("Login",style: TextStyle(color: Colors.black),),
                          ),
                        )
                      ],)

                  ],
                )
            ),

            listTile(icon: Icons.home, title: "Home"),
            listTile(icon: Icons.shop_outlined, title: "Review Cart"),
            listTile(icon: Icons.person_outline, title: "My profile"),
            listTile(icon: Icons.notifications_outlined, title: "Notification"),
            listTile(icon: Icons.star_outline, title: "Rating & Review"),
            listTile(icon: Icons.favorite_outline, title: "Wishlist"),
            listTile(icon: Icons.copy_outlined, title: "Raise a Complaint"),
            listTile(icon: Icons.format_quote_outlined, title: "FAQs"),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height:300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: "Contact Support"),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      TextWidget(text: "Call us: "),
                      const SizedBox(width: 10,),
                      TextWidget(text: "+52545214554562")
                    ],
                  ),
                  const SizedBox(width: 5,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TextWidget(text: "Mail us: "),
                        const SizedBox(width: 10,),
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
  Widget listTile({required IconData icon,required String title}){
    return ListTile(
      leading:Icon(icon),
      title: Text(title),
    );
  }
}
