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
  final _formKeyStep0 = GlobalKey<FormBuilderState>();
  final _formKeyStep1 = GlobalKey<FormBuilderState>();
  final _formKeyStep2 = GlobalKey<FormBuilderState>();
  final _formKeyStep3 = GlobalKey<FormBuilderState>();
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;
  int rounds = 13;
  int roundDuration = 7;
  int pauseDuration = 0;

  // Dados da competição

  final types = {
    'league': 'Liga',
    'cup': 'Copa',
    'group_tournament': 'Torneio em Grupo'
  };

  final categories = {
    'local': 'Local',
    'national': 'Nacional',
    'international': 'Internacional',
  };
  final gameTypes = {
    '2X2': '2X2',
    '3X3': '3X3',
    '4X4': '4X4',
    '5X5': '5X5',
    '6X6': '6X6',
    '7X7': '7X7',
    '8X8': '8X8',
    '9X9': '9X9',
    '10X10': '10X10',
    '11X11': '11X11',
  };

  final typeOfPlayers = ['Homens', 'Munlheres'];

  TextEditingController name = TextEditingController();
  TextEditingController season = TextEditingController();
  TextEditingController type = TextEditingController(text: "league");
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController category = TextEditingController(text: "local");
  TextEditingController gameType = TextEditingController(text: "7X7");
  TextEditingController playerType = TextEditingController(text: "male");
  TextEditingController level = TextEditingController();
  TextEditingController pointsVictory = TextEditingController(text: "3");
  TextEditingController pointsDraw = TextEditingController(text: "1");
  TextEditingController pointsLose = TextEditingController(text: "0");
  TextEditingController substitutionsAllowed = TextEditingController(text: "5");
  bool drawsAllowed = true;
  bool extraTimeAllowed = true;
  int matchDuration = 60;
  int restTime = 10;
  int extraTimeDuration = 8;

  List<String> tiebreakersSelected = ["goal_difference"];
  List<Map<String, String>> tiebreakers = [
    {'goal_difference': 'Diferença de gols'},
    {'goals_scored': 'Gols marcados'},
    {'head_to_head': 'Confronto direto'},
    {'wins': 'Vitórias'},
    {'fair_play': 'Fair play (cartões)'},
    {'random_draw': 'Sorteio'},
  ];

  void nextStep() {
    final requiresValidation = _currentStep == 0 || (_currentStep == 2);

    if (!requiresValidation ||
        (_formKeyStep0.currentState?.saveAndValidate() ?? false)) {
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
    // final competition = {
    //   'id': const Uuid().v4(),
    //   'name': name,
    //   'season': season,
    //   'type': type,
    //   'is_home_and_away': isHomeAndAway,
    //   'has_group_stage': hasGroupStage,
    //   'number_of_groups': hasGroupStage ? numberOfGroups : null,
    //   'organizer': organizer,
    //   'level': level,
    //   'start_date': startDate?.toIso8601String(),
    //   'end_date': endDate?.toIso8601String(),
    //   'rules': _formKey.currentState?.value,
    // };

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
        return _basicInfoStep1();
      case 2:
        return _rulesStep();
      case 3:
        return _prizesStep();
      case 4:
        return _reviewStep();
      default:
        return const SizedBox();
    }
  }

  Widget _basicInfoStep() {
    return FormBuilder(
      key: _formKeyStep0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilderTextField(
              name: 'name',
              controller: name,
              decoration:
                  const InputDecoration(labelText: 'Nome da competição'),
              onChanged: (v) => name.text = v ?? '',
              validator: FormBuilderValidators.required(
                  errorText: "Campo obrigatório"),
            ),
            const SizedBox(height: 15),
            FormBuilderTextField(
              name: 'season',
              controller: season,
              decoration:
                  const InputDecoration(labelText: 'Temporada (ex: 2025)'),
              onChanged: (v) => season.text = v ?? '',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
                FormBuilderValidators.numeric(
                    errorText: "Apenas números são permitidos"),
              ]),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            FormBuilderDropdown<String>(
              name: 'type',
              initialValue: type.text,
              items: types.entries
                  .map((t) =>
                      DropdownMenuItem(value: t.key, child: Text(t.value)))
                  .toList(),
              onChanged: (v) => setState(() => type.text = v!),
              decoration:
                  const InputDecoration(labelText: 'Tipo de competição'),
              validator: FormBuilderValidators.required(
                  errorText: "Campo obrigatório"),
            ),
            const SizedBox(height: 15),
            FormBuilderTextField(
              name: "start_date",
              controller: startDate,
              decoration: const InputDecoration(labelText: 'Data de início'),
              readOnly: true,
              onTap: () {
                _openDatePickerInitial(context);
              },
            ),
            const SizedBox(height: 15),
            FormBuilderTextField(
              name: "end_date",
              controller: endDate,
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

  Widget _basicInfoStep1() {
    return FormBuilder(
      key: _formKeyStep1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderDropdown<String>(
            name: 'category',
            initialValue: category.text,
            decoration:
                const InputDecoration(labelText: 'Categoria da competição'),
            items: categories.entries
                .map(
                    (l) => DropdownMenuItem(value: l.key, child: Text(l.value)))
                .toList(),
            onChanged: (v) => setState(() => category.text = v!),
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
          ),
          const SizedBox(height: 15),
          FormBuilderDropdown<String>(
            name: 'game_type',
            initialValue: gameType.text,
            items: gameTypes.entries
                .map(
                    (t) => DropdownMenuItem(value: t.key, child: Text(t.value)))
                .toList(),
            onChanged: (v) => setState(() => type.text = v!),
            decoration: const InputDecoration(labelText: 'Tipo de Jogo'),
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
            name: 'player_type',
            initialValue: playerType.text,
            options: const [
              FormBuilderFieldOption(value: 'male', child: Text('Homens')),
              FormBuilderFieldOption(value: 'female', child: Text('Mulheres')),
            ],
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
            onChanged: (value) {
              setState(() {
                playerType.text = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _rulesStep() {
    return FormBuilder(
      key: _formKeyStep2,
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
            FormBuilderCheckboxGroup<String>(
              name: 'tiebreakers',
              options: tiebreakers
                  .map((item) => FormBuilderFieldOption(
                        value: item.keys.first,
                        child: Text(item.values.first),
                      ))
                  .toList(),
              initialValue: tiebreakersSelected,
              onChanged: (selected) {
                if (selected != null) {
                  setState(() {
                    tiebreakersSelected = selected;
                  });
                }
              },
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.minLength(1,
                    errorText: 'Selecione pelo menos um critério'),
              ]),
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderDropdown<String>(
                  name: 'points_victory',
                  initialValue: pointsVictory.text,
                  decoration: const InputDecoration(labelText: 'Empate'),
                  items: List.generate(
                    5,
                    (index) => DropdownMenuItem(
                      value: index.toString(),
                      child: Text(index == 0
                          ? '0'
                          : index == 1
                              ? '$index pt'
                              : '$index pts'),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      pointsDraw.text = value!;
                    });
                  },
                  validator: FormBuilderValidators.required(
                      errorText: "Campo obrigatório"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderDropdown<String>(
                  name: 'points_draw',
                  initialValue: pointsDraw.text,
                  decoration: const InputDecoration(labelText: 'Empate'),
                  items: List.generate(
                    5,
                    (index) => DropdownMenuItem(
                      value: index.toString(),
                      child: Text(index == 0
                          ? '0'
                          : index == 1
                              ? '$index pt'
                              : '$index pts'),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      pointsDraw.text = value!;
                    });
                  },
                  validator: FormBuilderValidators.required(
                      errorText: "Campo obrigatório"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderDropdown<String>(
                  name: 'points_lose',
                  initialValue: pointsLose.text,
                  decoration: const InputDecoration(labelText: 'Empate'),
                  items: List.generate(
                    5,
                    (index) => DropdownMenuItem(
                      value: index.toString(),
                      child: Text(index == 0
                          ? '0'
                          : index == 1
                              ? '$index pt'
                              : '$index pts'),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      pointsDraw.text = value!;
                    });
                  },
                  validator: FormBuilderValidators.required(
                      errorText: "Campo obrigatório"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            FormBuilderTextField(
                name: 'substitutions_allowed',
                controller: substitutionsAllowed,
                decoration: const InputDecoration(hintText: 'Substituição'),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Campo obrigatório"),
                  FormBuilderValidators.numeric(
                      errorText: "Penas valor numérico"),
                ])),
            const SizedBox(height: 15),
            FormBuilderSwitch(
              name: 'draws_allowed',
              initialValue: drawsAllowed,
              onChanged: (value) {
                setState(() {
                  drawsAllowed = value!;
                });
              },
              title: const Text(
                'Permiter Empate',
              ),
            ),
            const SizedBox(height: 15),
            FormBuilderSwitch(
                name: 'extra_time',
                initialValue: extraTimeAllowed,
                onChanged: (value) {
                  setState(() {
                    extraTimeAllowed = value!;
                  });
                },
                title: const Text('Adiciona prolongamento?')),
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
                    _counterButton("-", () {
                      setState(() {
                        matchDuration = matchDuration - 1;
                      });
                    }),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        Text('$matchDuration',
                            style: const TextStyle(fontSize: 18)),
                        const Text("min"),
                      ],
                    ),
                    const SizedBox(width: 16),
                    _counterButton("+", () {
                      setState(() {
                        matchDuration = matchDuration + 1;
                      });
                    }),
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
                    _counterButton("-", () {
                      setState(() {
                        extraTimeDuration = extraTimeDuration - 1;
                      });
                    }),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        Text('$extraTimeDuration',
                            style: const TextStyle(fontSize: 18)),
                        const Text("min"),
                      ],
                    ),
                    const SizedBox(width: 16),
                    _counterButton("+", () {
                      setState(() {
                        extraTimeDuration = extraTimeDuration + 1;
                      });
                    }),
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
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ),
                Row(
                  children: [
                    _counterButton("-", () {
                      setState(() {
                        restTime = restTime - 1;
                      });
                    }),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        Text('$restTime', style: const TextStyle(fontSize: 18)),
                        const Text("min"),
                      ],
                    ),
                    const SizedBox(width: 16),
                    _counterButton("+", () {
                      setState(() {
                        restTime = restTime + 1;
                      });
                    }),
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
          ],
        ),
      ),
    );
  }

  Widget _prizesStep() {
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKeyStep3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            FormBuilderTextField(
                name: 'max_players',
                decoration: const InputDecoration(hintText: 'Valor'),
                keyboardType: TextInputType.number),
            const SizedBox(height: 15),
            FormBuilderSwitch(
                name: 'prize_top_scorer',
                title: const Text('Premiação para artilheiro')),
            const SizedBox(height: 15),
            FormBuilderTextField(
                name: 'max_players',
                decoration: const InputDecoration(hintText: 'Valor'),
                keyboardType: TextInputType.number),
            const SizedBox(height: 15),
            FormBuilderSwitch(
                name: 'prize_fair_play',
                title: const Text('Equipe mais disciplinada')),
            const SizedBox(height: 15),
            FormBuilderTextField(
                name: 'max_players',
                decoration: const InputDecoration(hintText: 'Valor'),
                keyboardType: TextInputType.number),
            const SizedBox(height: 15),
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

  void _openDatePickerInitial(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime.now().add(const Duration(days: 365 * 2)),
      currentTime: DateTime.now(),
      locale: LocaleType.pt,
      onConfirm: (date) {
        setState(() {
          startDate.text = date.toIso8601String().split('T').first;
        });
      },
    );
  }

  void _openDatePickerEnd(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime.now().add(const Duration(days: 365 * 2)),
      currentTime: DateTime.now(),
      locale: LocaleType.pt,
      onConfirm: (date) {
        setState(() {
          endDate.text = date.toIso8601String().split('T').first;
        });
      },
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
              totalSteps: 5,
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
