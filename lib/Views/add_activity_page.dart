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
  TextEditingController activity_location = TextEditingController();
  TextEditingController activity_date = TextEditingController();

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
              child: Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: activity_title,
                              validator: MultiValidator([
                                MinLengthValidator(6,
                                    errorText:
                                        "Title must be at least 6 characters"),
                              ]),
                              style: Text_Title_Top,
                              maxLength: 35,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  hintText: '+Activity name',
                                  hintStyle: Text_AddActivity_Title,
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      activity_title.clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                  )),
                            ),
                            TextFormField(
                              controller: activity_location,
                              validator: MultiValidator([
                                MinLengthValidator(13,
                                    errorText: 'Include Str. and nr.'),
                              ]),
                              style: Text_AddActivity_Small_Input,
                              maxLength: 50,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  hintText: '+Adress',
                                  hintStyle: Text_AddActivty_Small,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.location_pin, color: Color_Dark_Gray,),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      activity_location.clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                  )
                              ),
                            ),
                            TextFormField(
                              controller: activity_date,
                              validator: MultiValidator([
                                MinLengthValidator(8, errorText: 'Use format dd.mm.yyyy')
                              ]),
                              style: Text_AddActivity_Small_Input,
                              maxLength: 10,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  hintText: '+Date',
                                  hintStyle: Text_AddActivty_Small,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.calendar_today, color: Color_Dark_Gray,),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      activity_date.clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.white,
                                        content: Text(
                                          'Validation Successful',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: WidgetButton(
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Create',
                                            style: Text_Widget_Buttons_Blue),
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
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: WidgetButton(
                                Center(
                                  child: Text("Invite",
                                      style: Text_Widget_Buttons_Blue),
                                ),
                                Color_Dark_Gray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      )),
    );
  }
}
