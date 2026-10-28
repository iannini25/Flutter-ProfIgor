# Laudo tecnico - Operacao Resgate

## Bug 1
**Arquivo:** pubspec.yaml
**Sintoma:** o flutter pub get dava erro e o projeto nem abria.
**Causa:** o device_preview ^1.3.1 precisa do Dart 3.8 e o nosso flutter e o 3.27 (Dart 3.6). Tambem nao tinha dev_dependencies (flutter_test e flutter_lints), entao o teste e o analysis_options davam erro.
**Correcao:** mudei pra device_preview: ^1.2.0 e coloquei o flutter_test e flutter_lints no dev_dependencies.
**Teste:** rodei flutter pub get e flutter analyze e nao deu mais erro.

## Bug 2
**Arquivo:** test/widget_test.dart
**Sintoma:** erro no analisador, nao achava o pacote nem a classe MyApp.
**Causa:** o teste era o do contador padrao, importava package:bugsresolver mas o pacote se chama central_achados e nao existe MyApp.
**Correcao:** troquei o import pra central_achados e fiz um teste simples criando uma Ocorrencia.
**Teste:** flutter test passou.

## Bug 3
**Arquivo:** lib/pages/central_page.dart
**Sintoma:** erro de compilacao na linha do subtitle da lista.
**Causa:** a string com aspas simples estava quebrada em duas linhas, ai nao fecha.
**Correcao:** juntei numa linha so e usei \n antes do "Por".
**Teste:** o app compilou e aparece o local, status e o nome em baixo.

## Bug 4
**Arquivo:** lib/pages/central_page.dart
**Sintoma:** erro de compilacao ao abrir o detalhe.
**Causa:** chamava DetalhePage() sem passar a ocorrencia, e ela e obrigatoria (required).
**Correcao:** DetalhePage(ocorrencia: o).
**Teste:** cliquei numa ocorrencia e abriu o detalhe certo dela.

## Bug 5
**Arquivo:** lib/pages/central_page.dart
**Sintoma:** dava pra registrar objeto sem titulo ou sem local.
**Causa:** a validacao usava && entao so bloqueava se os dois estivessem vazios.
**Correcao:** troquei pra ||.
**Teste:** tentei registrar so com o titulo e apareceu a mensagem "Informe titulo e local".

## Bug 6
**Arquivo:** lib/pages/central_page.dart
**Sintoma:** o switch "Somente nao resolvidos" nao mudava / ficava ao contrario.
**Causa:** no onChanged estava somenteAbertos = !value.
**Correcao:** somenteAbertos = value.
**Teste:** cliquei no switch e ele liga e desliga normal.

## Bug 7
**Arquivo:** lib/pages/central_page.dart
**Sintoma:** com o filtro ligado aparecia so os resolvidos.
**Causa:** o where pegava o.resolvido.
**Correcao:** mudei pra !o.resolvido.
**Teste:** marquei um como resolvido e ele sumiu da lista com o filtro ligado.

## Bug 8
**Arquivo:** lib/models/ocorrencia.dart
**Sintoma:** objeto novo aparecia como "Resolvido" e os resolvidos como "Em aberto".
**Causa:** tinha um ! no resolvido, invertendo o valor que vinha do banco.
**Correcao:** tirei o !.
**Teste:** registrei um objeto e apareceu "Em aberto".

## Bug 9
**Arquivo:** lib/models/ocorrencia.dart
**Sintoma:** o botao de marcar como resolvido nao aparecia nem pro dono.
**Causa:** o autorId estava lendo o campo 'autorNome' do documento.
**Correcao:** mudei pra d['autorId'].
**Teste:** com a conta que registrou o botao aparece.

## Bug 10
**Arquivo:** lib/services/central_service.dart
**Sintoma:** no Firestore o autorId ficava com o email da pessoa e a comparacao com o uid nunca batia.
**Causa:** no registrar estava 'autorId': u.email.
**Correcao:** 'autorId': u.uid.
**Teste:** olhei no console do Firestore e o autorId agora e o uid, e o dono consegue mudar o status.

## Bug 11
**Arquivo:** lib/services/central_service.dart
**Sintoma:** as ocorrencias novas iam pro final da lista.
**Causa:** o orderBy do criadoEm estava com descending: false.
**Correcao:** descending: true, pra mais nova ficar em cima.
**Teste:** registrei dois objetos e o ultimo ficou em primeiro.

## Bug 12
**Arquivo:** lib/services/central_service.dart
**Sintoma:** clicava em "Marcar como resolvido" e nada mudava.
**Causa:** o update salvava o mesmo valor que ja estava (item.resolvido).
**Correcao:** salvar !item.resolvido.
**Teste:** marquei como resolvido, voltou pra lista com "Resolvido", e depois o "Reabrir" voltou pra "Em aberto".

## Bug 13
**Arquivo:** lib/services/central_service.dart
**Sintoma:** a pista nao aparecia na ocorrencia, no Firestore ela ia pra um documento chamado "pistas".
**Causa:** usava doc('pistas') no lugar do id da ocorrencia.
**Correcao:** doc(ocorrenciaId).
**Teste:** mandei uma pista na conta B e ela apareceu na ocorrencia certa nas duas contas.

## Bug 14
**Arquivo:** lib/pages/detalhe_page.dart
**Sintoma:** escrevia a pista e apertava enviar e nao acontecia nada (e se tava vazio tentava mandar).
**Causa:** o if estava isNotEmpty (saia quando tinha texto) e o enviarPista mandava '' em vez do texto.
**Correcao:** troquei pra isEmpty e passei pista.text.
**Teste:** com o campo vazio nao envia, com texto a pista aparece na lista.

## Configuracao
Criei o lib/firebase_options.dart com os dados do projeto no Firebase (o zip nao tinha), ativei o login com Google e coloquei as regras do Firestore (so usuario logado le e escreve e so o dono pode mudar o resolvido).
