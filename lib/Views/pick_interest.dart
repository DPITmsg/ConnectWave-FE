import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_project/Views/Widgets/WidgetBox.dart';

import '../Service/autentication_service.dart';
import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetErrorTextSmall.dart';
import 'Widgets/WidgetTagsBox.dart';
import 'log_in_page.dart';

class pick_interests extends StatefulWidget {
  final String name;
  final String username;
  final int age;
  final String password;

  const pick_interests(this.name, this.username, this.age, this.password,
      {super.key});

  @override
  State<pick_interests> createState() => _pick_interestsState();
}

class _pick_interestsState extends State<pick_interests> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  List<String> tags = [];
  TextEditingController description = TextEditingController();

  List<String> categories = [
    'Sports',
    'Cooking',
    'Social',
    'Gaming',
    'School/Work',
    'Services',
    'Movies',
    'Books',
    'Volunteering',
    'Business',
    'Political',
    'Other'
  ];

  List<String> interests = [''];
  bool didInterests = false;
  bool error_tags = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'lib/Views/Styles/Backgrounds/Background_4.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 135, 25, 135),
              child: WidgetBox(
                  SizedBox(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 12,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: description,
                                    validator: MultiValidator([
                                      MinLengthValidator(20,
                                          errorText: 'Make about you longer'),
                                    ]),
                                    maxLength: 300,
                                    maxLines: 7,
                                    autocorrect: false,
                                    style:
                                        Text_AddActivity_Small_Description_White,
                                    decoration: InputDecoration(
                                        hintText: '+About you',
                                        hintStyle: Text_AddActivty_Small_White,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            description.clear();
                                          },
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Color_Blue,
                                          ),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Tags(
                                    key: _tagStateKey,
                                    textField: TagsTextField(
                                        autofocus: false,
                                        width: 1000,
                                        hintText: '+Tags',
                                        hintTextColor: Color_White,
                                        textStyle:
                                            Text_Widget_ForYou_Normal_White,
                                        inputDecoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color_White, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(35),
                                          ),
                                        ),
                                        onSubmitted: (String str) {
                                          setState(() {
                                            if (str.length < 3) {
                                              return;
                                            } else if (!tags.contains(str)) {
                                              tags.add(str);
                                            }
                                          });
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.start,
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: tags.map((tag) {
                                      return IntrinsicWidth(
                                        child: WidgetTagsBox(
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(tag,
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              InkWell(
                                                onTap: () {
                                                  tags.remove(tag);
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color_Dark_Gray,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  WidgetErrorTextSmall(
                                      'Add at least 1 tag!',
                                      error_tags ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Pick out some interests!',
                                    style: Text_AddActivty_Small_White,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.start,
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: categories.map((e) {
                                      bool didPress = interests.contains(e);
                                      return InkWell(
                                        onTap: () {
                                          if (didPress) {
                                            interests
                                                .remove(e); // Deselect the item
                                          } else {
                                            interests.add(e); // Select the item
                                          }
                                          setState(() {}); // Update the UI
                                        },
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          decoration: BoxDecoration(
                                            color: didPress
                                                ? Color_Dark_Gray
                                                : Color_Blue,
                                            border: Border.all(color: Color_Blue, width: 1),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                                topRight: Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10)),
                                          ),
                                          child: Padding(
                                            padding: !didPress ?const EdgeInsets.all(8.0): const EdgeInsets.all(10.0),
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                color: !didPress
                                                    ? Color_Dark_Gray
                                                    : Color_Blue,
                                                fontSize: 15,
                                                fontWeight: !didPress
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  WidgetErrorTextSmall(
                                      'Add at least 3 interests',
                                      didInterests ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  if(interests.length == 3)
                                    {
                                      setState(() {
                                        didInterests = false;
                                      });
                                    }
                                  else if (interests.length < 3) {
                                    // If less than 3 interests are selected, set the error flag
                                    setState(() {
                                      didInterests = true;
                                    });
                                  } else {
                                    // If 3 or more interests are selected, clear the error flag
                                    setState(() {
                                      didInterests = false;
                                    });
                                  }
                                  setState(() {
                                    if (tags.isEmpty) {
                                      error_tags = true;
                                    } else {
                                      error_tags = false;
                                    }
                                  });
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if (_formKey.currentState!.validate()) {
                                    registerUser(
                                        widget.name,
                                        widget.username,
                                        widget.age,
                                        widget.password,
                                        tags,
                                        interests,
                                        description.text);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.green[600],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        content: const Row(
                                          children: [
                                            Text(
                                              'Registration complete!',
                                              style: TextStyle(
                                                  color: Color_White,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Icon(Icons.check,
                                                color: Color_White)
                                          ],
                                        ),
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const log_in_page()));
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color_Blue,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Register now!',
                                      style: Text_Widget_Buttons_Black,
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const log_in_page()));
                            },
                            child: Center(
                              child: Text('I already have an account',
                                  style: Text_Sign_In_Small_Blue),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Color_Dark_Gray,
                  Color_Dark_Gray),
            )
          ],
        ),
      ),
    );
  }
}
