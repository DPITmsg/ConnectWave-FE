import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:my_project/Service/friend_list_service.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/StyleText.dart';
import 'package:my_project/Views/Widgets/avatarcontainer.dart';
import 'package:my_project/Views/Widgets/cool_text_input_field.dart';
import 'package:my_project/Views/Widgets/interestsortags.dart';

import 'Classes/User.dart';
import 'Widgets/WidgetErrorTextSmall.dart';
import 'Widgets/WidgetTagsBox.dart';
import 'Widgets/loadingscreen.dart';

class EditProfilePage extends StatefulWidget {
  final User user;
  final VoidCallback Function;

  const EditProfilePage({super.key, required this.user, required this.Function});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();
  TextEditingController _interestsController = TextEditingController();
  TextEditingController _tagsController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  List<String> tags = [];
  List<String> interests = [];

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.user.name;
    _aboutController.text = widget.user.about;
    _ageController.text = widget.user.age.toString();
    tags = widget.user.tags;
    interests = widget.user.interests;
  }

  void _onBackPressed() {
    Navigator.of(context).pop();
    widget.Function();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
  }

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

  bool error_tags = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Profile Data'),
        backgroundColor: Color_Blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color_Gray,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                SizedBox(height: 8,),
                AvatarContainer(widget.user!.pfp),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(flex: 1,child: CoolTextField(Controller: _nameController, type: 'Name')),
                      SizedBox(width: 8,),
                      Expanded(flex: 1,child: CoolTextField(Controller: _ageController, type: 'Age')),
                    ],
                  ),
                ),
                CoolTextField(Controller: _aboutController, type: 'About'),
                SizedBox(height: 25),
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
                SizedBox(height: 25,),
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
                Row(
                  children: [
                    TextButton(
                        onPressed: (){
                          updateUser(widget.user.username, _nameController.text, _ageController.text, _aboutController.text, widget.user.tags, interests);
                          _onBackPressed();
                        },
                        child: Text('Submit'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
