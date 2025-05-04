import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
        return _formatStep();
      case 2:
        return _organizerStep();
      case 3:
        return _datesStep();
      case 4:
        return _rulesStep();
      case 5:
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
          const Text(
            "Nome da competição",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: 'name',
            decoration: const InputDecoration(hintText: 'Nome da competição'),
            onChanged: (v) => name = v ?? '',
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
          ),
          const SizedBox(height: 15),
          const Text(
            "Temporada",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: 'season',
            decoration: const InputDecoration(hintText: 'Temporada (ex: 2025)'),
            onChanged: (v) => season = v ?? '',
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
          ),
          const SizedBox(height: 15),
          const Text(
            "Tipo de competição",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          FormBuilderDropdown<String>(
            name: 'type',
            initialValue: type,
            items: types
                .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                .toList(),
            onChanged: (v) => setState(() => type = v!),
            decoration: const InputDecoration(hintText: 'Tipo de competição'),
            validator:
                FormBuilderValidators.required(errorText: "Campo obrigatório"),
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
              decoration: const InputDecoration(hintText: 'Número de grupos'),
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
            decoration: const InputDecoration(hintText: 'Nível da competição'),
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
          FormBuilderTextField(
            name: "start_date",
            decoration: const InputDecoration(hintText: 'Data de início'),
            readOnly: true,
            onTap: () {
              _openDatePickerInitial(context);
            },
          ),
          const SizedBox(height: 15),
          FormBuilderTextField(
            name: "end_date",
            decoration: const InputDecoration(hintText: 'Data de término'),
            readOnly: true,
            onTap: () {
              _openDatePickerEnd(context);
            },
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
            const SizedBox(height: 15),
            const Text(
              "Critérios de Desempate",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            FormBuilderCheckboxGroup(name: 'tiebreakers', options: const [
              FormBuilderFieldOption(value: 'Diferença de gols'),
              FormBuilderFieldOption(value: 'Gols marcados'),
              FormBuilderFieldOption(value: 'Confronto direto'),
              FormBuilderFieldOption(value: 'Cartões (fair play)'),
              FormBuilderFieldOption(value: 'Sorteio'),
            ]),
            const SizedBox(height: 15),
            const Text("Sistema de pontuação",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 10),
            FormBuilderDropdown(
                name: 'point_system',
                decoration:
                    const InputDecoration(hintText: 'Sistema de Pontuação'),
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
            const SizedBox(height: 15),
            const Text("Formato da Competição",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 10),
            FormBuilderDropdown(
                name: 'match_format',
                decoration:
                    const InputDecoration(hintText: 'Formato da competição'),
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
            const Text("Substituição",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 10),
            FormBuilderTextField(
                name: 'max_subs',
                decoration:
                    const InputDecoration(hintText: 'Número máximo permitido'),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.numeric()),
            const SizedBox(height: 15),
            FormBuilderSwitch(
                name: 'extra_subs_et',
                title:
                    const Text('Permite substituições extras na prorrogação?')),
            const SizedBox(height: 15),
            const Text("Tempo de jogo",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 10),
            FormBuilderDropdown(
                name: 'match_duration',
                decoration: const InputDecoration(hintText: 'Duração do jogo'),
                items: const [
                  DropdownMenuItem(
                      value: '2x45', child: Text('90 minutos (2x45)')),
                  DropdownMenuItem(
                      value: '2x30', child: Text('60 minutos (2x30)')),
                ]),
            const SizedBox(height: 15),
            FormBuilderSwitch(
                name: 'extra_time',
                title: const Text('Adiciona prorrogação? (2x15)')),
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
