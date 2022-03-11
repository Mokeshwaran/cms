// ignore_for_file: file_names

import 'package:cms/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String bullet = '\u2022';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read This Before Using',
            style: TextStyle(fontSize: 19.2)),
        backgroundColor: Colors.blue[700],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.add_reaction_outlined),
            label: const Text('About Me!'),
            style: TextButton.styleFrom(
              primary: Colors.orange[400],
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutMe())),
          ),
        ],
      ),
      backgroundColor: Colors.orange[400],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Welcome To CMS', style: help_textstyle_welcome),
              const SizedBox(height: 10.0),
              const Text('Instructions', style: help_textstyle_intro),
              const SizedBox(height: 10.0),
              Text(
                  bullet +
                      ' After registration or signing in you\'ll see the list of registered users and their assigned classes with Classes and Users button on the top',
                  style: help_textstyle),
              const SizedBox(height: 10.0),
              Text(
                  bullet +
                      ' If you want to see the list of users then click on Users, on Users page you will be able to Modify and Delete the user and of course deleting requires password in case your finger slipped',
                  style: help_textstyle),
              const SizedBox(height: 10.0),
              Text(
                  bullet +
                      ' If you want to access the list of classes then click on Classes on the home page, you\'ll be presented with the only option \'Add\' click on it and add a class, that\'s it.',
                  style: help_textstyle),
              const SizedBox(height: 10.0),
              Text(
                  bullet +
                      ' After creating a class, you see that you misspelled \'Science\' as \'Scince\' so you want to update it? then gently tap that class and update it!',
                  style: help_textstyle),
              const SizedBox(height: 10.0),
              Text(
                  bullet +
                      ' If you want to delete that class then swiping it left or right will do the trick, want to assign yourself to a class then long press that class and you\'ll see \'Assign To This Class\' option at the bottom',
                  style: help_textstyle),
              const SizedBox(height: 10.0),
              Text(
                  bullet +
                      ' Right, now you have yourself assigned to a class and now you want to exit from it, long press the class and you\'ll see \'Resign Me From (insertClassName) Class\' tap on it and voila you have successfully resigned... from the class atleast.',
                  style: help_textstyle),
              const SizedBox(height: 10.0),
              Text(
                  bullet +
                      ' After all those hustle you finally decide to delete your account altogether, goto Users -> Delete, tap on it enter your password and you have successfully deleted. Thank You!',
                  style: help_textstyle),
              const SizedBox(height: 10.0),
              const Text('Now you\'re fully prepared to use the app!!!',
                  style: help_textstyle),
              const SizedBox(height: 10.0),
              const Text(' P.S: \'Logout\' option is self-explanatory',
                  style: help_textstyle),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[400],
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: Colors.blue[700],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/moki.jpg'),
                  radius: 40.0,
                ),
              ),
              const SizedBox(height: 20.0),
              FittedBox(
                fit: BoxFit.contain,
                child: const Text(
                    "Hey there, I'm Mokeshwaran aka Moki.\nI'm the developer of this application,\nI made this to minimize the struggle of my faculties.",
                    style: help_textstyle_about,
                    textAlign: TextAlign.center),
              ),
              const SizedBox(height: 40.0),
              FittedBox(
                  fit: BoxFit.contain,
                  child: const Text("TO KNOW ME MORE",
                      style: help_textstyle_intro)),
              const SizedBox(height: 30.0),
              SizedBox(
                width: 325.0,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => launch(
                          'https://www.facebook.com/mokeshwaran.ramesh.7/'),
                      icon: const Icon(FontAwesomeIcons.facebookSquare),
                      color: const Color(0xff4267B2),
                      iconSize: 50.0,
                    ),
                    const SizedBox(width: 20.0),
                    IconButton(
                      onPressed: () =>
                          launch('https://www.instagram.com/mstrmnd.xiii/'),
                      icon: const Icon(FontAwesomeIcons.instagramSquare),
                      color: const Color(0xffcd486b),
                      iconSize: 50.0,
                    ),
                    const SizedBox(width: 20.0),
                    IconButton(
                      onPressed: () =>
                          launch('https://www.linkedin.com/in/mokeshwaran-r/'),
                      icon: const Icon(FontAwesomeIcons.linkedin),
                      color: const Color(0xff0e76a8),
                      iconSize: 50.0,
                    ),
                    const SizedBox(width: 20.0),
                    IconButton(
                      onPressed: () =>
                          launch('https://www.snapchat.com/add/smokeythefri13'),
                      icon: const Icon(FontAwesomeIcons.snapchatSquare),
                      color: const Color(0xffFFFC00),
                      iconSize: 50.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              SizedBox(
                width: 300.0,
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () =>
                            launch('https://github.com/Mokeshwaran'),
                        icon: const Icon(FontAwesomeIcons.github),
                        color: const Color(0xff000000),
                        iconSize: 75.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              SizedBox(
                width: 300.0,
                child: Text(
                  "Thank You For Using This App",
                  style: help_textstyle_thankyou,
                ),
              ),
              const SizedBox(height: 50.0),
              SizedBox(
                width: 300.0,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Text(
                    "With 💖 Moki",
                    style: help_textstyle_withlove,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
