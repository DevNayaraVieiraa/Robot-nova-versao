*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-checklist.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Solicitação de assinaturas
    Click    //div[contains(@id,'system-FILA DE TRABALHO')]
    Click    //*[@id="portal-content"]/aside/div[1]/div/div/div/nav/ul/div/div[2]/div/div/div/div/ul/div[1]/div[2]/div/div/div/div/ul/div/div/div/div/span
    get text  //*[@id="iframe-1"] >>> //h1[@class='sc-htpNat bobHIj'][contains(.,'${texto_solicitacao_assinatura}')]   *=    ${texto_solicitacao_assinatura}
    Take Screenshot

Fila de trabalho - Meus processos
    Click    //*[@id="portal-content"]/aside/div[1]/div/div/div/nav/ul/div/div[2]/div/div/div/div/ul/div[2]/div[2]/div/div/div/div/ul/div[1]/div/div/div/span
    get text       //*[@id="iframe-2"] >>> //h1[contains(.,'${texto_processos_fila_trabalho}')]   *=    ${texto_processos_fila_trabalho}
    Take Screenshot

Fila de trabalho - Recebidos
    Click    //*[@id="portal-content"]/aside/div[1]/div/div/div/nav/ul/div/div[2]/div/div/div/div/ul/div[2]/div[2]/div/div/div/div/ul/div[2]/div/div[1]/div/span
    get text       //*[@id="iframe-3"] >>> //h1[contains(.,'${texto_processos_fila_trabalho}')]   *=    ${texto_processos_fila_trabalho}
    Take Screenshot

Fila de trabalho - Não Recebidos
    Click    //*[@id="portal-content"]/aside/div[1]/div/div/div/nav/ul/div/div[2]/div/div/div/div/ul/div[2]/div[2]/div/div/div/div/ul/div[3]/div/div/div/span
    get text       //*[@id="iframe-4"] >>> //h1[contains(.,'${texto_processos_fila_trabalho}')]   *=    ${texto_processos_fila_trabalho}
    Take Screenshot

Fila de trabalho - Todos
    Click    //*[@id="portal-content"]/aside/div[1]/div/div/div/nav/ul/div/div[2]/div/div/div/div/ul/div[2]/div[2]/div/div/div/div/ul/div[4]/div/div[1]/div/span
    get text       //*[@id="iframe-5"] >>> //h1[contains(.,'${texto_processos_fila_trabalho}')]   *=    ${texto_processos_fila_trabalho}
    Take Screenshot

Fila de trabalho - Tarefas
    Click    //*[@id="portal-content"]/aside/div[1]/div/div/div/nav/ul/div/div[2]/div/div/div/div/ul/div[2]/div[2]/div/div/div/div/ul/div[5]/div/div[1]/div/span
    get text       //*[@id="iframe-6"] >>> //h1[contains(.,'${texto_processos_fila_trabalho}')]   *=    ${texto_processos_fila_trabalho}
    Take Screenshot

