*** Settings ***    # Configurações do arquivo de recursos
Documentation    Keywords específicas para testes de regressão do portal externo
Library          Browser  # Biblioteca para automação web    # Importa biblioteca de automação web
Resource         portalexternokeywords.resource  # Importa keywords prontas de login    # Importa outro arquivo de recursos


*** Keywords ***    # Seção com keywords (funções) customizadas

Abrir portal externo    # Keyword para abrir/acessar tela
    [Documentation]    Abre o portal externo no navegador    # Descreve o que a keyword faz
    New Page    ${link_portal}  # Abre nova página com a URL do portal    # Abre nova página/aba
    Wait For Load State    networkidle  # Aguarda página carregar completamente


Acessar tela de conferência de documentos    # Keyword para abrir/acessar tela
    [Documentation]    Acessa a tela de conferência de documentos    # Descreve o que a keyword faz

    Abrir portal externo  # Primeiro abre o portal    # Keyword para abrir/acessar tela
    Click    //a[@aria-label='Conferência de Documentos']//span[contains(text(),'Conferência de Documentos')]    # Clica no elemento especificado
    Wait For Elements State    //h2    visible    10s  # Aguarda título da página aparecer    # Aguarda elemento ficar no estado especificado
    Take Screenshot  # Tira print da tela    # Tira print da tela atual


Acessar tela de consulta de processos    # Keyword para abrir/acessar tela
    [Documentation]    Acessa a tela de consulta de processos    # Descreve o que a keyword faz

    Abrir portal externo  # Primeiro abre o portal    # Keyword para abrir/acessar tela
    Click    //a[@aria-label='Consulta de Processos']//span[contains(text(),'Consulta de Processos')]    # Clica no elemento especificado
    Wait For Elements State    //h2[normalize-space()='Consulta de Processos']    visible    10s  # Aguarda título específico    # Aguarda elemento ficar no estado especificado
    Take Screenshot  # Tira print da tela    # Tira print da tela atual

Fazer login no portal externo
    [Documentation]    Faz login no portal externo    # Descreve o que a keyword faz

    Abrir portal externo  # Abre a página primeiro    # Keyword para abrir/acessar tela
    Realizar login no portal externo  # Usa keyword pronta de login


Acessar tela de meus dados    # Keyword para abrir/acessar tela
    [Documentation]    Acessa a tela de Meus Dados (requer login)    # Descreve o que a keyword faz

    Abrir portal externo  # Abre portal    # Keyword para abrir/acessar tela
    Realizar login no portal externo  # Faz login
    Click    //span[normalize-space()='Meus Dados']  # Clica no menu Meus Dados    # Clica no elemento especificado
    Wait For Elements State    //h2[normalize-space()='Editar Dados']    visible    30s  # Aguarda título da página (timeout aumentado)    # Aguarda elemento ficar no estado especificado
    Take Screenshot  # Print da tela de meus dados    # Tira print da tela atual

Fazer logout do portal externo
    [Documentation]    Faz logout do portal externo e valida que voltou para tela inicial    # Descreve o que a keyword faz
    Click    //span[normalize-space()='Sair']  # Clica no botão Sair    # Clica no elemento especificado
    Wait For Load State    networkidle  # Aguarda página carregar
    Wait For Elements State    //button[contains(text(),'Entrar')] | //a[contains(text(),'Entrar')] | //span[contains(text(),'Entrar')]    visible    10s    # Aguarda elemento ficar no estado especificado
    Take Screenshot  # Print da tela após logout    # Tira print da tela atual


Acessar tela de trocar senha    # Keyword para abrir/acessar tela
    [Documentation]    Acessa a tela de trocar senha no portal externo    # Descreve o que a keyword faz

    Abrir portal externo  # Abre portal    # Keyword para abrir/acessar tela
    Realizar login no portal externo  # Faz login
    Click    //a[@aria-label='Meus Dados']  # Clica no menu Meus Dados    # Clica no elemento especificado
    Wait For Elements State    //h2[normalize-space()='Editar Dados']    visible    30s  # Aguarda título (timeout aumentado)    # Aguarda elemento ficar no estado especificado
    Click    //span[normalize-space()='Trocar Senha']  # Clica em Trocar Senha    # Clica no elemento especificado
    Wait For Elements State    //input[@id='senhaAtual']    visible    10s    # Aguarda elemento ficar no estado especificado
    Take Screenshot  # Print da tela de trocar senha    # Tira print da tela atual


Validar campos da tela trocar senha    # Keyword para validar elementos
    [Documentation]    Valida que todos os campos da tela de trocar senha estão presentes    # Descreve o que a keyword faz
    Wait For Elements State    //input[@id='senhaAtual']    visible    10s  # Senha atual    # Aguarda elemento ficar no estado especificado
    Wait For Elements State    //input[@id='senha']    visible    10s  # Nova senha    # Aguarda elemento ficar no estado especificado
    Wait For Elements State    //input[@id='senha-confirmation']    visible    10s  # Confirmar senha    # Aguarda elemento ficar no estado especificado
    Wait For Elements State    //span[normalize-space()='Atualizar Senha']    visible    10s  # Botão atualizar    # Aguarda elemento ficar no estado especificado
    Get Text    body    *=    Senha atual    # Captura texto de elemento
    Get Text    body    *=    Nova senha    # Captura texto de elemento
    Take Screenshot    # Tira print da tela atual


