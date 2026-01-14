*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
Test Setup       Configurar ambiente
resource         Keywords/solarBPMKeywords.resource
resource         Keywords/filaTrabalhoKeywords.resource
resource         Keywords/ecmKeywords.resource
Resource         Keywords/WorkflowKeywords.resource
Resource         Keywords/CESKeywords.resource
Resource         Keywords/moduloBPMKeywords.resource
Resource         Keywords/orgaoSetorKeywords.resource
Resource         Keywords/segKeywords.resource
Resource         Keywords/portalKeywords.resource
Resource         Keywords/serviceDiscoveryKeywords.resource
Resource         Keywords/LoginKeywords.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library  FakerLibrary
Library  String


*** Test Cases ***
Validações módulo SolarBPM
    [Tags]      SolarBPM
    Login no solar BPM
    Run Keyword And Continue On Failure    Cadastro de Processo/Documentos
    Run Keyword And Continue On Failure    Autuação de documento
    Run Keyword And Continue On Failure    Consulta de processos/Documentos
    Run Keyword And Continue On Failure    Consulta de processos/Documentos - Número
    Run Keyword And Continue On Failure    Consulta de processos/Documentos - Dados
    Run Keyword And Continue On Failure    Consulta de processos/Documentos - Consulta textual
    Run Keyword And Continue On Failure    Histórico de atividades
    Run Keyword And Continue On Failure    Materialização em segundo plano
    Run Keyword And Continue On Failure    Esepelho de processo
    Run Keyword And Continue On Failure    Relatório de processos/Documentos
    Run Keyword And Continue On Failure    Relatório de processos com prazo para andamento
    Run Keyword And Continue On Failure    Cadastro de classificação
    Run Keyword And Continue On Failure    Cadastro/Consulta de interessados

Validações em fila de trabalho
    [Tags]      Fila
    Login no solar BPM
    Run Keyword And Continue On Failure    Solicitação de assinaturas
    Run Keyword And Continue On Failure    Fila de trabalho - Meus processos
    Run Keyword And Continue On Failure    Fila de trabalho - Recebidos
    Run Keyword And Continue On Failure    Fila de trabalho - Não Recebidos
    Run Keyword And Continue On Failure    Fila de trabalho - Todos
    Run Keyword And Continue On Failure    Fila de trabalho - Tarefas

Validações em Workflow
    [Tags]      Workflow
    Login no solar BPM
    Run Keyword And Continue On Failure    Permitir acesso a minha fila de trabalho
    # Run Keyword And Continue On Failure    Acesso a filas de trabalho

Validações ECM
    [Tags]      ECM
    Login no solar BPM
    Run Keyword And Continue On Failure    Validar tela de modelo de documentos

Validação CES
    [Tags]      CES
    Login no solar BPM    
    Run Keyword And Continue On Failure    Areas de interesse
    Run Keyword And Continue On Failure    Serviços

Validações BPM
    [Tags]      BPM
    Login no solar BPM
    Run Keyword And Continue On Failure    BPM - Workspaces
    Run Keyword And Continue On Failure    BPM - Editor
    Run Keyword And Continue On Failure    BPM - Formulário dinâmico
    Run Keyword And Continue On Failure    BPM - Administrador

Validação ORG - Órgão Setor
    [Tags]      orgao
    Login no solar BPM
    Run Keyword And Continue On Failure    Cadastro de nível
    Run Keyword And Continue On Failure    Associação entre nível e tipo
    Run Keyword And Continue On Failure    Cadastro de órgaos
    Run Keyword And Continue On Failure    Cadastro de tipo de unidade
    Run Keyword And Continue On Failure    Cadastro de revisão

Validações SEG - Segurança
    [Tags]      SEG
    Run Keyword If    '${cliente}' == 'proPMF'           Validações SEG - Segurança - proPMF
    ...  ELSE                                            Validações SEG - Segurança - ${cliente}

Validações do portal externo
    [Tags]      PortalExterno
    Acesso portal externo
    Run Keyword And Continue On Failure    Portal externo - início    
    Run Keyword And Continue On Failure    Portal externo - Consulta de processos
    Run Keyword And Continue On Failure    Portal externo - Conferência de documentos
    Run Keyword And Continue On Failure    Portal externo - Solicitação de serviços
    Run Keyword And Continue On Failure    Portal externo - Login

Validações service discovery
    [Tags]    Service
    Login no solar BPM    
    Acessar o service discovery
    Conferir serviços api-docs
    healt check do api-docs

Validações Login
    [Tags]    Portal
    Login no solar BPM    
    Run Keyword And Continue On Failure    Login no portal
    Run Keyword And Continue On Failure    Telas de Notificações
    Run Keyword And Continue On Failure    Telas de Preferências
    Run Keyword And Continue On Failure    Telas de Perfil - Configurações    
    Run Keyword And Continue On Failure    Telas de Perfil - Opções de visualização
