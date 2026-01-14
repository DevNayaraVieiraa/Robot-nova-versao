*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-checklist.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
BPM - Workspaces
    browser.go to  ${link_cliente}solar-bpm-frontend/#/workspace/tasks/instances/my#.do
    get text       //h1[@class='panel-title'][contains(.,'Workspace')]   *=    Workspace
    get text       //span[@class='sp-size-title ng-binding'][contains(.,'${texto_minhas_tarefas}')]   *=    ${texto_minhas_tarefas}
    Take Screenshot

BPM - Editor
    browser.go to  ${link_cliente}solar-bpm-frontend/#/development/area#.do
    get text       //h1[@class='panel-title'][contains(.,'Editor')]   *=    Editor
    get text       //span[@ng-show='$last'][contains(.,'Áreas')]   *=    Áreas
    Take Screenshot

BPM - Formulário dinâmico
    browser.go to  ${link_cliente}form-dinamico-web/#/hml#.do
    get text       //h1[contains(.,'${texto_form_dinamico}')]   *=    ${texto_form_dinamico}
    get text       //label[contains(.,'${texto_nome_form}')]   *=    ${texto_nome_form}
    Take Screenshot

BPM - Administrador
    browser.go to  ${link_cliente}solar-bpm-frontend/#/administrator/management
    get text       //h1[@class='panel-title'][contains(.,'Administração')]   *=    Administração
    get text       //span[@ng-show='$last'][contains(.,'Administração')]   *=    Administração
    Take Screenshot
