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
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;

  // Dados da competição
  String name = '';
  String season = '';
  String type = 'league';
  bool isHomeAndAway = false;
  bool hasGroupStage = false;
  int? numberOfGroups;
  String? organizer;
  String? level;
  DateTime? startDate;
  DateTime? endDate;

  final types = ['league', 'cup', 'friendly'];
  final levels = ['local', 'national', 'international'];

  void nextStep() {
    final requiresValidation =
        _currentStep == 0 || (_currentStep == 2 && level == null);

    if (!requiresValidation ||
        (_formKey.currentState?.saveAndValidate() ?? false)) {
      setState(() {
        if (_currentStep < 5) {
          _currentStep++;
        } else {
          _submit();
        }
      });
    } else {
      print("⚠️ Formulário inválido.");
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
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
      'level': level,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'rules': _formKey.currentState?.value,
    };

    print('✅ Competição criada com regulamento:\n\$competition');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Competição criada com sucesso!')),
    );
  }

  Widget _buildStep() {
    switch (_currentStep) {
      case 0:
        return _basicInfoStep();
      case 1:
        return _organizerStep();
      case 3:
        return _rulesStep();
      case 4:
        return _reviewStep();
      default:
        return const SizedBox();
    }
  }

  Widget _basicInfoStep() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderTextField(
            name: 'name',
            decoration: const InputDecoration(labelText: 'Nome da competição'),
            onChanged: (v) => name = v ?? '',
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
          ),
          const SizedBox(height: 15),
          FormBuilderTextField(
            name: 'season',
            decoration:
                const InputDecoration(labelText: 'Temporada (ex: 2025)'),
            onChanged: (v) => season = v ?? '',
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
          ),
          const SizedBox(height: 15),
          FormBuilderDropdown<String>(
            name: 'type',
            initialValue: type,
            items: types
                .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                .toList(),
            onChanged: (v) => setState(() => type = v!),
            decoration: const InputDecoration(labelText: 'Tipo de competição'),
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
          ),
          const SizedBox(height: 15),
          FormBuilderDropdown<String>(
            name: 'level',
            initialValue: level,
            decoration: const InputDecoration(labelText: 'Nível da competição'),
            items: levels
                .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                .toList(),
            onChanged: (v) => setState(() => level = v),
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
          ),
          const SizedBox(height: 15),
          FormBuilderDateTimePicker(
            name: 'start_date',
            decoration: const InputDecoration(labelText: 'Data de início'),
            inputType: InputType.date,
            onChanged: (v) => startDate = v,
          ),
          const SizedBox(height: 15),
          FormBuilderDateTimePicker(
            name: 'end_date',
            decoration: const InputDecoration(labelText: 'Data de término'),
            inputType: InputType.date,
            onChanged: (v) => endDate = v,
          ),
        ],
      ),
    );
  }

  Widget _formatStep() {
    return Column(
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
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número de grupos'),
              onChanged: (v) => numberOfGroups = int.tryParse(v),
            ),
          ),
      ],
    );
  }

  Widget _organizerStep() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderDropdown<String>(
            name: 'level',
            initialValue: level,
            decoration: const InputDecoration(labelText: 'Nível da competição'),
            items: levels
                .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                .toList(),
            onChanged: (v) => setState(() => level = v),
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
          ),
        ],
      ),
    );
  }

  Widget _datesStep() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderDateTimePicker(
            name: 'start_date',
            decoration: const InputDecoration(labelText: 'Data de início'),
            inputType: InputType.date,
            onChanged: (v) => startDate = v,
          ),
          FormBuilderDateTimePicker(
            name: 'end_date',
            decoration: const InputDecoration(labelText: 'Data de término'),
            inputType: InputType.date,
            onChanged: (v) => endDate = v,
          ),
        ],
      ),
    );
  }

  Widget _rulesStep() {
    return FormBuilder(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("📊 Critérios de Desempate",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            FormBuilderCheckboxGroup(name: 'tiebreakers', options: const [
              FormBuilderFieldOption(value: 'Diferença de gols'),
              FormBuilderFieldOption(value: 'Gols marcados'),
              FormBuilderFieldOption(value: 'Confronto direto'),
              FormBuilderFieldOption(value: 'Cartões (fair play)'),
              FormBuilderFieldOption(value: 'Sorteio'),
            ]),
            const SizedBox(height: 16),
            const Text("🏆 Sistema de Pontuação",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            FormBuilderDropdown(
                name: 'point_system',
                decoration:
                    const InputDecoration(labelText: 'Sistema de Pontuação'),
                items: const [
                  DropdownMenuItem(
                      value: '3-1-0',
                      child: Text('Vitória: 3, Empate: 1, Derrota: 0')),
                  DropdownMenuItem(
                      value: '2-1-0',
                      child: Text('Vitória: 2, Empate: 1, Derrota: 0')),
                ],
                validator: FormBuilderValidators.required(
                    errorText: "Campo obrigatório")),
            const SizedBox(height: 16),
            const Text("📌 Formato da Competição",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            FormBuilderDropdown(
                name: 'match_format',
                decoration:
                    const InputDecoration(labelText: 'Formato da competição'),
                items: const [
                  DropdownMenuItem(
                      value: 'Grupos + Mata-mata',
                      child: Text('Fase de grupos + mata-mata')),
                  DropdownMenuItem(
                      value: 'Liga', child: Text('Todos contra todos (liga)')),
                  DropdownMenuItem(
                      value: 'Eliminatória direta',
                      child: Text('Eliminatória direta')),
                ]),
            FormBuilderDropdown(
                name: 'match_leg',
                decoration:
                    const InputDecoration(labelText: 'Tipo de confronto'),
                items: const [
                  DropdownMenuItem(
                      value: 'Ida e volta', child: Text('Ida e volta')),
                  DropdownMenuItem(
                      value: 'Jogo único', child: Text('Jogo único')),
                ]),
            const SizedBox(height: 16),
            const Text("🔄 Substituições",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            FormBuilderTextField(
                name: 'max_subs',
                decoration:
                    const InputDecoration(labelText: 'Número máximo permitido'),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.numeric()),
            FormBuilderSwitch(
                name: 'extra_subs_et',
                title:
                    const Text('Permite substituições extras na prorrogação?')),
            const SizedBox(height: 16),
            const Text("⏱️ Tempo de Jogo",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            FormBuilderDropdown(
                name: 'match_duration',
                decoration: const InputDecoration(labelText: 'Duração do jogo'),
                items: const [
                  DropdownMenuItem(
                      value: '2x45', child: Text('90 minutos (2x45)')),
                  DropdownMenuItem(
                      value: '2x30', child: Text('60 minutos (2x30)')),
                ]),
            FormBuilderSwitch(
                name: 'extra_time',
                title: const Text('Adiciona prorrogação? (2x15)')),
            FormBuilderSwitch(
                name: 'penalties',
                title: const Text('Pênaltis em caso de empate?')),
            const SizedBox(height: 16),
            const Text("👥 Inscrição de Jogadores",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            FormBuilderTextField(
                name: 'max_players',
                decoration: const InputDecoration(
                    labelText: 'Número máximo de jogadores por equipe'),
                keyboardType: TextInputType.number),
            FormBuilderDateTimePicker(
                name: 'registration_deadline',
                decoration: const InputDecoration(
                    labelText: 'Data limite de inscrição'),
                inputType: InputType.date),
            FormBuilderSwitch(
                name: 'foreign_players',
                title: const Text('Permitir jogadores estrangeiros?')),
            const SizedBox(height: 16),
            const Text("🚫 Punições",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            FormBuilderCheckboxGroup(name: 'punishments', options: const [
              FormBuilderFieldOption(value: 'Acúmulo de cartões'),
              FormBuilderFieldOption(value: 'Suspensões automáticas'),
              FormBuilderFieldOption(value: 'Protestos e recursos'),
            ]),
            const SizedBox(height: 16),
            const Text("🏅 Premiações",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            FormBuilderSwitch(
                name: 'prize_champion',
                title: const Text('Premiação para o campeão')),
            FormBuilderSwitch(
                name: 'prize_top_scorer',
                title: const Text('Premiação para artilheiro')),
            FormBuilderSwitch(
                name: 'prize_fair_play',
                title: const Text('Equipe mais disciplinada')),
          ],
        ),
      ),
    );
  }

  Widget _reviewStep() {
    return Column(
      children: [
        const Text(
            'Revise as informações e clique em "Salvar" para criar a competição.'),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: _submit, child: const Text('Salvar Competição')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Competição')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StepProgressIndicator(
              totalSteps: 6,
              currentStep: _currentStep + 1,
              selectedColor: Colors.blue,
              unselectedColor: Colors.grey[300]!,
            ),
            const SizedBox(height: 16),
            Expanded(child: _buildStep()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0)
                  TextButton(
                      onPressed: previousStep, child: const Text('Voltar')),
                ElevatedButton(
                  onPressed: nextStep,
                  child: Text(_currentStep == 5 ? 'Finalizar' : 'Próximo'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
