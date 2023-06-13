import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:i_fitness/models/forget_password_model.dart';


class ForgetPasswordApi{
  var client = http.Client();

  static Future<ForgetPasswordModel> forgetPassword (String mail_id) async{
    var baseUrl = GlobalConfiguration().get('base_url');
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET',Uri.parse('${baseUrl}RegisterApi/ForgetPassword?user_email=$mail_id'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await  request.send();
    if(response.statusCode ==200){
      var jsonString = await response.stream.bytesToString();
      return forgetPasswordModelFromJson(jsonString);
    }else{
      return forgetPasswordModelFromJson(request.body);
    }
  }
}