Validar campos da tela meus dados    # Keyword para validar elementos
    [Documentation]    Valida campos adicionais na tela de Meus Dados    # Descreve o que a keyword faz
    Wait For Elements State    //input[@id='email']    visible    10s  # Campo email    # Aguarda elemento ficar no estado especificado
    Wait For Elements State    //span[contains(text(),'Incluir')]    visible    10s  # Botão incluir    # Aguarda elemento ficar no estado especificado
    Wait For Elements State    //span[normalize-space()='Salvar e continuar']    visible    10s  # Botão salvar    # Aguarda elemento ficar no estado especificado
    Get Text    body    *=    Editar Dados    # Captura texto de elemento
    Take Screenshot    # Tira print da tela atual


Acessar tela de meus processos    # Keyword para abrir/acessar tela
    [Documentation]    Acessa a tela de Meus Processos no portal externo    # Descreve o que a keyword faz

    Abrir portal externo  # Abre portal    # Keyword para abrir/acessar tela
    Realizar login no portal externo  # Faz login
    Click    //span[normalize-space()='Meus Processos']  # Clica no menu Meus Processos    # Clica no elemento especificado
    Wait For Load State    networkidle
    Wait For Elements State    //section[@aria-label='Informações do Usuário']    visible    10s    # Aguarda elemento ficar no estado especificado
    Take Screenshot    # Tira print da tela atual


Validar elementos da tela meus processos    # Keyword para validar elementos
    [Documentation]    Valida que todos os elementos da tela Meus Processos estão presentes    # Descreve o que a keyword faz
    Wait For Elements State    //section[@aria-label='Informações do Usuário']    visible    10s    # Aguarda elemento ficar no estado especificado
    Get Text    body    *=    Interessado teste - Robot    # Captura texto de elemento
    Wait For Elements State    //span[contains(text(),'Concluídos')]    visible    10s    # Aguarda elemento ficar no estado especificado
    Wait For Elements State    //span[normalize-space()='Planilha em XLS']    visible    10s    # Aguarda elemento ficar no estado especificado
    Get Text    body    *=    Meus Processos    # Captura texto de elemento
    Take Screenshot    # Tira print da tela atual


Acessar tela de minhas pendências    # Keyword para abrir/acessar tela
    [Documentation]    Acessa a tela de Minhas Pendências no portal externo    # Descreve o que a keyword faz

    Abrir portal externo  # Abre portal    # Keyword para abrir/acessar tela
    Realizar login no portal externo  # Faz login
    Click    //span[normalize-space()='Minhas Pendências']  # Clica no menu    # Clica no elemento especificado
    Wait For Load State    networkidle
    Wait For Elements State    //section[@aria-label='Informações do Usuário']    visible    10s    # Aguarda elemento ficar no estado especificado
    Take Screenshot    # Tira print da tela atual


Validar elementos da tela minhas pendências    # Keyword para validar elementos
    [Documentation]    Valida que todos os elementos da tela Minhas Pendências estão presentes    # Descreve o que a keyword faz
    Sleep    2s  # Aguarda navegação completar    # Pausa a execução por X segundos
    Get Text    body    *=    Minhas Pendências  # Validar texto principal PRIMEIRO    # Captura texto de elemento
    Wait For Elements State    //section[@aria-label='Informações do Usuário']    visible    10s    # Aguarda elemento ficar no estado especificado
    Get Text    body    *=    571.142.400-90    # Captura texto de elemento
    Wait For Elements State    //span[normalize-space()='Documento em PDF']    visible    10s    # Aguarda elemento ficar no estado especificado
    Wait For Elements State    //span[normalize-space()='Planilha em XLS']    visible    10s    # Aguarda elemento ficar no estado especificado
    Wait For Elements State    //span[normalize-space()='Consultar']    visible    10s    # Aguarda elemento ficar no estado especificado
    Take Screenshot    # Tira print da tela atual


Acessar tela de processos liberados    # Keyword para abrir/acessar tela
    [Documentation]    Acessa a tela de Processos Liberados no portal externo    # Descreve o que a keyword faz

    Abrir portal externo  # Abre portal    # Keyword para abrir/acessar tela
    Realizar login no portal externo  # Faz login
    Click    //a[@aria-label='Processos Liberados']//span[contains(text(),'Processos Liberados')]    # Clica no elemento especificado
    Wait For Load State    networkidle
    Take Screenshot    # Tira print da tela atual


Validar elementos da tela processos liberados    # Keyword para validar elementos
    [Documentation]    Valida que elementos da tela Processos Liberados estão presentes    # Descreve o que a keyword faz
    Get Text    body    *=    Processos Liberados    # Captura texto de elemento
    Take Screenshot    # Tira print da tela atual


Acessar tela de solicitação de serviços    # Keyword para abrir/acessar tela
    [Documentation]    Acessa a tela de Solicitação de Serviços no portal externo    # Descreve o que a keyword faz

    Abrir portal externo  # Abre portal    # Keyword para abrir/acessar tela
    Realizar login no portal externo  # Faz login
    Click    //a[@aria-label='Solicitação de Serviços']//span[contains(text(),'Solicitação de Serviços')]    # Clica no elemento especificado
    Wait For Load State    networkidle
    Wait For Elements State    //h2[@aria-label='Solicitação de Serviços']    visible    10s    # Aguarda elemento ficar no estado especificado
    Take Screenshot    # Tira print da tela atual


Validar elementos da tela solicitação de serviços    # Keyword para validar elementos
    [Documentation]    Valida que elementos da tela Solicitação de Serviços estão presentes    # Descreve o que a keyword faz
    Wait For Elements State    //h2[@aria-label='Solicitação de Serviços']    visible    10s    # Aguarda elemento ficar no estado especificado
    Get Text    body    *=    Solicitação de Serviços    # Captura texto de elemento
    Take Screenshot    # Tira print da tela atual