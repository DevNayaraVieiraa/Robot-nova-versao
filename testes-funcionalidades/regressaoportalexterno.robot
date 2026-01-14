*** Settings ***    # Seção de configurações gerais do teste
Documentation    Testes automatizados de regressão do Portal Externo do Solar BPM
Test Setup       Configurar ambiente    # Executa antes de CADA teste
Resource         Keywords/solarBPMRegressaoPortalExternoKeywords.resource    # Importa keywords customizadas
Resource         Keywords/portalExternoKeywords.resource  # Importa keywords do portal externo
Library          Browser  run_on_failure=take screenshot    # Biblioteca para automação web (tira print ao falhar)


*** Variables ***    # Seção de variáveis globais
# Configurações do portal externo
${link_portal}        SEU_LINK_AQUI    # URL do portal a ser testado
${cliente}            NOME_DO_CLIENTE    # Nome do cliente para login
${login_gov_br}       False    # Define se usa login gov.br (True/False)
${usuario_portal}     SEU_CPF_AQUI    # CPF do usuário para login
${senha_portal}       SUA_SENHA_AQUI    # Senha do usuário


*** Test Cases ***    # Seção com os casos de teste
Acessar o portal externo
    [Tags]    acesso    portal    smoke    # Tags para filtrar testes na execução
    [Documentation]    Valida acesso ao portal externo    # Descrição do que o teste faz
    Abrir portal externo    # Keyword que abre o navegador e acessa o portal

Validar dados na tela inicio    # Valida elementos ou comportamento da tela
    [Tags]    inicio    smoke    validacao    # Tags para filtrar testes na execução
    [Documentation]    Valida dados da tela inicial    # Descrição do que o teste faz
    Abrir portal externo    # Keyword que abre o navegador e acessa o portal
    Get Text    body    *=    Planejamento e Sistemas    # Captura texto da página e valida
    Take Screenshot    # Tira print da tela

Validar dados na tela de consulta de processos    # Valida elementos ou comportamento da tela
    [Tags]    validacao    consulta    fluxo    # Tags para filtrar testes na execução
    [Documentation]    Valida tela e testa fluxo completo de consulta de processos    # Descrição do que o teste faz
    Acessar tela de consulta de processos    # Navega para a tela especificada
    Get Text    body    *=    Consulte o andamento de processos digitais    # Captura texto da página e valida
    Click    //i[normalize-space()='search']    # Clica em elemento
    Wait For Elements State    //span[@aria-label='Nome do órgão; PORTARIA MESA']    visible
    Click    //input[@name='PM']    # Clica em elemento
    Click    //button[normalize-space()='Confirmar seleção']    # Clica em elemento
    Fill Text    //input[@id='nuProcesso']    999999
    Fill Text    //input[@id='nuAno']    2025
    Click    //span[normalize-space()='Consultar']    # Clica em elemento
    Wait For Elements State    //p[@role='alert']    visible
    Get Text    //p[@role='alert']    *=    O processo/documento não foi encontrado    # Captura texto da página e valida
    Take Screenshot    # Tira print da tela

Validar dados na tela de conferência de documentos    # Valida elementos ou comportamento da tela
    [Tags]    validacao    conferencia    smoke    # Tags para filtrar testes na execução
    [Documentation]    Valida tela de conferência de documentos    # Descrição do que o teste faz
    Acessar tela de conferência de documentos    # Navega para a tela especificada
    Get Text    body    *=    Confira a autenticidade de uma cópia impressa    # Captura texto da página e valida
    Get Text    body    *=    Código do Documento    # Captura texto da página e valida
    Wait For Elements State    //span[normalize-space()='Consultar']    visible
    Take Screenshot    # Tira print da tela

Validar login e acesso ao portal    # Valida elementos ou comportamento da tela
    [Tags]    login    validacao    smoke    # Tags para filtrar testes na execução
    [Documentation]    Valida que consegue fazer login no portal    # Descrição do que o teste faz
    Fazer login no portal externo
    Get Text    body    *=    Meus Dados    # Captura texto da página e valida
    Take Screenshot    # Tira print da tela

Validar acesso a tela de meus dados    # Valida elementos ou comportamento da tela
    [Tags]    meus-dados    logado    validacao    # Tags para filtrar testes na execução
    [Documentation]    Valida acesso à tela de meus dados e campos disponíveis    # Descrição do que o teste faz
    Acessar tela de meus dados    # Navega para a tela especificada
    Validar campos da tela meus dados    # Valida elementos ou comportamento da tela

Validar logout do portal    # Valida elementos ou comportamento da tela
    [Tags]    logout    logado    validacao    # Tags para filtrar testes na execução
    [Documentation]    Valida que consegue fazer logout do portal    # Descrição do que o teste faz
    Fazer login no portal externo
    Fazer logout do portal externo

Validar trocar senha    # Valida elementos ou comportamento da tela
    [Tags]    senha    logado    validacao    # Tags para filtrar testes na execução
    [Documentation]    Valida acesso à tela de trocar senha e campos disponíveis    # Descrição do que o teste faz
    Acessar tela de trocar senha    # Navega para a tela especificada
    Validar campos da tela trocar senha    # Valida elementos ou comportamento da tela

Validar meus processos    # Valida elementos ou comportamento da tela
    [Tags]    processos    logado    validacao    # Tags para filtrar testes na execução
    [Documentation]    Valida acesso à tela de Meus Processos e elementos disponíveis    # Descrição do que o teste faz
    Acessar tela de meus processos    # Navega para a tela especificada
    Validar elementos da tela meus processos    # Valida elementos ou comportamento da tela

Validar minhas pendências    # Valida elementos ou comportamento da tela
    [Tags]    pendencias    logado    validacao    # Tags para filtrar testes na execução
    [Documentation]    Valida acesso à tela de Minhas Pendências e elementos disponíveis    # Descrição do que o teste faz
    Acessar tela de minhas pendências    # Navega para a tela especificada
    Validar elementos da tela minhas pendências    # Valida elementos ou comportamento da tela

Validar processos liberados    # Valida elementos ou comportamento da tela
    [Tags]    liberados    logado    validacao    # Tags para filtrar testes na execução
    [Documentation]    Valida acesso à tela de Processos Liberados    # Descrição do que o teste faz
    Acessar tela de processos liberados    # Navega para a tela especificada
    Validar elementos da tela processos liberados    # Valida elementos ou comportamento da tela

Validar solicitação de serviços    # Valida elementos ou comportamento da tela
    [Tags]    servicos    solicitacao    logado    validacao    # Tags para filtrar testes na execução
    [Documentation]    Valida acesso à tela de Solicitação de Serviços e elementos disponíveis    # Descrição do que o teste faz
    Acessar tela de solicitação de serviços    # Navega para a tela especificada
    Validar elementos da tela solicitação de serviços    # Valida elementos ou comportamento da tela
