import 'package:flutter/material.dart';
import 'package:my_project/Service/friend_list_service.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/StyleText.dart';
import 'package:my_project/Views/Widgets/interactive_stars.dart';
import 'package:my_project/Views/profilepageHARDCODED.dart';

import '../Classes/User.dart';
import '../Styles/Shadows.dart';

class ContainerParticipants extends StatelessWidget {
  final String name;
  final String pfp;
  final bool IsAuthor;
  final VoidCallback Function;

  const ContainerParticipants(this.name, this.pfp, this.IsAuthor, this.Function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,0,8,10),
      child: InkWell(
        onTap: () async{
          User? user = await getUserByUsername(name);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePageHardCoded(user: user)));
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color_Blue, Color_Light_Blue]),
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Color_Dark_Gray),
            boxShadow: [Shadow_Widget_Box],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (pfp != "activity") Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              color: Color_Gray
                          ),
                          child: const Icon(Icons.person, color: Color_Blue,),
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(pfp),
                          backgroundColor: Colors.transparent,
                          radius: 30,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(name, style: Text_Widget_FriendName),
                    ),
                  ],
                ),
                if (IsAuthor) Container(child: TextButton(onPressed: (){Function();}, child: Text("Kick"),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}