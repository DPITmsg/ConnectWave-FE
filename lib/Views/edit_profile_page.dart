import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/StyleText.dart';
import 'package:my_project/Views/Widgets/avatarcontainer.dart';
import 'package:my_project/Views/Widgets/cool_text_input_field.dart';
import 'package:my_project/Views/Widgets/interestsortags.dart';

import 'Classes/User.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();
  TextEditingController _interestsController = TextEditingController();
  TextEditingController _tagsController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.user.name;
    _aboutController.text = widget.user.about;
    _ageController.text = widget.user.age.toString();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(centerTitle: true, title: Text('Edit Profile Data'), backgroundColor: Color_Blue,),
      body: Container(
        color: Color_Gray,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              AvatarContainer(AssetImage('assets/profilepic2.png')),
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
              SizedBox(height: 30),
              Align(alignment: Alignment.topLeft, child: Text('Your interests', style: Text_Ongoing_Activities_v2,)),
              IntOrTags(widget.user.interests),
              SizedBox(height: 30),
              Align(alignment: Alignment.topLeft, child: Text('Your tags', style: Text_Ongoing_Activities_v2,)),
              IntOrTags(widget.user.tags)
            ],
          ),
        ),
      ),
    );
  }
}
