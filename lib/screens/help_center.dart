import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../configs/color.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text("Need Help",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: bgColor.withOpacity(.3),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Help Center",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Card(
                    color: Color(0xFFF5F6F9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 2,
                    child: Container(
                      height: 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage("assets/image/contact_us.png"))),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Hi, how can we help?", style: TextStyle(fontSize: 18)),
              SizedBox(
                height: 4,
              ),
              GestureDetector(
                onTap:()=>
                   openWhatsApp(),
                child: card(
                    context, "Whatsapp", "Start a conservation", "assets/image/whtsapp.png"),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  String companyEmail = "asd.flutterdeveloper@gmail.com";
                  launch(
                      'mailto:$companyEmail?subject=Need Help&body= Please write your query');
                },
                child: card(context, "Email",
                    "Get solutions beamed to your inbox", "assets/image/email11.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void openWhatsApp() async {
    String phoneNumber = "03064123840";
    String message = "Please write your query";
    String url = "https://wa.me/$phoneNumber?text=${Uri.parse(message)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull(url),
      );
      await intent.launch();
    }
  }

  Widget card(context, title, subtitle, image) {
    return SizedBox(
        width: double.infinity,
        child: Card(
          color: Color(0xFFffffff).withAlpha(240),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 2,
          child: ListTile(
            leading: Image.asset(image),
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
              maxLines: 1,
            ),
          ),
        ));
  }
}
