*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
Test Setup       Configurar ambiente
resource         Keywords/solarBPMCadastrosKeywords.resource
resource         Keywords/configuracoesFilaKeywords.resource
resource         Keywords/ecmKeywords.resource
resource         Keywords/portalExternoKeywords.resource
Resource         Keywords/solarBPMConsultasKeywords.resource
Resource         Keywords/solarBPMTarefasKeywords.resource
Resource         Keywords/solarBPMOperacoesKeywords.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library  FakerLibrary
Library  String


*** Test Cases ***
Cadastrar processo digital e realizar consulta por dados
    [tags]   consultarProcessoDados
    ${texto_detalhamento}  Set Variable    Cadastro de processo para consulta por dados
    Set Global Variable    ${texto_detalhamento}
    Login no solar BPM
    Cadastrar processo digital
    Realizar consulta de processos/documentos por dados

Realizar consulta textual no SolarBPM
    [tags]    consultaTextual    
    Login no solar BPM
    Realizar consulta textual

Cadastrar e consultar processo no portal de atendimento
    [tags]    processoConsultaPortal
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para consunta em portal de atendimento
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar processo digital
    Consultar processo cadastrado no portal de atendimento

Consultar processo na fila de trabalho do SolarBPM
    [Tags]    processoFila
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para consulta na fila de trabalho
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar processo digital    
    Consultar processo na fila de trabalho

Consultar histórico de atividades e gerar relatório em xls
    [tags]   consultarHistorico
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para consulta de histórico de atividades
    Set Global Variable    ${texto_detalhamento}
    Login no solar BPM
    Cadastrar processo digital
    Consultar cadastro realizado - consulta por número de documento
    Clicar em encaminhar processo
    Realizar encaminhamento
    Acessar tela de Historico de Atividades
    Verificar existencia do botao "Exportar"
    Clicar no botao
    Conferir a mensagem de sucesso ao realizar download
    Conferir download do relatorio em xlsx

Validação do campo data de cadastro na consulta de processo por dados
    [tags]   consultarProcessosPorDados
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para consulta por dados
    Set Global Variable    ${texto_detalhamento}
    Login no solar BPM
    Cadastrar processo digital
    Cadastrar processo digital para consulta por dados
    Realizar consulta de processos/documentos por dados - campo detalhamento
    Validar campo Data de Abertura
    Validar se o campo abertura igual data atual
    Consulta do processo cadastrado
    Validar existência da seta de slide
    Consultar dados do processo clicado
    Clicar na seta