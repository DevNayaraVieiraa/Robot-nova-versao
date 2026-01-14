*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-funcionalidades.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  FakerLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String

*** Keywords ***
Acesso a notificações do SolarBPM
    ${id_texto_notificacao}    FakerLibrary.Random Int  min=0000  max=9999
    ${texto_notificacao}       set variable     Notificação Teste Robot (id - ${id_texto_notificacao})

    click    (//span[contains(.,'notifications')])[1]
    Get Text    //h3[@tabindex='0']    *=    Notificações
    click      //button[contains(.,'notifications')]
    get text   //span[@class='MuiTypography-root MuiTypography-body1 css-f7x5qe'][contains(.,'Criar mensagem')]    *=   Criar mensagem
    click      //span[@class='MuiTypography-root MuiTypography-body1 css-f7x5qe'][contains(.,'Criar mensagem')]
    get text   //h3[contains(@id,'modal-Nova notificação')]    *=  Nova notificação
    
    click      //div[contains(@id,'categoria')]
    click      //li[contains(.,'Informativos')]

    click      //div[contains(@id,'sistemas')]
    click      //li[contains(.,'CPAV')]
    fill text  //input[contains(@id,'subjectMessage')]   ${texto_notificacao}
    fill text  //textarea[contains(@aria-invalid,'false')]      ${texto_notificacao}
    click      //span[contains(.,'Enviar')]
    get text    //span[contains(.,'Mensagem de notificação criada com sucesso!')]   *=    Mensagem de notificação criada com sucesso!

    click    (//span[contains(.,'notifications')])[1]
    Get Text    //h3[@tabindex='0']    *=    Notificações
    click      //span[contains(.,'Ver todas')]
    Click   (//span[@class='MuiTypography-root MuiTypography-body1 css-plxt41'])[1] 
    get text   (//span[contains(.,'${texto_notificacao}')])[2]    *=    ${texto_notificacao}


Notificação - configurações
    click    (//span[contains(.,'notifications')])[1]
    Get Text    //h3[@tabindex='0']    *=    Notificações
    click       xpath=//html/body/div[11]/div[3]/div/div[1]/div/button[3]/div/span
#                /html/body/div[11]/div[3]/div/div[1]/div/button[3]/div/span

    get text   //h3[contains(@id,'modal-modal-title')]   *=   Configurações
    get text   (//span[@class='MuiTypography-root MuiTypography-body1 css-f7x5qe'])[2]    *=    Visão Geral
    get text   (//span[contains(.,'Tarefas')])[2]       *=   Tarefas

    click    //span[contains(.,'Ajuste de Setores')]
    get text    //h4[contains(.,'Setores do Usuário:')]   *=   Setores do Usuário:

    click    //button[contains(.,'dvrTemplates')]
    get text   //span[@class='MuiTypography-root MuiTypography-body1 css-t54qds']    *=    Configuração de Templates de E-mail: Nesta tela, você pode criar e personalizar templates de e-mail, com suporte para formatos de texto simples e HTML estruturado.


    