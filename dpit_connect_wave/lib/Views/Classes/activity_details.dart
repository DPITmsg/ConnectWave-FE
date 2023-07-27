class Activity_Details {
  String activity_title = '';
  String activity_author = '';
  String activity_date = '';
  String activity_location = '';
  int activity_number_participants = 2;
  String activity_descrpition = '';

  //TO DO add tag list
  int activity_creator_completed_activities = 0;
  int activity_creator_rating = 0;

  Activity_Details(
      {required this.activity_title,
      required this.activity_author,
      required this.activity_date,
      required this.activity_location,
      required this.activity_number_participants,
      required this.activity_descrpition,
      required this.activity_creator_completed_activities,
      required this.activity_creator_rating});
}
