import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:my_project/Service/activity_service.dart';
import 'package:my_project/Views/Classes/Activity.dart';
import 'package:my_project/Views/Widgets/WidgetBackgroundBox.dart';
import 'package:my_project/Views/Widgets/WidgetErrorTextSmall.dart';
import 'package:my_project/Views/Widgets/WidgetTagsBox.dart';
import 'Widgets/test.dart';
import 'Widgets/maplocationpicker.dart';
import 'detailed_activity_page.dart';
import 'package:my_project/Views/detailed_activity_page.dart';

import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetButtons.dart';

class add_activity_page extends StatefulWidget {
  const add_activity_page({super.key});

  @override
  State<add_activity_page> createState() => _add_activity_pageState();
}

class _add_activity_pageState extends State<add_activity_page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  TextEditingController activity_title = TextEditingController();
  TextEditingController activity_location = TextEditingController();
  TextEditingController activity_date = TextEditingController();
  TextEditingController activity_end_date = TextEditingController();
  TextEditingController activity_time = TextEditingController();
  TextEditingController activity_nr_participants = TextEditingController();
  TextEditingController activity_description = TextEditingController();
  String activity_category = '';
  List<String> activity_tags = [];
  String selectedAddress = '';

  List<String> categories = ['Sport', 'Gaming', 'Services', 'a', 'a', 'a', 'a'];

  bool error_tags = false;
  bool error_category = false;
  bool error_dates = false;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  void selectDate() {
    showDatePicker(
            context: context,
            builder: (context, child) => Theme(
                  data: ThemeData().copyWith(
                      colorScheme: const ColorScheme.dark(
                          primary: Color_Blue,
                          onPrimary: Color_White,
                          surface: Color_Blue,
                          onSurface: Color_Dark_Gray),
                      dialogBackgroundColor: Color_Gray),
                  child: child!,
                ),
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        startDate = pickedDate;
        activity_date.text = DateFormat("dd.MM.yyyy").format(pickedDate);
      });
    });
  }

  void selectEndDate() {
    showDatePicker(
            context: context,
            builder: (context, child) => Theme(
                  data: ThemeData().copyWith(
                      colorScheme: const ColorScheme.dark(
                          primary: Color_Blue,
                          onPrimary: Color_White,
                          surface: Color_Blue,
                          onSurface: Color_Dark_Gray),
                      dialogBackgroundColor: Color_Gray),
                  child: child!,
                ),
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        endDate = pickedDate;
        activity_end_date.text = DateFormat("dd.MM.yyyy").format(pickedDate);
      });
    });
  }

  void selectTime() {
    showTimePicker(
            context: context,
            builder: (context, child) => Theme(
                  data: ThemeData().copyWith(
                      colorScheme: const ColorScheme.dark(
                          primary: Color_Blue,
                          surface: Color_Gray,
                          onSurface: Color_Dark_Gray)),
                  child: child!,
                ),
            initialTime: TimeOfDay.now())
        .then((pickedTime) {
      if (pickedTime == null) {
        return;
      }
      setState(() {
        final now = DateTime.now();
        DateTime aux = DateTime(
            now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
        activity_time.text = DateFormat.Hm().format(aux);
      });
    });
  }

  void updateSelectedAddress(String address) {
    setState(() {
      selectedAddress = address;
    });
    print('Selected address: $selectedAddress');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  children: [Image.asset('assets/map.png'), const SizedBox()],
                ),
                WidgetBackgroundBox(
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: SingleChildScrollView(
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
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Color_Blue,
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => LocationPickerPage(
                                                  onLocationConfirmed: updateSelectedAddress,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Icon(Icons.location_on),
                                        ),
                                        Flexible(child: Text(selectedAddress, overflow: TextOverflow.ellipsis, maxLines: 3,)),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          onTap: selectDate,
                                          validator: MinLengthValidator(1,
                                              errorText: 'Required'),
                                          readOnly: true,
                                          controller: activity_date,
                                          style: Text_AddActivity_Small_Input,
                                          decoration: InputDecoration(
                                            hintText: '+Date',
                                            hintStyle: Text_AddActivty_Small,
                                            border: InputBorder.none,
                                            prefixIcon: const Icon(
                                              Icons.calendar_month_rounded,
                                              color: Color_Dark_Gray,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          onTap: selectEndDate,
                                          validator: MinLengthValidator(1,
                                              errorText: 'Required'),
                                          readOnly: true,
                                          controller: activity_end_date,
                                          style: Text_AddActivity_Small_Input,
                                          decoration: InputDecoration(
                                            hintText: '+End date',
                                            hintStyle: Text_AddActivty_Small,
                                            border: InputBorder.none,
                                            prefixIcon: const Icon(
                                              Icons.calendar_today,
                                              color: Color_Dark_Gray,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  WidgetErrorTextSmall(
                                      'End date cannot be before Start date',
                                      error_dates),
                                  TextFormField(
                                    onTap: selectTime,
                                    validator: MinLengthValidator(1,
                                        errorText: 'Required'),
                                    readOnly: true,
                                    controller: activity_time,
                                    style: Text_AddActivity_Small_Input,
                                    decoration: InputDecoration(
                                      hintText: '+Time',
                                      hintStyle: Text_AddActivty_Small,
                                      border: InputBorder.none,
                                      prefixIcon: const Icon(
                                        Icons.access_time_filled,
                                        color: Color_Dark_Gray,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: TextFormField(
                                          controller: activity_nr_participants,
                                          validator: MultiValidator([
                                            MinLengthValidator(1,
                                                errorText: 'Required'),
                                            RangeValidator(
                                                min: 2,
                                                max: 99,
                                                errorText:
                                                    'Between 2 and 99 participants')
                                          ]),
                                          keyboardType: TextInputType.number,
                                          style: Text_AddActivity_Small_Input,
                                          autocorrect: false,
                                          decoration: InputDecoration(
                                            hintText: '+Nr. participants',
                                            hintStyle: Text_AddActivty_Small,
                                            border: InputBorder.none,
                                            prefixIcon: const Icon(
                                              Icons.person_rounded,
                                              color: Color_Dark_Gray,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                    ],
                                  ),
                                  TextFormField(
                                    controller: activity_description,
                                    validator: MultiValidator([
                                      MinLengthValidator(60,
                                          errorText: 'Make description longer'),
                                    ]),
                                    maxLength: 300,
                                    maxLines: 7,
                                    autocorrect: false,
                                    style: Text_AddActivity_Small_Description,
                                    decoration: InputDecoration(
                                        hintText: '+Description',
                                        hintStyle: Text_AddActivty_Small,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            activity_description.clear();
                                          },
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Color_Blue,
                                          ),
                                        )),
                                  ),
                                  DropdownMenu(
                                    inputDecorationTheme: InputDecorationTheme(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                      ),
                                      hintStyle: Text_AddActivty_Small,
                                    ),
                                    menuStyle: MenuStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color_Gray),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    hintText: '+Category',
                                    textStyle: Text_AddActivty_Small,
                                    dropdownMenuEntries: categories
                                        .map<DropdownMenuEntry<String>>(
                                            (String value) {
                                      return DropdownMenuEntry<String>(
                                          value: value, label: value);
                                    }).toList(),
                                    onSelected: (String? value) {
                                      setState(() {
                                        activity_category = value!;
                                      });
                                    },
                                  ),
                                  WidgetErrorTextSmall(
                                      'Select a category', error_category),
                                  const SizedBox(height: 15),
                                  Tags(
                                    key: _tagStateKey,
                                    textField: TagsTextField(
                                        autofocus: false,
                                        width: 1000,
                                        hintText: '+Tags',
                                        hintTextColor: Color_Dark_Gray,
                                        inputDecoration: InputDecoration(
                                          hintStyle: Text_AddActivty_Small,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                          ),
                                        ),
                                        textStyle: Text_AddActivty_Small,
                                        onSubmitted: (String str) {
                                          setState(() {
                                            if (str.length < 3) {
                                              return;
                                            } else if (!activity_tags
                                                .contains(str)) {
                                              activity_tags.add(str);
                                            }
                                          });
                                        }),
                                  ),
                                  WidgetErrorTextSmall(
                                      'Add at least one tag', error_tags),
                                  const SizedBox(
                                    height: 11,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      alignment: WrapAlignment.start,
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: activity_tags.map((tag) {
                                        return IntrinsicWidth(
                                          child: WidgetTagsBox(Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(tag, style: Text_Tag_Widget),
                                              InkWell(
                                                onTap: () {
                                                  activity_tags.remove(tag);
                                                  setState(() {});
                                                },
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: Color_Dark_Gray,
                                                ),
                                              )
                                            ],
                                          )),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  const SizedBox(height: 200)
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        if (activity_tags.isEmpty) {
                                          error_tags = true;
                                        } else {
                                          error_tags = false;
                                        }
                                      });
                                      setState(() {
                                        if (activity_category.isEmpty) {
                                          error_category = true;
                                        } else {
                                          error_category = false;
                                        }
                                      });

                                      setState(() {
                                        if (startDate.isAfter(endDate)) {
                                          error_dates = true;
                                        } else {
                                          error_dates = false;
                                        }
                                      });

                                      if (_formKey.currentState!.validate()) {
                                        if (error_tags != true &&
                                            error_category != true && error_dates != true) {
                                          Activity activity = Activity(
                                              title: activity_title.text,
                                              author: 'Zdroba Petru',
                                              date: activity_date.text,
                                              end_date: activity_end_date.text,
                                              location: activity_location.text,
                                              number_participants: int.parse(
                                                  activity_nr_participants
                                                      .text),
                                              descrpition:
                                                  activity_description.text,
                                              author_id: 'X-Man',
                                              tags: activity_tags,
                                              category: activity_category,
                                              time: activity_time.text);

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                             SnackBar(
                                              backgroundColor: Colors.green[600],
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                              content:  const Row(
                                                children: [
                                                  Text(
                                                    'Validation Successful',
                                                    style: TextStyle(
                                                      color: Color_White,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16
                                                    ),
                                                  ),
                                                  Icon(Icons.check, color:Color_White)
                                                ],
                                              ),
                                            ),
                                          );
                                          final response =
                                              await createActivty(activity);
                                          if (response.body == 'true') {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Test()));
                                          }
                                        }
                                      }
                                    },
                                    child: WidgetButton(
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Create',
                                                style:
                                                    Text_Widget_Buttons_Blue),
                                            const Icon(
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
                                const SizedBox(
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
                ),
              ],
            ),
          )),
    );
  }
}

