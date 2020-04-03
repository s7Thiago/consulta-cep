import 'dart:html';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  querySelector('#search').onClick.listen((event) async {
    print('Botão buscar clicado');

    String cep = (querySelector('#cep') as InputElement).value;

    print('Cep lido no campo: $cep');

    String url = 'http://viacep.com.br/ws/$cep/json/';
    http.Response response = await http.get(url);
    var body = json.decode(response.body);

    print(body);

    // Preenchendo os campos
    (querySelector('#state') as InputElement).value = body['uf'];
    (querySelector('#city') as InputElement).value = body['localidade'];
    (querySelector('#neighborhood') as InputElement).value = body['bairro'];
    (querySelector('#street') as InputElement).value = body['logradouro'];
  });
}
