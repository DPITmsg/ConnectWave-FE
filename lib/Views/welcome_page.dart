import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/log_in_page.dart';
import 'package:my_project/Views/sign_up_page.dart';

import 'Styles/StyleText.dart';
import 'Widgets/WidgetButtons.dart';

class welcome_page extends StatelessWidget {
  const welcome_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('lib/Views/Styles/Backgrounds/Background_4.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Connect', style: Text_Welcome_Big_Black),
                      Text('Wave', style: Text_Welcome_Big_Blue),
                    ],
                  ),
                  Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Welcome to the future of ',
                              style: Text_Welcome_Medium_Black,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'socializing',
                                    style:
                                    TextStyle(
                                      color: Color_Blue,
                                    )
                                ),
                                TextSpan(text: ' and making friends'),
                              ],
                            ),
                          )
                        ],
                      )),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const log_in_page()));
                            },
                            child: WidgetButton(
                              Center(
                                child: Text("Log in",
                                    style: Text_Widget_Buttons_Blue),
                              ),
                              Color_Dark_Gray,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const sign_in_page()));
                            },
                            child: WidgetButton(
                              Center(
                                child: Text("Sign up",
                                    style: Text_Widget_Buttons_Blue),
                              ),
                              Color_Dark_Gray,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
