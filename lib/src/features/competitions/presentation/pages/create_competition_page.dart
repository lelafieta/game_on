import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/themes/app_colors.dart';

class CreateCompetitionPage extends StatefulWidget {
  const CreateCompetitionPage({super.key});

  @override
  State<CreateCompetitionPage> createState() => _CreateCompetitionPageState();
}

class _CreateCompetitionPageState extends State<CreateCompetitionPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;
  int rounds = 13;
  int roundDuration = 7;
  int pauseDuration = 0;

  // Dados da competição
  String name = '';
  String season = '';
  String type = 'Liga';
  bool isHomeAndAway = false;
  bool hasGroupStage = false;
  int? numberOfGroups;
  String? organizer;
  String? level;
  DateTime? startDate;
  DateTime? endDate;


  Text

  final types = ['Liga', 'Copa', 'Torneio em Grupo'];
  final levels = ['Local', 'Nacional', 'Internacional'];
  final typeOfPlayers = ['Homens', 'Munlheres'];

  void nextStep() {
    final requiresValidation =
        _currentStep == 0 || (_currentStep == 2 && level == null);

    if (!requiresValidation ||
        (_formKey.currentState?.saveAndValidate() ?? false)) {
      setState(() {
        if (_currentStep < 4) {
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
      case 2:
        return _rulesStep();
      case 3:
        return _reviewStep();
      default:
        return const SizedBox();
    }
  }

  Widget _basicInfoStep() {
    return FormBuilder(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilderTextField(
              name: 'name',
              decoration:
                  const InputDecoration(labelText: 'Nome da competição'),
              onChanged: (v) => name = v ?? '',
              validator: FormBuilderValidators.required(
                  errorText: "Campo obrigatório"),
            ),
            const SizedBox(height: 15),
            FormBuilderTextField(
              name: 'season',
              decoration:
                  const InputDecoration(labelText: 'Temporada (ex: 2025)'),
              onChanged: (v) => season = v ?? '',
              validator: FormBuilderValidators.required(
                  errorText: "Campo obrigatório"),
            ),
            const SizedBox(height: 15),
            FormBuilderDropdown<String>(
              name: 'type',
              initialValue: type,
              items: types
                  .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                  .toList(),
              onChanged: (v) => setState(() => type = v!),
              decoration:
                  const InputDecoration(labelText: 'Tipo de competição'),
              validator: FormBuilderValidators.required(
                  errorText: "Campo obrigatório"),
            ),
            const SizedBox(height: 15),
            FormBuilderTextField(
              name: "start_date",
              decoration: const InputDecoration(labelText: 'Data de início'),
              readOnly: true,
              onTap: () {
                _openDatePickerInitial(context);
              },
            ),
            const SizedBox(height: 15),
            FormBuilderTextField(
              name: "end_date",
              decoration: const InputDecoration(labelText: 'Data de término'),
              readOnly: true,
              onTap: () {
                _openDatePickerEnd(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _organizerStep() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderDropdown<String>(
            name: 'level',
            initialValue: level,
            decoration:
                const InputDecoration(labelText: 'Categoria da competição'),
            items: levels
                .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                .toList(),
            onChanged: (v) => setState(() => level = v),
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
          ),
          const SizedBox(height: 15),
          FormBuilderDropdown<int>(
            name: 'match_type',
            decoration:
                const InputDecoration(labelText: 'Selecione o tipo de jogo'),
            onTap: () async {
              // final selectedValue = await showModalBottomSheet<int>(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return ListView.builder(
              //       itemCount: 10,
              //       itemBuilder: (context, index) {
              //         final value = index + 2;
              //         return ListTile(
              //           title: Text('$value x $value'),
              //           onTap: () {
              //             Navigator.pop(context, value);
              //           },
              //         );
              //       },
              //     );
              //   },
              // );
              // if (selectedValue != null) {
              //   setState(() {
              //     _formKey.currentState?.fields['match_type']
              //         ?.didChange(selectedValue);
              //   });
              // }
            },
            items: List.generate(
              10,
              (index) => DropdownMenuItem(
                value: index + 2,
                child: Text('${index + 2} x ${index + 2}'),
              ),
            ),
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
          ),
          const SizedBox(height: 15),
          const Text("Tipo de jogadores",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const SizedBox(height: 10),
          FormBuilderRadioGroup<String>(
            name: 'gender',
            options: const [
              FormBuilderFieldOption(value: 'Homens', child: Text('Homens')),
              FormBuilderFieldOption(
                  value: 'Mulheres', child: Text('Mulheres')),
            ],
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
            onChanged: (value) {
              // Handle gender selection if needed
            },
          ),
        ],
      ),
    );
  }

  void _openDatePickerInitial(BuildContext context) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime.now().add(const Duration(days: 365 * 2)),
        onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.pt);
  }

  void _openDatePickerEnd(BuildContext context) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime.now().add(const Duration(days: 365 * 2)),
        onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.pt);
  }

  Widget _datesStep() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     child: const Text('Date Picker with button style',
          //         textAlign: TextAlign.center),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _rulesStep() {
    int _currentValue = 3;
    return FormBuilder(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Text("Critério de desempate",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 10),
            FormBuilderCheckboxGroup(name: 'tiebreakers', options: const [
              FormBuilderFieldOption(value: 'Diferença de gols'),
              FormBuilderFieldOption(value: 'Gols marcados'),
              FormBuilderFieldOption(value: 'Confronto direto'),
              FormBuilderFieldOption(value: 'Cartões (fair play)'),
              FormBuilderFieldOption(value: 'Sorteio'),
            ]),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderDropdown(
                  name: 'points_victory',
                  decoration: const InputDecoration(labelText: 'Vitória'),
                  items: List.generate(
                    5,
                    (index) => DropdownMenuItem(
                      value: index,
                      child: Text(index == 0
                          ? '0'
                          : index == 1
                              ? '$index pt'
                              : '$index pts'),
                    ),
                  ),
                  validator: FormBuilderValidators.required(
                      errorText: "Campo obrigatório"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderDropdown(
                  name: 'points_draw',
                  decoration: const InputDecoration(labelText: 'Empate'),
                  items: List.generate(
                    5,
                    (index) => DropdownMenuItem(
                      value: index,
                      child: Text(index == 0
                          ? '0'
                          : index == 1
                              ? '$index pt'
                              : '$index pts'),
                    ),
                  ),
                  validator: FormBuilderValidators.required(
                      errorText: "Campo obrigatório"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderDropdown(
                  name: 'points_lose',
                  decoration: const InputDecoration(labelText: 'Derrota'),
                  items: List.generate(
                    5,
                    (index) => DropdownMenuItem(
                      value: index,
                      child: Text(index == 0
                          ? '0'
                          : index == 1
                              ? '$index pt'
                              : '$index pts'),
                    ),
                  ),
                  validator: FormBuilderValidators.required(
                      errorText: "Campo obrigatório"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            FormBuilderDropdown(
                name: 'match_leg',
                decoration:
                    const InputDecoration(hintText: 'Tipo de confronto'),
                items: const [
                  DropdownMenuItem(
                      value: 'Ida e volta', child: Text('Ida e volta')),
                  DropdownMenuItem(
                      value: 'Jogo único', child: Text('Jogo único')),
                ]),
            const SizedBox(height: 15),
            FormBuilderTextField(
                name: 'max_subs',
                decoration: const InputDecoration(hintText: 'Substituição'),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.numeric()),
            const SizedBox(height: 15),
            FormBuilderSwitch(
                name: 'extra_subs_et',
                title: const Text(
                  'Permite substituições extras na prorrogação?',
                )),
            const SizedBox(height: 15),
            FormBuilderSwitch(
                name: 'extra_time',
                title: const Text('Adiciona prorrogação? (2x15)')),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text("Munutos de jogo",
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                ),
                Row(
                  children: [
                    _counterButton("-", () {}),
                    const SizedBox(width: 16),
                    const Column(
                      children: [
                        Text('30', style: TextStyle(fontSize: 18)),
                        Text("min"),
                      ],
                    ),
                    const SizedBox(width: 16),
                    _counterButton("+", () {}),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text("Munutos de prolongamento",
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                ),
                Row(
                  children: [
                    _counterButton("-", () {}),
                    const SizedBox(width: 16),
                    const Column(
                      children: [
                        Text('30', style: TextStyle(fontSize: 18)),
                        Text("min"),
                      ],
                    ),
                    const SizedBox(width: 16),
                    _counterButton("+", () {}),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text("Munutos de Descanso",
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                ),
                Row(
                  children: [
                    _counterButton("-", () {}),
                    const SizedBox(width: 16),
                    const Column(
                      children: [
                        Text('30', style: TextStyle(fontSize: 18)),
                        Text("min"),
                      ],
                    ),
                    const SizedBox(width: 16),
                    _counterButton("+", () {}),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
            const SizedBox(height: 15),
            FormBuilderSwitch(
                name: 'penalties',
                title: const Text('Pênaltis em caso de empate?')),
            const SizedBox(height: 15),
            const Text("Inscrição de Jogadores",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 10),
            FormBuilderTextField(
                name: 'max_players',
                decoration: const InputDecoration(
                    hintText: 'Número máximo de jogadores por equipe'),
                keyboardType: TextInputType.number),
            const SizedBox(height: 15),
            FormBuilderDateTimePicker(
                name: 'registration_deadline',
                decoration:
                    const InputDecoration(hintText: 'Data limite de inscrição'),
                inputType: InputType.date),
            const SizedBox(height: 15),
            FormBuilderSwitch(
                name: 'foreign_players',
                title: const Text('Permitir jogadores estrangeiros?')),
            const SizedBox(height: 15),
            const Text("Punições",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 10),
            FormBuilderCheckboxGroup(name: 'punishments', options: const [
              FormBuilderFieldOption(value: 'Acúmulo de cartões'),
              FormBuilderFieldOption(value: 'Suspensões automáticas'),
              FormBuilderFieldOption(value: 'Protestos e recursos'),
            ]),
            const SizedBox(height: 15),
            const Text("Premiações",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 10),
            FormBuilderSwitch(
                name: 'prize_champion',
                title: const Text('Premiação para o campeão')),
            const SizedBox(height: 15),
            FormBuilderSwitch(
                name: 'prize_top_scorer',
                title: const Text('Premiação para artilheiro')),
            const SizedBox(height: 15),
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

  Widget _counterButton(String symbol, VoidCallback onPressed) {
    return SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.zero,
        ),
        child: Text(symbol, style: const TextStyle(fontSize: 20)),
      ),
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
              totalSteps: 4,
              currentStep: _currentStep + 1,
              selectedColor: AppColors.primary,
              unselectedColor: Colors.grey[300]!,
            ),
            const SizedBox(height: 16),
            Expanded(child: _buildStep()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0)
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onPressed: previousStep,
                      child: const Text('Voltar')),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
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
