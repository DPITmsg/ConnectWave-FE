import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/StyleText.dart';
import 'package:my_project/Views/Widgets/WidgetBox.dart';
import 'package:my_project/Views/pick_interest.dart';
import 'package:my_project/Views/pick_pfp.dart';
import '../Service/autentication_service.dart';
import 'log_in_page.dart';

class sign_in_page extends StatefulWidget {
  const sign_in_page({super.key});

  @override
  State<sign_in_page> createState() => _sign_in_pageState();
}

class _sign_in_pageState extends State<sign_in_page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController user_name = TextEditingController();
  TextEditingController user_username = TextEditingController();
  TextEditingController user_age = TextEditingController();
  TextEditingController user_password = TextEditingController();
  TextEditingController user_new_password = TextEditingController();

  bool showPassword = true;
  bool showRePassword = true;

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
              padding: const EdgeInsets.fromLTRB(50, 170, 50, 210),
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
                                children: [
                                  TextFormField(
                                    controller: user_name,
                                    validator: MultiValidator([
                                      MinLengthValidator(5,
                                          errorText: 'Name too short'),
                                      MaxLengthValidator(30,
                                          errorText: 'Name too long')
                                    ]),
                                    style: Text_Input_SignIn_Login_White,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                        hintText: 'Name',
                                        hintStyle: Text_Hint_SignIn_Login_Blue,
                                        border: InputBorder.none,
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Color_Light_Blue,
                                        )),
                                  ),
                                  TextFormField(
                                    controller: user_username,
                                    validator: (usernameInput) {
                                      if (usernameInput!.isEmpty) {
                                        return 'Required field';
                                      } else if (usernameInput.contains(' ')) {
                                        return 'Username cannot contain spaces';
                                      } else if(usernameInput.length < 6){
                                        return 'Username too short';
                                      }else if(usernameInput.length > 20){
                                        return 'Username too long';
                                      }
                                      return null;
                                    },
                                    style: Text_Input_SignIn_Login_White,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                        hintText: 'Username',
                                        hintStyle: Text_Hint_SignIn_Login_Blue,
                                        border: InputBorder.none,
                                        prefixIcon: const Icon(
                                          Icons.supervised_user_circle,
                                          color: Color_Light_Blue,
                                        )),
                                  ),
                                  TextFormField(
                                    controller: user_age,
                                    style: Text_Input_SignIn_Login_White,
                                    keyboardType: TextInputType.number,
                                    validator: ((value){
                                      if (value!.isEmpty){
                                        return 'Required field';
                                      }else if(int.parse(value) < 13){
                                        return 'See you in ${13-int.parse(value)} years';
                                      }else if(int.parse(value)> 106)
                                        return 'You are not ${int.parse(value)} years old';
                                      return null;
                                    }
                                    ),
                                    decoration: InputDecoration(
                                        hintText: 'Age',
                                        hintStyle: Text_Hint_SignIn_Login_Blue,
                                        border: InputBorder.none,
                                        prefixIcon: const Icon(
                                          Icons.calendar_today,
                                          color: Color_Light_Blue,
                                        )),
                                  ),
                                  TextFormField(
                                    controller: user_password,
                                    obscureText: showPassword,
                                    validator: (password){
                                      if(password!.isEmpty){
                                        return 'Required field';
                                      }else if(password.length < 8 ){
                                        return 'Password too short';
                                      }else if(password.length > 20){
                                        return 'Password too long';
                                      }else if(!password.contains(RegExp(r'[A-Z]'))){
                                        return 'Password must have a capital letter';
                                      }else if(!password.contains(RegExp(r'[0-9]'))){
                                        return 'Password must contain a number';
                                      }else if(!password.contains(RegExp(r'[a-z]'))){
                                        return 'Password must contain a lowercase letter';
                                      }//password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
                                      return null;
                                    },
                                    style: Text_Input_SignIn_Login_White,
                                    autocorrect: false,
                                    enableInteractiveSelection: false,
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: Text_Hint_SignIn_Login_Blue,
                                        border: InputBorder.none,
                                        prefixIcon: const Icon(
                                          Icons.type_specimen,
                                          color: Color_Light_Blue,
                                        ),
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            showPassword = !showPassword;
                                          });
                                        },
                                        icon: showPassword ? const Icon(Icons.visibility, color: Color_Light_Blue,): const Icon(Icons.visibility_off, color: Color_Blue,),
                                      ),
                                    ),
                                  ),

                                  TextFormField(
                                    controller: user_new_password,
                                    obscureText: showRePassword,
                                    validator: (password){
                                      if(password!.isEmpty){
                                        return 'Required field';
                                      }else if(password != user_password.text){
                                        return 'Passwords do no match';
                                      }
                                      return null;
                                    },
                                    style: Text_Input_SignIn_Login_White,
                                    autocorrect: false,
                                    enableInteractiveSelection: false,
                                    decoration: InputDecoration(
                                      hintText: 'Retype password',
                                      hintStyle: Text_Hint_SignIn_Login_Blue,
                                      border: InputBorder.none,
                                      prefixIcon: const Icon(
                                        Icons.type_specimen_outlined,
                                        color: Color_Light_Blue,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            showRePassword = !showRePassword;
                                          });
                                        },
                                        icon: showRePassword ? const Icon(Icons.visibility, color: Color_Light_Blue,): const Icon(Icons.visibility_off, color: Color_Blue,),
                                      ),
                                    ),
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
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  pick_pfp(user_name.text, user_username.text, int.parse(user_age.text), user_new_password.text)));
                                  }
                                   
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color_Blue,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const log_in_page()));
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
