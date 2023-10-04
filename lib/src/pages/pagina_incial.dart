import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  bool temImagem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Imagens + StatefulWidget",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(86, 107, 242, 1),
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: trocaImagem,
                child: DottedBorder(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  dashPattern: const [8, 12],
                  strokeWidth: 1,
                  child: Container(
                    width: 400,
                    height: 465,
                    decoration: BoxDecoration(
                      color: temImagem
                          ? null 
                          : Colors.white,
                      image: temImagem
                          ? const DecorationImage(
                              image: AssetImage('assets/images/imagemTeste.png'), // Substitua pelo caminho da sua imagem
                              fit: BoxFit.cover,
                            )
                          : null, // Remova a imagem se não houver
                    ),
                    child: !temImagem ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.black,
                            weight: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Adicionar Imagem",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            fontFamily: "Arial",
                          ),
                        )
                      ],
                    ) : null,
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              SizedBox(
                width: 300,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    setState(() {
                      temImagem = false; // Remover a imagem ao clicar no botão de resetar
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "Resetar imagem",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        fontFamily: "Arial",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void trocaImagem() {
    setState(() {
      temImagem = !temImagem;
    });
  }
}