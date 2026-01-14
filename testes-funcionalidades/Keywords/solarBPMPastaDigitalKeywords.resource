*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-funcionalidades.resource
Resource         solarBPMCadastrosKeywords.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library    String

*** Keywords ***
Realizar assinatura
    Click    iframe#frameNPasta >>> //*[@id="sds-layout"]/div[3]/aside/div[2]/div[2]/div/div[2]/div/button[3]
    Click    iframe#frameNPasta >>> (//div[contains(.,'Assinar selecionado(s)')])[6]
    Fill text    //*[@id="frameNPasta"] >>> //*[@id="app"]/div[8]/div/div/div[2]/iframe >>> //input[@type='password']    ${senha_robot}
    click        //*[@id="frameNPasta"] >>> //*[@id="app"]/div[8]/div/div/div[2]/iframe >>> //button[normalize-space()='Assinar']
    
Validar assinatura realizada
    log      implementar    
    Sleep    5s

Solicitar assinatura de interessado
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${texto_tarefa_assinatura}   Set Variable         Tarefa de assinatura externa (id - ${id_detalhamento})
    Set Global Variable    ${texto_tarefa_assinatura}
    Click    iframe#frameNPasta >>> //*[@id="sds-layout"]/div[3]/aside/div[2]/div[2]/div/div[2]/div/button[3]
    Click    iframe#frameNPasta >>> (//div[contains(.,'Solicitar assinatura (interessados)')])[6]
    fill text     iframe#frameNPasta >>> //*[@id="app"]/div[8]/div/div/div[2]/iframe >>> //textarea[contains(@id,'descricao')]      ${texto_tarefa_assinatura}
    Click         iframe#frameNPasta >>> //*[@id="app"]/div[8]/div/div/div[2]/iframe >>> //label[@for='check_aceita_assinatura_sistema'][contains(.,'Aceitar assinatura eletrônica do sistema')]
    Click         iframe#frameNPasta >>> //*[@id="app"]/div[8]/div/div/div[2]/iframe >>> //button[contains(.,'Criar tarefa')]

