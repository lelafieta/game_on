import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:game_on/src/core/strings/app_strings.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CreateCompetitionPage extends StatefulWidget {
  const CreateCompetitionPage({super.key});

  @override
  State<CreateCompetitionPage> createState() => _CreateCompetitionPageState();
}

class _CreateCompetitionPageState extends State<CreateCompetitionPage> {
  int _currentStep = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _rulesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Competição'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StepProgressIndicator(
              totalSteps: 4,
              currentStep: _currentStep + 1,
              size: 8,
              padding: 6,
              selectedColor: Colors.deepPurple,
              unselectedColor: Colors.grey[300]!,
              roundedEdges: Radius.circular(10),
            ),
            const SizedBox(height: 20),
            _buildStepLabels(),
            const SizedBox(height: 30),
            Expanded(child: _buildStepContent()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentStep--;
                      });
                    },
                    child: Text('Voltasr'),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentStep < 2) {
                      setState(() {
                        _currentStep++;
                      });
                    } else {
                      _submit();
                    }
                  },
                  child: Text(_currentStep == 2 ? 'Criar' : 'Próximo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepLabels() {
    List<String> labels = [
      'Configuração',
      'Informações',
      'Informações',
      'Conclusão',
      'Conclusão'
    ];
    return Row(
      children: [
        Text(
          "Configurações",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        labels.length,
        (index) => Text(
          labels[index],
          style: TextStyle(
            color: index == _currentStep ? Colors.deepPurple : Colors.grey,
            fontWeight:
                index == _currentStep ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return stepOne();
      case 1:
        return stepTwo();
      case 2:
        return stepThree();
      case 3:
        return stepFour();
      default:
        return Container();
    }
  }

  Widget stepFour() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Localizaçãoa', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          Card(
            child: FormBuilderTextField(
              name: '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Data de Início', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 5),
              FormBuilderDateTimePicker(
                name: 'start_date',
                controller: _startDateController,
                inputType: InputType.date,
                decoration: const InputDecoration(
                  hintText: 'Selecione a data de início',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Data de Término', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 5),
              FormBuilderDateTimePicker(
                name: 'end_date',
                controller: _endDateController,
                inputType: InputType.date,
                decoration: const InputDecoration(
                  hintText: 'Selecione a data de término',
                  border: UnderlineInputBorder(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget stepThree() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Localização', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          FormBuilderTextField(
            name: '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Data de Início', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 5),
              FormBuilderDateTimePicker(
                name: 'start_date',
                controller: _startDateController,
                inputType: InputType.date,
                decoration: const InputDecoration(
                  hintText: 'Selecione a data de início',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Data de Término', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 5),
              FormBuilderDateTimePicker(
                name: 'end_date',
                controller: _endDateController,
                inputType: InputType.date,
                decoration: const InputDecoration(
                  hintText: 'Selecione a data de término',
                  border: UnderlineInputBorder(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget stepTwo() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Categoria do Torneio', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          FormBuilderDropdown<String>(
            name: 'currency',
            style: const TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              hintText: 'Selecione a moeda',
              border: UnderlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Kwanza',
                child: Text('Torneio Privado'),
              ),
              DropdownMenuItem(
                value: 'Dollar',
                child: Text('Torneio Local'),
              ),
              DropdownMenuItem(
                value: 'Euro',
                child: Text('Torneio Regional'),
              ),
              DropdownMenuItem(
                value: 'Libra',
                child: Text('Torneio Nacional'),
              ),
              DropdownMenuItem(
                value: 'Rublo',
                child: Text('Torneio Internacional'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Tipos de jogadores', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: FormBuilderRadioGroup<String>(
                  name: 'gender',
                  decoration: const InputDecoration(
                    labelText: 'Gênero',
                  ),
                  options: const [
                    FormBuilderFieldOption(
                        value: 'Masculino', child: Text('Masculino')),
                    FormBuilderFieldOption(
                        value: 'Feminino', child: Text('Feminino')),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Idade', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          FormBuilderDropdown<String>(
            name: 'category',
            style: const TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              hintText: 'Selecione a categoria',
              border: UnderlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Sub 17',
                child: Text('Sub 17'),
              ),
              DropdownMenuItem(
                value: 'Sub 18',
                child: Text('Sub 18'),
              ),
              DropdownMenuItem(
                value: 'Sub 20',
                child: Text('Sub 20'),
              ),
              DropdownMenuItem(
                value: 'Adulto',
                child: Text('Adulto'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Tipo de jogo', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          FormBuilderDropdown<String>(
            name: 'category',
            style: const TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              hintText: 'Selecione tipo de jogo',
              border: UnderlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(
                value: '1X1',
                child: Text('1X1'),
              ),
              DropdownMenuItem(
                value: '2X2',
                child: Text('2X2'),
              ),
              DropdownMenuItem(
                value: '3X3',
                child: Text('3X3'),
              ),
              DropdownMenuItem(
                value: '4X4',
                child: Text('4X4'),
              ),
              DropdownMenuItem(
                value: '5X5',
                child: Text('5X5'),
              ),
              DropdownMenuItem(
                value: '6X6',
                child: Text('6X6'),
              ),
              DropdownMenuItem(
                value: '7X7',
                child: Text('7X7'),
              ),
              DropdownMenuItem(
                value: '8X8',
                child: Text('8X8'),
              ),
              DropdownMenuItem(
                value: '9X9',
                child: Text('9X9'),
              ),
              DropdownMenuItem(
                value: '10X10',
                child: Text('10X10'),
              ),
              DropdownMenuItem(
                value: '11X11',
                child: Text('11X11'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Valor do Prêmio', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          FormBuilderTextField(
            name: '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: InputDecoration(hintText: 'Ex: 1.000.000'),
          ),
          const SizedBox(height: 16),
          const Text('Descrição do Prêmio', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          FormBuilderTextField(
            name: 'prize_description',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: InputDecoration(hintText: 'Descreva o prêmio'),
            maxLines: 5,
          ),
        ],
      ),
    );
  }

  Widget stepOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Nome da Competição', style: TextStyle(fontSize: 14)),
        FormBuilderTextField(
          controller: _nameController,
          name: '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
          decoration: InputDecoration(hintText: 'Ex: Campeonato de Verão'),
        ),
        const SizedBox(height: 16),
        const Text('Moeda', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 5),
        FormBuilderDropdown<String>(
          name: 'currency',
          style: const TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
          decoration: const InputDecoration(
            hintText: 'Selecione a moeda',
            border: UnderlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(
              value: 'Kwanza',
              child: Text('Kwanza (AOA)'),
            ),
            DropdownMenuItem(
              value: 'Dollar',
              child: Text('Dollar (USD)'),
            ),
            DropdownMenuItem(
              value: 'Euro',
              child: Text('Euro (€)'),
            ),
            DropdownMenuItem(
              value: 'Libra',
              child: Text('Libra (£)'),
            ),
            DropdownMenuItem(
              value: 'Rublo',
              child: Text('Rublo (₽)'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Taxa de registo', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 5),
        FormBuilderTextField(
          name: '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
          decoration: InputDecoration(hintText: 'Ex: 1000'),
        ),
        const SizedBox(height: 16),
        const Text('Valor do Prêmio', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 5),
        FormBuilderTextField(
          name: '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
          decoration: InputDecoration(hintText: 'Ex: 1.000.000'),
        ),
        const SizedBox(height: 16),
        const Text('Descrição do Prêmio', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 5),
        FormBuilderTextField(
          name: 'prize_description',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
          decoration: InputDecoration(hintText: 'Descreva o prêmio'),
          maxLines: 5,
        ),
      ],
    );
  }

  void _submit() {
    print('Competição criada:');
    print('Nome: ${_nameController.text}');
    print('Início: ${_startDateController.text}');
    print('Fim: ${_endDateController.text}');
    print('Regras: ${_rulesController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Competição criada com sucesso!')),
    );
  }
}
