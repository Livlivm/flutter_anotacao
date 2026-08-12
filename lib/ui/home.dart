import '../root/file.dart';

import '../models/anotacao.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Anotacao> anotacoes = [];
  String texto = "";
  String pesquisa = "";

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    List<String> linhas = (await GerenciarArquivo.abrir()).split("\n");
    setState(() {
      anotacoes = linhas.map((linha) => Anotacao.fromCSV(linha)).toList();
    });
  }

  void salvarDados() async {
    String conteudo = anotacoes.map((a) => a.toCSV()).join("\n");
    GerenciarArquivo.salvar(conteudo);
  }

  @override
  Widget build(BuildContext context) {
    List<Anotacao> anotacoesFiltradas = anotacoes.where((anotacao) {
      return anotacao.texto.toLowerCase().contains(pesquisa.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: pesquisa.isEmpty
            ? Text("Anotações")
            : TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: "Pesquisar anotação"),
                onChanged: (value) {
                  setState(() {
                    pesquisa = value;
                  });
                },
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                pesquisa = pesquisa.isEmpty ? " " : "";
              });
            },
            icon: Icon(pesquisa.isEmpty ? Icons.search : Icons.close),
          ),
          GestureDetector(
            onTap: () {
              cadastrar();
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(Icons.add, size: 40, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (context, i) => ListTile(
            title: Text(anotacoesFiltradas[i].data),
            subtitle: Text(anotacoesFiltradas[i].texto),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => editar(anotacoes.indexOf(anotacoesFiltradas[i])),
                  child: Icon(Icons.edit),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () =>
                      excluir(anotacoes.indexOf(anotacoesFiltradas[i])),
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          ),
          separatorBuilder: (_, _) => Divider(),
          itemCount: anotacoesFiltradas.length,
        ),
      ),
    );
  }

  void cadastrar() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Nova anotação'),
        content: TextField(
          decoration: InputDecoration(hintText: "Digite sua anotação"),
          onChanged: (value) => setState(() {
            texto = value;
          }),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              String data = DateTime.now().toString().substring(0, 16);

              setState(() {
                anotacoes.add(Anotacao(data: data, texto: texto));
              });

              salvarDados();
            },
            child: Text("Cadastrar"),
          ),
        ],
      ),
    );
  }

  void editar(int indice) {
    texto = anotacoes[indice].texto;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Editar anotação'),
        content: TextField(
          controller: TextEditingController(text: anotacoes[indice].texto),
          onChanged: (value) {
            texto = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();

              setState(() {
                anotacoes[indice].texto = texto;
              });

              salvarDados();
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }

  void excluir(int indice) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Excluir anotação'),
        content: Text('Confirma a exclusão desta anotação'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                anotacoes.removeAt(indice);
              });
              salvarDados();
            },
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }
}
