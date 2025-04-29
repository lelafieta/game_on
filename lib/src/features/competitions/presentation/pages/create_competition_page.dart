// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:game_on/src/core/strings/app_strings.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';

// class CreateCompetitionPage extends StatefulWidget {
//   const CreateCompetitionPage({super.key});

//   @override
//   State<CreateCompetitionPage> createState() => _CreateCompetitionPageState();
// }

// class _CreateCompetitionPageState extends State<CreateCompetitionPage> {
//   int _currentStep = 0;

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _startDateController = TextEditingController();
//   final TextEditingController _endDateController = TextEditingController();
//   final TextEditingController _rulesController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Criar Competição'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             StepProgressIndicator(
//               totalSteps: 5,
//               currentStep: _currentStep + 1,
//               size: 8,
//               padding: 6,
//               selectedColor: Colors.deepPurple,
//               unselectedColor: Colors.grey[300]!,
//               roundedEdges: Radius.circular(10),
//             ),
//             const SizedBox(height: 20),
//             _buildStepLabels(),
//             const SizedBox(height: 30),
//             Expanded(child: _buildStepContent()),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 if (_currentStep > 0)
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           _currentStep--;
//                         });
//                       },
//                       child: Text('Voltar'),
//                     ),
//                   ),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_currentStep < 4) {
//                         setState(() {
//                           _currentStep++;
//                         });
//                       } else {
//                         _submit();
//                       }
//                     },
//                     child: Text(_currentStep == 2 ? 'Criar' : 'Próximo'),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStepLabels() {
//     List<String> labels = [
//       'Configuração',
//       'Informações',
//       'Informações',
//       'Regulamentos',
//       'Conclusão'
//     ];
//     return Row(
//       children: [
//         Text(
//           labels[_currentStep],
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//       ],
//     );
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: List.generate(
//         labels.length,
//         (index) => Text(
//           labels[index],
//           style: TextStyle(
//             color: index == _currentStep ? Colors.deepPurple : Colors.grey,
//             fontWeight:
//                 index == _currentStep ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildStepContent() {
//     switch (_currentStep) {
//       case 0:
//         return stepOne();
//       case 1:
//         return stepTwo();
//       case 2:
//         return stepThree();
//       case 3:
//         return stepFour();
//       case 4:
//         return stepFive();
//       default:
//         return Container();
//     }
//   }

//   Widget stepFour() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Localizaçãoa', style: TextStyle(fontSize: 14)),
//           const SizedBox(height: 5),
//           Card(
//             child: FormBuilderTextField(
//               name: '',
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Data de Início', style: TextStyle(fontSize: 14)),
//               const SizedBox(height: 5),
//               FormBuilderDateTimePicker(
//                 name: 'start_date',
//                 controller: _startDateController,
//                 inputType: InputType.date,
//                 decoration: const InputDecoration(
//                   hintText: 'Selecione a data de início',
//                   border: UnderlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text('Data de Término', style: TextStyle(fontSize: 14)),
//               const SizedBox(height: 5),
//               FormBuilderDateTimePicker(
//                 name: 'end_date',
//                 controller: _endDateController,
//                 inputType: InputType.date,
//                 decoration: const InputDecoration(
//                   hintText: 'Selecione a data de término',
//                   border: UnderlineInputBorder(),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget stepThree() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Localização', style: TextStyle(fontSize: 14)),
//           const SizedBox(height: 5),
//           FormBuilderTextField(
//             name: '',
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Data de Início', style: TextStyle(fontSize: 14)),
//               const SizedBox(height: 5),
//               FormBuilderDateTimePicker(
//                 name: 'start_date',
//                 controller: _startDateController,
//                 inputType: InputType.date,
//                 decoration: const InputDecoration(
//                   hintText: 'Selecione a data de início',
//                   border: UnderlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text('Data de Término', style: TextStyle(fontSize: 14)),
//               const SizedBox(height: 5),
//               FormBuilderDateTimePicker(
//                 name: 'end_date',
//                 controller: _endDateController,
//                 inputType: InputType.date,
//                 decoration: const InputDecoration(
//                   hintText: 'Selecione a data de término',
//                   border: UnderlineInputBorder(),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget stepTwo() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Categoria do Torneio', style: TextStyle(fontSize: 14)),
//           const SizedBox(height: 5),
//           FormBuilderDropdown<String>(
//             name: 'currency',
//             style: const TextStyle(
//               fontFamily: AppStrings.fontFamily,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: Colors.black,
//             ),
//             decoration: const InputDecoration(
//               hintText: 'Selecione a moeda',
//               border: UnderlineInputBorder(),
//             ),
//             items: const [
//               DropdownMenuItem(
//                 value: 'Kwanza',
//                 child: Text('Torneio Privado'),
//               ),
//               DropdownMenuItem(
//                 value: 'Dollar',
//                 child: Text('Torneio Local'),
//               ),
//               DropdownMenuItem(
//                 value: 'Euro',
//                 child: Text('Torneio Regional'),
//               ),
//               DropdownMenuItem(
//                 value: 'Libra',
//                 child: Text('Torneio Nacional'),
//               ),
//               DropdownMenuItem(
//                 value: 'Rublo',
//                 child: Text('Torneio Internacional'),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           const Text('Tipos de jogadores', style: TextStyle(fontSize: 14)),
//           const SizedBox(height: 5),
//           Row(
//             children: [
//               Expanded(
//                 child: FormBuilderRadioGroup<String>(
//                   name: 'gender',
//                   decoration: const InputDecoration(
//                     labelText: 'Gênero',
//                   ),
//                   options: const [
//                     FormBuilderFieldOption(
//                         value: 'Masculino', child: Text('Masculino')),
//                     FormBuilderFieldOption(
//                         value: 'Feminino', child: Text('Feminino')),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           const Text('Idade', style: TextStyle(fontSize: 14)),
//           const SizedBox(height: 5),
//           FormBuilderDropdown<String>(
//             name: 'category',
//             style: const TextStyle(
//               fontFamily: AppStrings.fontFamily,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: Colors.black,
//             ),
//             decoration: const InputDecoration(
//               hintText: 'Selecione a categoria',
//               border: UnderlineInputBorder(),
//             ),
//             items: const [
//               DropdownMenuItem(
//                 value: 'Sub 17',
//                 child: Text('Sub 17'),
//               ),
//               DropdownMenuItem(
//                 value: 'Sub 18',
//                 child: Text('Sub 18'),
//               ),
//               DropdownMenuItem(
//                 value: 'Sub 20',
//                 child: Text('Sub 20'),
//               ),
//               DropdownMenuItem(
//                 value: 'Adulto',
//                 child: Text('Adulto'),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           const Text('Tipo de jogo', style: TextStyle(fontSize: 14)),
//           const SizedBox(height: 5),
//           FormBuilderDropdown<String>(
//             name: 'category',
//             style: const TextStyle(
//               fontFamily: AppStrings.fontFamily,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: Colors.black,
//             ),
//             decoration: const InputDecoration(
//               hintText: 'Selecione tipo de jogo',
//               border: UnderlineInputBorder(),
//             ),
//             items: const [
//               DropdownMenuItem(
//                 value: '1X1',
//                 child: Text('1X1'),
//               ),
//               DropdownMenuItem(
//                 value: '2X2',
//                 child: Text('2X2'),
//               ),
//               DropdownMenuItem(
//                 value: '3X3',
//                 child: Text('3X3'),
//               ),
//               DropdownMenuItem(
//                 value: '4X4',
//                 child: Text('4X4'),
//               ),
//               DropdownMenuItem(
//                 value: '5X5',
//                 child: Text('5X5'),
//               ),
//               DropdownMenuItem(
//                 value: '6X6',
//                 child: Text('6X6'),
//               ),
//               DropdownMenuItem(
//                 value: '7X7',
//                 child: Text('7X7'),
//               ),
//               DropdownMenuItem(
//                 value: '8X8',
//                 child: Text('8X8'),
//               ),
//               DropdownMenuItem(
//                 value: '9X9',
//                 child: Text('9X9'),
//               ),
//               DropdownMenuItem(
//                 value: '10X10',
//                 child: Text('10X10'),
//               ),
//               DropdownMenuItem(
//                 value: '11X11',
//                 child: Text('11X11'),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           const Text('Valor do Prêmio', style: TextStyle(fontSize: 14)),
//           const SizedBox(height: 5),
//           FormBuilderTextField(
//             name: '',
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: Colors.black,
//             ),
//             decoration: InputDecoration(hintText: 'Ex: 1.000.000'),
//           ),
//           const SizedBox(height: 16),
//           const Text('Descrição do Prêmio', style: TextStyle(fontSize: 14)),
//           const SizedBox(height: 5),
//           FormBuilderTextField(
//             name: 'prize_description',
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: Colors.black,
//             ),
//             decoration: InputDecoration(hintText: 'Descreva o prêmio'),
//             maxLines: 5,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget stepOne() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Nome da Competição', style: TextStyle(fontSize: 14)),
//         FormBuilderTextField(
//           controller: _nameController,
//           name: '',
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//             color: Colors.black,
//           ),
//           decoration: InputDecoration(hintText: 'Ex: Campeonato de Verão'),
//         ),
//         const SizedBox(height: 16),
//         const Text('Moeda', style: TextStyle(fontSize: 14)),
//         const SizedBox(height: 5),
//         FormBuilderDropdown<String>(
//           name: 'currency',
//           style: const TextStyle(
//             fontFamily: AppStrings.fontFamily,
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//             color: Colors.black,
//           ),
//           decoration: const InputDecoration(
//             hintText: 'Selecione a moeda',
//             border: UnderlineInputBorder(),
//           ),
//           items: const [
//             DropdownMenuItem(
//               value: 'Kwanza',
//               child: Text('Kwanza (AOA)'),
//             ),
//             DropdownMenuItem(
//               value: 'Dollar',
//               child: Text('Dollar (USD)'),
//             ),
//             DropdownMenuItem(
//               value: 'Euro',
//               child: Text('Euro (€)'),
//             ),
//             DropdownMenuItem(
//               value: 'Libra',
//               child: Text('Libra (£)'),
//             ),
//             DropdownMenuItem(
//               value: 'Rublo',
//               child: Text('Rublo (₽)'),
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),
//         const Text('Taxa de registo', style: TextStyle(fontSize: 14)),
//         const SizedBox(height: 5),
//         FormBuilderTextField(
//           name: '',
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//             color: Colors.black,
//           ),
//           decoration: InputDecoration(hintText: 'Ex: 1000'),
//         ),
//         const SizedBox(height: 16),
//         const Text('Valor do Prêmio', style: TextStyle(fontSize: 14)),
//         const SizedBox(height: 5),
//         FormBuilderTextField(
//           name: '',
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//             color: Colors.black,
//           ),
//           decoration: InputDecoration(hintText: 'Ex: 1.000.000'),
//         ),
//         const SizedBox(height: 16),
//         const Text('Descrição do Prêmio', style: TextStyle(fontSize: 14)),
//         const SizedBox(height: 5),
//         FormBuilderTextField(
//           name: 'prize_description',
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//             color: Colors.black,
//           ),
//           decoration: InputDecoration(hintText: 'Descreva o prêmio'),
//           maxLines: 5,
//         ),
//       ],
//     );
//   }

