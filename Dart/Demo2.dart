import 'dart:html';
import 'dart:convert'; // Json 解析
main() {
  _getIpAddress();
}
_getIpAddress () {
  final url = 'https://httpbin.org/ip';
  HttpRequest.request(url).then((value) => {
    print(json.decode(value.responseText))
  }).catchError((error) => {
    print(error)
  });
}