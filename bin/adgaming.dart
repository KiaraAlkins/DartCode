import 'dart:io';
import 'dart:math';

void main() {
  print("Bem vindo ao jogo da adivinhação!");
  print("Selecione a dificuldade! 1 - Easy; 2 - Medium; 3 - Hard; Ou digite 'run' para sair");

  var input = stdin.readLineSync();

  if (input != 'run') {
    int dificuldade = int.parse(input!);

      switch (dificuldade) {
      case 1:
      int tentativas = 3;
      randomNumber();
      gameCore(tentativas, randomNumber());

    break;
    default:
    print("Comando inválido, tente novamente");
    main();
  }
  } else {
      print('GoodBye!');
  }
}

int randomNumber() {
      var random = Random();
      return random.nextInt(10);
}

void gameCore(tentativas, int secretNumber) {
  print(secretNumber);
  while (true) {

     int entrada = int.parse(stdin.readLineSync()!);
  
    if (entrada != null || entrada != String) {
      if (entrada == secretNumber) {
        print('Parabéns, você ganhou!');
        main();
      } else if (entrada > secretNumber){
              tentativas -= 1;
        print("Você errou, o número secreto é menor! Você tem $tentativas tentativas");
            if (tentativas == 0) {
            print("Game Over!");
            break; }
            gameCore(tentativas, secretNumber);
      } else if (entrada < secretNumber) {
              tentativas -= 1;
        print("Você errou, o número secreto é maior! Você tem $tentativas tentativas!");
            if (tentativas == 0) {
            print("Game Over!");
            break; }
            gameCore(tentativas, secretNumber);
      }
    } else {
      tentativas -= 1;
      print('Número inválido, tente novamente! você tem $tentativas tentativas!');
      if (tentativas == 0) {
      print("Game Over!");
      break; }
    }
  }
  main();
}