import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';

import 'Classes/Trending.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetBoxSlice.dart';
import 'Widgets/WidgetButtons.dart';

class trending_page extends StatelessWidget {

  final List<Trending> trending;

  const trending_page(this.trending,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('lib/Views/Styles/Backgrounds/Background_2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            child: const SizedBox(
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Color_Dark_Gray,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Text(
                            'Trending',
                            style: Text_Title_Top,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 12,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: SingleChildScrollView(
                          child: Column(
                            children: trending.map((element) {
                              return WidgetBoxSlice(element);
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: WidgetButton(
                              Center(
                                child: Text("Close to me",
                                    style: Text_Widget_Buttons_Blue),
                              ),
                              Color_Dark_Gray,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: WidgetButton(
                              Center(
                                child: Text("Explore more",
                                    style: Text_Widget_Buttons_Blue),
                              ),
                              Color_Dark_Gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
