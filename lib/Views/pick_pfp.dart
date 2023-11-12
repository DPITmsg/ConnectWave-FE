import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_project/Views/Classes/Friend.dart';
import 'package:my_project/Views/Widgets/WidgetErrorTextSmall.dart';
import 'package:my_project/Views/pick_interest.dart';

import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetBox.dart';
import 'log_in_page.dart';

class pick_pfp extends StatefulWidget {
  final String name;
  final String username;
  final int age;
  final String password;

  const pick_pfp(this.name, this.username, this.age, this.password,
      {super.key});

  @override
  State<pick_pfp> createState() => _pick_pfpState();
}

class _pick_pfpState extends State<pick_pfp> {
  final List<Friend> image_options = [
    Friend(
        name: 'Basic',
        pfp:
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
    Friend(
        name: 'Yoda',
        pfp:
            'https://i.pinimg.com/736x/b1/44/f5/b144f535fb1878b7bdc57aedc14dfc24.jpg'),
    Friend(
        name: 'Leia',
        pfp:
            'https://i.pinimg.com/736x/fc/06/6b/fc066ba487e75300f2c1d347cb238b5f.jpg'),
    Friend(
        name: 'George',
        pfp: 'https://www.dreamdachs.org/images/2019ChallengeMatch2.jpg'),
    Friend(
        name: 'DoomGuy',
        pfp:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWGdU_wuCgAGnoX3kabXUv00P6jZenPyDfLg&usqp=CAU'),
    Friend(
        name: 'Vasile',
        pfp: 'https://avatarfiles.alphacoders.com/165/165475.jpeg'),
    Friend(name: 'Fire', pfp: 'https://sm.ign.com/t/ign_me/screenshot/d/daenerys-t/daenerys-targaryen-in-season-4_ffpc.1080.jpg'),
    Friend(name: 'Snow', pfp: 'https://cdn.discordapp.com/attachments/1114841986344685649/1172999755761205368/game-of-thrones.png?ex=65625c27&is=654fe727&hm=b0ff687f9ffd701bef67fff35cbc449fb30313f4b22bcfdb91bf3d3254b66981&'),
    Friend(
        name: 'Messi',
        pfp:
            'https://www.newagebd.com/files/records/news/202212/188986_129.jpg'),
    Friend(
        name: 'Ronaldo',
        pfp:
            'https://i2-prod.mirror.co.uk/incoming/article12862479.ece/ALTERNATES/s1200c/TOPSHOT-FBL-EUR-C1-JUVENTUS-REAL-MADRID.jpg'),
    Friend(
        name: 'Varius',
        pfp:
            'https://www.worldatlas.com/upload/a4/91/91/shutterstock-1708408498.jpg'),
    Friend(name: 'Ye', pfp: 'https://i.redd.it/va7gn89d90w61.jpg'),
    Friend(
        name: 'CJ',
        pfp:
            'https://www.giantbomb.com/a/uploads/scale_medium/46/462814/3222927-6826564307-latest.jpg'),
    Friend(
        name: 'Flower',
        pfp:
            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/dff17de6-5aee-4ecd-97d3-db29faf31e2a/dfzaaqu-5450244e-5d15-49c2-b2e3-312bcc2f0542.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RmZjE3ZGU2LTVhZWUtNGVjZC05N2QzLWRiMjlmYWYzMWUyYVwvZGZ6YWFxdS01NDUwMjQ0ZS01ZDE1LTQ5YzItYjJlMy0zMTJiY2MyZjA1NDIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.SVVItyuTx631J5HfO7CGuMrh1uhE6ZRd5pgvDh1K3aI'),
    Friend(
        name: 'Xman',
        pfp:
            'https://cdns-images.dzcdn.net/images/cover/127150e11ac053ba37ef442181b48032/350x350.jpg')
  ];
  String pfp = '';
  bool error_pfp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  child: Column(
                    children: [
                      Expanded(
                        flex: 12,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Pick an image that suits you',
                                style: Text_Widget_ForYou_Normal_White,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.start,
                                    spacing: 15,
                                    runSpacing: 20,
                                    children: image_options.map((e) {
                                      bool didPick = pfp == e.pfp;
                                      return InkWell(
                                        onTap: () {
                                          if (didPick == true) {
                                            setState(() {
                                              pfp = '';
                                            });
                                          } else {
                                            setState(() {
                                              pfp = e.pfp;
                                            });
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: !didPick
                                                      ? Color_White
                                                      : Color_Blue,
                                                  width: !didPick ? 0.5 : 1.5,
                                                ),
                                              ),
                                              child: CircleAvatar(
                                                backgroundImage:
                                                    NetworkImage(e.pfp),
                                                backgroundColor:
                                                    Colors.transparent,
                                                radius: 36,
                                              ),
                                            ),
                                            AnimatedDefaultTextStyle(
                                                child: Text(
                                                  e.name,
                                                ),
                                                style: TextStyle(
                                                    color: !didPick
                                                        ? Color_White
                                                        : Color_Blue,
                                                    fontWeight: !didPick
                                                        ? FontWeight.normal
                                                        : FontWeight.bold),
                                                duration: const Duration(
                                                    milliseconds: 200))
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              WidgetErrorTextSmall('Pick a pfp!', error_pfp),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (pfp.isNotEmpty) {
                                setState(() {
                                  error_pfp = false;
                                });
                                print(pfp + 'final');
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => pick_interests(
                                        widget.name,
                                        widget.username,
                                        widget.age,
                                        widget.password,
                                        pfp)));
                              }else {
                                setState(() {
                                  error_pfp = true;
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color_Blue,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  'Next',
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
                Color_Dark_Gray,
                Color_Dark_Gray),
          )
        ],
      ),
    );
  }
}
