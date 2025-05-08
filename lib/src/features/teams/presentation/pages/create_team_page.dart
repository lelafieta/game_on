import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../config/themes/app_colors.dart';

class CreateTeamPage extends StatefulWidget {
  const CreateTeamPage({super.key});

  @override
  State<CreateTeamPage> createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends State<CreateTeamPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  final Map<String, String> typeToImage = {
    'main': 'Main',
    'type1': 'Type 1',
    'type2': 'Type 2',
    'type3': 'Type 3',
    'type4': 'Type 4',
    'type5': 'Type 5',
    'type6': 'Type 6',
    'type7': 'Type 7',
    'type8': 'Type 8',
    'type9': 'Type 9',
    'type10': 'Type 10',
    'type11': 'Type 11',
    'type12': 'Type 12',
    'type13': 'Type 13',
    'type14': 'Type 14',
    'type15': 'Type 15',
    'type16': 'Type 16',
    'type17': 'Type 17',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Equipe"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'name',
                  decoration:
                      const InputDecoration(labelText: 'Nome da Equipe'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Nome é obrigatório'),
                    FormBuilderValidators.minLength(3,
                        errorText: 'Mínimo 3 caracteres'),
                  ]),
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  name: 'description',
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  maxLines: 3,
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  name: 'category',
                  decoration:
                      const InputDecoration(labelText: 'Categoria/Modalidade'),
                  validator: FormBuilderValidators.required(
                      errorText: 'Categoria é obrigatória'),
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  name: 'location',
                  decoration: const InputDecoration(labelText: 'Localização'),
                  validator: FormBuilderValidators.required(
                      errorText: 'Localização é obrigatória'),
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  name: 'captain_name',
                  decoration:
                      const InputDecoration(labelText: 'Nome do Capitão'),
                  validator: FormBuilderValidators.required(
                      errorText: 'Nome do capitão é obrigatório'),
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  name: 'captain_contact',
                  decoration:
                      const InputDecoration(labelText: 'Contato do Capitão'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Contato é obrigatório'),
                    FormBuilderValidators.numeric(errorText: 'Somente números'),
                  ]),
                ),
                const SizedBox(height: 15),
                FormBuilderDropdown(
                  name: 'equipment_type',
                  decoration:
                      const InputDecoration(labelText: 'Tipo de Equipamento'),
                  items: typeToImage.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.key, child: Text(e.value)))
                      .toList(),
                  validator: FormBuilderValidators.required(
                      errorText: 'Selecione um tipo'),
                ),
                const SizedBox(height: 15),
                FormBuilderDateTimePicker(
                  name: 'founded_at',
                  inputType: InputType.date,
                  decoration:
                      const InputDecoration(labelText: 'Data de Fundação'),
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  name: 'invite_code',
                  decoration:
                      const InputDecoration(labelText: 'Código de Convite'),
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  name: 'member_limit',
                  decoration: const InputDecoration(
                      labelText: 'Número máximo de integrantes'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Informe o número máximo'),
                    FormBuilderValidators.integer(
                        errorText: 'Deve ser um número inteiro'),
                    FormBuilderValidators.min(1,
                        errorText: 'Mínimo 1 integrante'),
                  ]),
                ),
                const SizedBox(height: 15),
                FormBuilderDropdown(
                  name: 'status',
                  decoration: const InputDecoration(labelText: 'Status'),
                  initialValue: 'pending',
                  items: const [
                    DropdownMenuItem(value: 'pending', child: Text('Pendente')),
                    DropdownMenuItem(
                        value: 'approved', child: Text('Aprovado')),
                    DropdownMenuItem(
                        value: 'rejected', child: Text('Rejeitado')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.saveAndValidate() ?? false) {
              final data = _formKey.currentState?.value;
              print("Formulário válido: $data");
              // TODO: enviar para o Supabase
            } else {
              print("Formulário inválido");
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text("Salvar Equipe"),
        ),
      ),
    );
  }
}
