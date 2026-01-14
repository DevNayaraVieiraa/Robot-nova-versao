*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-checklist.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Login no portal
    Run Keyword And Continue On Failure    Get Element States    //div[@class='MuiSnackbar-root MuiSnackbar-anchorOriginTopRight css-ewkdv9']   not contains    visible
    Get Text    //span[normalize-space()='Página inicial']   *=   Página inicial
    Get Text    //span[normalize-space()='Notificações']     *=   Notificações
    get text    //span[normalize-space()='Ajuda']            *=   Ajuda
    get text    //span[normalize-space()='Preferências']     *=   Preferências
    get text    //span[normalize-space()='Perfil']           *=   Perfil

Telas de Notificações
    Click    //span[normalize-space()='home']
    Click    //span[normalize-space()='notifications']
    Get Text    //h3[@id='modal-modal-title']    *=    Notificações
    Click    //span[normalize-space()='Ver todas']
    Get Text    //h2[normalize-space()='Notificações']    *=    Notificações
    get text    //h3[@id='modal-modal-title']    *=    Quadro de notificações

Telas de Preferências
    click       //span[normalize-space()='home']
    Click       //span[normalize-space()='important_devices']
    Get Text    //*[@id="iframe-1"] >>> //section[@class='titlebar-container']    *=    Perfil do Usuário
    Get Text    //*[@id="iframe-1"] >>> //h6[normalize-space()='Instruções para acesso mobile']    *=    Instruções para acesso mobile
    Click       //*[@id="iframe-1"] >>> //strong[@class='card-options-list__action']
    Get Text    //*[@id="iframe-1"] >>> //h6[normalize-space()='Tipo de Assinatura']    *=    Tipo de Assinatura
    Get Text    //*[@id="iframe-1"] >>> //h6[normalize-space()='Padrão de Assinatura']    *=    Padrão de Assinatura
    Get Text    //*[@id="iframe-1"] >>> //h6[normalize-space()='Preferências na Pasta digital']    *=    Preferências na Pasta digital
    Get Text    //*[@id="iframe-1"] >>> //strong[contains(text(),'Informe suas preferências para utilização na pasta')]    *=    Informe suas preferências para utilização na pasta digital dos processos

Telas de Perfil - Opções de visualização
    click    //span[normalize-space()='home']
    Click    //span[normalize-space()='account_circle']
    Click    //span[normalize-space()='Opções de visualização']
    Get Text    //h3[normalize-space()='Cor do menu lateral']    *=    Cor do menu lateral
    Get Text    //h3[normalize-space()='Tela cheia']    *=    Tela cheia

Telas de Perfil - Configurações
    click    //span[normalize-space()='home']
    Click    //span[normalize-space()='account_circle']
    Click    //span[normalize-space()='Configurações']
    Get Text    //h2[normalize-space()='Configurações']    *=    Configurações