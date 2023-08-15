import 'package:flutter/material.dart';
import 'package:my_project/Views/Widgets/WidgetBackgroundBox.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetButtons.dart';

class add_activity_page extends StatefulWidget {
  const add_activity_page({super.key});

  @override
  State<add_activity_page> createState() => _add_activity_pageState();
}

class _add_activity_pageState extends State<add_activity_page> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController activity_title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Expanded(
              child: Column(
                children: [Image.asset('assets/map.png'), SizedBox()],
              ),
            ),
            WidgetBackgroundBox(Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      color: Colors.amber,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: activity_title,
                              validator: MultiValidator([
                                MinLengthValidator(6, errorText: ""),
                              ]),
                              style: TextStyle(
                                fontSize: 26,
                                color: Color_Dark_Gray,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLength: 40,
                              autocorrect: false,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  hintText: '+Activity name',
                                  hintStyle: TextStyle(
                                    fontSize: 25,
                                    color: Color_Dark_Gray,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      activity_title.clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                  )),
                            )
                          ],
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      'Create',
                                      style: Text_Widget_Buttons_Blue
                                  ),
                                  Icon(
                                    Icons.add_circle,
                                    color: Color_Light_Blue,
                                  )
                                ],
                              ),
                            ),
                            Color_Dark_Gray,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: WidgetButton(
                            Center(
                              child: Text(
                                  "Invite",
                                  style: Text_Widget_Buttons_Blue
                              ),
                            ),
                            Color_Dark_Gray,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )),
          ],
        ),
      )),
    );
  }
}
