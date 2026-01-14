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
Resource         Keywords/solarBPMPastaDigitalKeywords.resource
Resource         Keywords/SolarBPMProcessoFluxo.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library  FakerLibrary
Library  String


*** Test Cases ***
Cadastrar processo com fluxo e acompanhar ate finalização
    [Tags]    processoFluxo
    Login no solar BPM
    Cadastrar processo com fluxo
    Finalizar "Tarefa para tomada de decisão" encaminhando para decisão 1
    Realizar reprovação em "Tarefa de decisão 1"
    Finalizar "Tarefa para tomada de decisão" encaminhando para decisão 2
    Realizar aprovação em "Tarefa de decisão 2"
    Inserir documento em tarefa para criação de pendencias de assinatura
    Realizar assinatura de documento em portal Portal externo
    Realizar assinatura de documento em portal interno
    Confirmar dados de tarefas finalizadas
    Confirmar dados de processo arquivado

