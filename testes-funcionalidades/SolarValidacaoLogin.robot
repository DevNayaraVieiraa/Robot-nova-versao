*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
Test Setup       Configurar ambiente
Resource         Keywords/funcionalidadesLogin.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library  FakerLibrary
Library  String


*** Test Cases ***
Funcionalidades do portal SolarBPM
    [Tags]      login
    Login no solar BPM
    Acesso a notificações do SolarBPM
    Notificação - configurações
    

