import 'dart:convert';
import 'package:http/http.dart' as http;

void registerUser(String username, String name, String email_address, String password) async{
  final url = Uri.parse('https://88fe5ad8-5633-47d0-bfc6-f1707074179e.mock.pstmn.io/register');
  final response = await http.post(
    url,
    body:{
      username: username,
      name: name,
      email_address: email_address,
      password: password
    }
  );

  if (response.body == 'true'){
    print("Registration successfull");
  }
  else{
    print("Something went wrong!");
  }
}

void logInUser(String username, String password){
}