//   void _submit() {
//     print('Competição criada:');
//     print('Nome: ${_nameController.text}');
//     print('Início: ${_startDateController.text}');
//     print('Fim: ${_endDateController.text}');
//     print('Regras: ${_rulesController.text}');

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Competição criada com sucesso!')),
//     );
//   }

//   Widget stepFive() {
//     return Column(
//       children: [],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:uuid/uuid.dart';

class CreateCompetitionPage extends StatefulWidget {
  @override
  State<CreateCompetitionPage> createState() => _CreateCompetitionPageState();
}

class _CreateCompetitionPageState extends State<CreateCompetitionPage> {
  final _formKeys = List.generate(5, (_) => GlobalKey<FormBuilderState>());
  int _currentStep = 0;

  // Dados da competição
  String name = '';
  String season = '';
  String type = 'league'; // league, cup, friendly
  bool isHomeAndAway = false;
  bool hasGroupStage = false;
  int? numberOfGroups;
  String? organizer;
  String? rulesUrl;
  String? prize;
  String? level;
  DateTime? startDate;
  DateTime? endDate;

  final types = ['league', 'cup', 'friendly'];
  final levels = ['local', 'national', 'international', 'regional'];

  void nextStep() {
    final currentForm = _formKeys[_currentStep].currentState;
    if (currentForm?.saveAndValidate() ?? false) {
      setState(() {
        if (_currentStep < 4) {
          _currentStep++;
        } else {
          _submit();
        }
      });
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  void _submit() {
    final competition = {
      'id': const Uuid().v4(),
      'name': name,
      'season': season,
      'type': type,
      'is_home_and_away': isHomeAndAway,
      'has_group_stage': hasGroupStage,
      'number_of_groups': hasGroupStage ? numberOfGroups : null,
      'organizer': organizer,
      'rules_url': rulesUrl,
      'prize': prize,
      'level': level,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
    };

    print('✅ Competição criada:\n$competition');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Competição criada com sucesso!')),
    );
  }

  Widget _buildStep() {
    switch (_currentStep) {
      case 0:
        return _basicInfoStep();
      case 1:
        return _formatStep();
      case 2:
        return _organizerStep();
      case 3:
        return _datesStep();
      case 4:
        return _reviewStep();
      default:
        return Container();
    }
  }

  Widget _basicInfoStep() {
    return FormBuilder(
      key: _formKeys[0],
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'name',
            decoration: const InputDecoration(labelText: 'Nome da competição'),
            onChanged: (v) => name = v ?? '',
            validator: FormBuilderValidators.required(),
          ),
          FormBuilderTextField(
            name: 'season',
            decoration:
                const InputDecoration(labelText: 'Temporada (ex: 2025)'),
            onChanged: (v) => season = v ?? '',
            validator: FormBuilderValidators.required(),
          ),
          FormBuilderDropdown<String>(
            name: 'type',
            initialValue: type,
            items: types
                .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                .toList(),
            onChanged: (v) => setState(() => type = v!),
            decoration: const InputDecoration(labelText: 'Tipo de competição'),
            validator: FormBuilderValidators.required(),
          ),
        ],
      ),
    );
  }

  Widget _formatStep() {
    return FormBuilder(
      key: _formKeys[1],
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('Jogos ida e volta?'),
            value: isHomeAndAway,
            onChanged: (v) => setState(() => isHomeAndAway = v),
          ),
          SwitchListTile(
            title: const Text('Tem fase de grupos?'),
            value: hasGroupStage,
            onChanged: (v) => setState(() => hasGroupStage = v),
          ),
          if (hasGroupStage)
            FormBuilderTextField(
              name: 'numberOfGroups',
              decoration: const InputDecoration(labelText: 'Número de grupos'),
              keyboardType: TextInputType.number,
              onChanged: (v) => numberOfGroups = int.tryParse(v ?? ''),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.integer(),
                FormBuilderValidators.min(1),
              ]),
            ),
        ],
      ),
    );
  }

  Widget _organizerStep() {
    return FormBuilder(
      key: _formKeys[2],
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'organizer',
            decoration:
                const InputDecoration(labelText: 'Organizador (ex: FIFA)'),
            onChanged: (v) => organizer = v,
          ),
          FormBuilderTextField(
            name: 'rules_url',
            decoration:
                const InputDecoration(labelText: 'Link para regulamento'),
            onChanged: (v) => rulesUrl = v,
            validator: FormBuilderValidators.url(),
          ),
          FormBuilderTextField(
            name: 'prize',
            decoration: const InputDecoration(labelText: 'Prêmio ou troféu'),
            onChanged: (v) => prize = v,
          ),
          FormBuilderDropdown<String>(
            name: 'level',
            initialValue: level,
            decoration: const InputDecoration(labelText: 'Nível da competição'),
            items: levels
                .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                .toList(),
            onChanged: (v) => setState(() => level = v),
            validator: FormBuilderValidators.required(),
          ),
        ],
      ),
    );
  }

  Widget _datesStep() {
    return FormBuilder(
      key: _formKeys[3],
      child: Column(
        children: [
          ListTile(
            title: Text(startDate == null
                ? 'Selecionar data de início'
                : 'Início: ${startDate!.toLocal()}'),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2035),
              );
              if (picked != null) setState(() => startDate = picked);
            },
          ),
          ListTile(
            title: Text(endDate == null
                ? 'Selecionar data de término'
                : 'Término: ${endDate!.toLocal()}'),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: startDate ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2035),
              );
              if (picked != null) setState(() => endDate = picked);
            },
          ),
        ],
      ),
    );
  }

  Widget _reviewStep() {
    return FormBuilder(
      key: _formKeys[4],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("📝 Nome: $name"),
          Text("📆 Temporada: $season"),
          Text("🏁 Tipo: $type"),
          Text("🔁 Ida e volta: $isHomeAndAway"),
          Text("👥 Fase de grupos: $hasGroupStage"),
          if (hasGroupStage) Text("🔢 Grupos: $numberOfGroups"),
          Text("🏢 Organizador: ${organizer ?? 'N/A'}"),
          Text("📎 Regulamento: ${rulesUrl ?? 'N/A'}"),
          Text("🏆 Prêmio: ${prize ?? 'N/A'}"),
          Text("🌍 Nível: ${level ?? 'N/A'}"),
          Text("📅 Início: ${startDate?.toLocal()}"),
          Text("📅 Fim: ${endDate?.toLocal()}"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Competição')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StepProgressIndicator(
              totalSteps: 5,
              currentStep: _currentStep + 1,
              selectedColor: Colors.green,
              unselectedColor: Colors.grey[300]!,
            ),
            const SizedBox(height: 24),
            Expanded(child: SingleChildScrollView(child: _buildStep())),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0)
                  TextButton(
                    onPressed: previousStep,
                    child: const Text('Voltar'),
                  ),
                ElevatedButton(
                  onPressed: nextStep,
                  child: Text(_currentStep < 4 ? 'Próximo' : 'Criar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
