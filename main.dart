// Parte 1: Classe Abstrata e Sobrescrita de Métodos
abstract class Veiculo {
  String marca;
  String modelo;

  Veiculo(this.marca, this.modelo);

  void acelerar(); // Método abstrato

  void mostrarDetalhes() {
    print("Marca: $marca, Modelo: $modelo");
  }
}

class Carro extends Veiculo {
  Carro(String marca, String modelo) : super(marca, modelo);

  @override
  void acelerar() {
    print("O carro está acelerando a 100 km/h");
  }
}

class Caminhao extends Veiculo {
  Caminhao(String marca, String modelo) : super(marca, modelo);

  @override
  void acelerar() {
    print("O caminhão está acelerando a 80 km/h");
  }
}

// Parte 2: Modificadores Static e Final
class Frota {
  static int totalDeVeiculos = 0;
  static List<Veiculo> veiculos = [];

  Frota(Veiculo veiculo) {
    veiculos.add(veiculo);
    totalDeVeiculos++;
  }

  static void mostrarTotalDeVeiculos() {
    print("Total de veículos na frota: $totalDeVeiculos");
  }

  static void exibirVeiculos() {
    for (var veiculo in veiculos) {
      veiculo.mostrarDetalhes();
    }
  }
}

class Funcionario {
  String nome;
  final double salario;

  Funcionario(this.nome, this.salario);

  void exibirFuncionario() {
    print("Funcionário: $nome, Salário: R\$${salario.toStringAsFixed(2)}");
  }
}

// Parte 3: Interface
abstract class VeiculoComunicacao {
  void comunicar();
}

class CarroComunicacao implements VeiculoComunicacao {
  @override
  void comunicar() {
    print("O carro está enviando sinais de comunicação.");
  }
}

class CaminhaoComunicacao implements VeiculoComunicacao {
  @override
  void comunicar() {
    print("O caminhão está enviando sinais de comunicação.");
  }
}

// Parte 4: Integração do Sistema
class SistemaDeTransporte {
  List<Funcionario> funcionarios = [];

  void adicionarVeiculo(Veiculo veiculo) {
    Frota(veiculo);
  }

  void exibirVeiculos() {
    Frota.exibirVeiculos();
  }

  void mostrarTotalDeVeiculos() {
    Frota.mostrarTotalDeVeiculos();
  }

  void adicionarFuncionario(Funcionario funcionario) {
    funcionarios.add(funcionario);
  }

  void exibirFuncionarios() {
    for (var f in funcionarios) {
      f.exibirFuncionario();
    }
  }
}

// Testando o sistema
void main() {
  // Criando o sistema
  var sistema = SistemaDeTransporte();

  // Adicionando veículos
  var carro = Carro("Toyota", "Corolla");
  var caminhao = Caminhao("Volvo", "FH");

  sistema.adicionarVeiculo(carro);
  sistema.adicionarVeiculo(caminhao);

  // Mostrando detalhes e acelerando
  carro.mostrarDetalhes();
  carro.acelerar();

  caminhao.mostrarDetalhes();
  caminhao.acelerar();

  // Exibir veículos e total
  sistema.exibirVeiculos();
  sistema.mostrarTotalDeVeiculos();

  // Adicionando e exibindo funcionário
  var funcionario = Funcionario("João", 3500.0);
  sistema.adicionarFuncionario(funcionario);
  sistema.exibirFuncionarios();

  // Comunicação dos veículos
  var carroCom = CarroComunicacao();
  var caminhaoCom = CaminhaoComunicacao();
  carroCom.comunicar();
  caminhaoCom.comunicar();
}
