*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-funcionalidades.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Validar acesso a portal externo    
    get text    //*[@id="main-content"]/section/section[1]/div/div[1]/a/div/h3/span   *=  ABERTURA DE SERVIÇOS
    browser.Take Screenshot

Consultar processo no portal externo
    Click    (//span[contains(.,'Consulta de Processos')])[1]
    Fill Text    //input[contains(@id,'sgOrgao')]    ${orgao}
    Press Keys    //input[contains(@id,'sgOrgao')]    Tab
    Fill Text    //input[contains(@id,'nuProcesso')]    100
    Fill Text    //input[contains(@id,'nuAno')]    2024
    Click    //span[contains(.,'Consultar')]
    get text  //p[@class='jss3 jss11 jss26'][contains(.,'Solicitação Nº: PMB 000100/2024')]   *=  PMB 000100/2024
    Take Screenshot

Realizar login no portal externo
    Delete All Cookies
    Go To    ${link_portal}
    Click    //*[@id="root"]/div/div/nav/ul/li[5]/a/span
    Run Keyword If    '${login_gov_br}' == 'True'     Validar com GovBr
    ...      ELSE     Validar com login e senha do sistema

Validar com GovBr
    Click       (//span[normalize-space()='Login e senha do sistema'])[1]
    Fill Text    //*[@id="identificacao"]    571.142.400-90
    Fill Text    //*[@id="senha"]          SolarRobot@1
    Click    //*[@id="main-content"]/section/section/div[2]/div[1]/div[2]/div[1]/form/div[3]/button/span

Validar com login e senha do sistema
    Fill Text    //*[@id="identificacao"]    571.142.400-90
    Fill Text    //*[@id="senha"]          SolarRobot@1
    Click    //*[@id="main-content"]/section/section/div[2]/div[1]/div[2]/div[1]/form/div[3]/button/span

Pesquisar pendencia de documento e realizar assinatura
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${texto_assinatura_portal_externo}   Set Variable         Documento assinado pelo portal externo (id - ${id_detalhamento})
    Set Global Variable    ${texto_assinatura_portal_externo}
    Click       (//span[contains(.,'Minhas Pendências')])[1]
    Get Text    (//span[contains(.,'Minhas Pendências')])[2]   *=   Minhas Pendências
    Click       //a[contains(.,'${processo_cadastrado}')]
    Get Text    //span[contains(.,'${detalhamento}')]   *=  ${detalhamento}
    Click    (//span[contains(.,'Resolver Pendência')])[2]
    Get Text    //span[contains(.,'${texto_tarefa_assinatura}')]   *=   ${texto_tarefa_assinatura}
    click       //input[@type='checkbox']
    Fill Text    //textarea[contains(@id,'de_descricao')]    ${texto_assinatura_portal_externo}
    click    //span[contains(.,'Concluir tarefa')]
    Click        //*[@id="iframeGdoc"] >>> //html/body/div[1]/div/div[1]/signature-type-selector/div/div/div/div/selectable-card[3]/div/div/img
    Fill Text    //*[@id="iframeGdoc"] >>> //input[@type='password']    SolarRobot@1
    Click    //*[@id="iframeGdoc"] >>> //button[contains(@class,'btn btn-primary btAssinaturaUsuario')]
    Get Text     //span[contains(.,'Pendência finalizada com sucesso!')]   *=     Pendência finalizada com sucesso!

Pesquisar pendencia e responder comunique-se
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${texto_resposta_comuniquese}   Set Variable         Comunique-se respondido no portal externo (id - ${id_detalhamento})
    Set Global Variable    ${texto_resposta_comuniquese}
    Click       (//span[contains(.,'Minhas Pendências')])[1]
    Get Text    (//span[contains(.,'Minhas Pendências')])[2]   *=   Minhas Pendências
    Click       //a[contains(.,'${processo_cadastrado}')]
    Get Text    //span[contains(.,'${detalhamento}')]   *=  ${detalhamento}
    Click    (//span[contains(.,'Resolver Pendência')])[2]

    Get Text    //span[contains(.,'${texto_tarefa_comuniquese}')]   *=   ${texto_tarefa_comuniquese}
    Fill Text    //textarea[contains(@id,'de_descricao')]    ${texto_resposta_comuniquese}
    click    //span[contains(.,'Concluir tarefa')]