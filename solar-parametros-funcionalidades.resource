*** Settings ***
Documentation    Suite description
Library  Browser
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library  FakerLibrary    locale=pt_BR
Resource  solar-login.resource

*** variables ***
${browser}  chromium
${headless}  false
${screen_width}  1920
${screen_heigth}  1080

*** keywords ***
Configurar ambiente
    Browser.New Browser  browser=${browser}  headless=${false}
    Browser.New Context  viewport={'width': ${screenwidth}, 'height': ${screen_heigth}}  ignoreHTTPSErrors=True  acceptDownloads=True
    Set Browser Timeout    25s
    Run Keyword If    '${cliente}' == 'preBarueri'       Configuração de ambiente em PRE - Barueri
    ...  ELSE IF      '${cliente}' == 'intDES'           Configuração de ambiente - Interna DES
    ...  ELSE IF      '${cliente}' == 'intDES2'          Configuração de ambiente - Interna DES2
    ...  ELSE IF      '${cliente}' == 'intCOR'           Configuração de ambiente - Interna COR
    ...  ELSE IF      '${cliente}' == 'intPRDT'          Configuração de ambiente - Interna Produto DES
    ...  ELSE IF      '${cliente}' == 'hmlMPSC'          Configuração de ambiente - MPSC HML
    ...  ELSE IF      '${cliente}' == 'Peru'             Configuração de ambiente - Internacionalização Peru
    ...  ELSE IF      '${cliente}' == 'hmlIMA'           Configuração de ambiente - HML IMA
    ...  ELSE IF      '${cliente}' == 'desPMF'           Configuração de ambiente - PMF DES
    ...  ELSE IF      '${cliente}' == 'hmlItapevi'       Configuração de ambiente - HML Itapevi
    ...  ELSE IF      '${cliente}' == 'hmlSemil'         Configuração de ambiente - Homologue Semil
    ...  ELSE IF      '${cliente}' == 'hmlCopasa'        Configuração de ambiente - HML Copasa
    ...  ELSE IF      '${cliente}' == 'hmlCamDiadema'    Configuração de ambiente - HML Camara de Diadema
    ...  ELSE          fail                              Informar sigla de cliente. (Obs.: Não pode ser executado em PRO)           

Configuração de ambiente - Interna DES
    browser.delete all cookies
    ${link_cliente}  set variable  https://solarbpm-des.ungp.softplan.com.br/
    ${link_portal}  set variable   https://solarbpm-des.ungp.softplan.com.br/atendimento/inicio
    set global variable  ${link_cliente}
    set global variable  ${link_portal}
    ${user_robot}  set variable    ROBOT  #softplan  #ROBOT
    ${senha_robot}  set variable   SolarRobot@1  #Soft@2025   #SolarRobot@
    ${orgao}      Set Variable   SolarBPM
    ${internacional}  Set Variable  nao
    ${setor_encaminhamento}   Set Variable     SETOR1
    ${desc_setor_encaminhamento}   Set Variable     Setor um para teste de encaminhamento
    ${tipo_de_login}       set variable    padrao
    Set Global Variable    ${user_robot}     
    Set Global Variable    ${senha_robot}
    Set Global Variable    ${orgao}
    Set Global Variable    ${internacional}
    Import Variables       ${CURDIR}\\variaveis\\vars_pt.py
    Import Variables       ${CURDIR}\\variaveis\\vars_des.py
    Set Global Variable    ${tipo_de_login}

Configuração de ambiente - Interna DES2
    browser.delete all cookies
    ${link_cliente}  set variable  https://solarbpm-des2.ungp.softplan.com.br/
    ${link_portal}  set variable   https://solarbpm-des2.ungp.softplan.com.br/atendimento/inicio
    ${link_cliente_interncional}   set variable   https://solarbpm-des2.ungp.softplan.com.br/portal/
    ${user_robot}  set variable    ROBOT
    ${senha_robot}  set variable   SolarRobot@1
    ${orgao}      Set Variable   SolarBPM
    ${internacional}  Set Variable  nao
    ${service_discovery}   Set Variable  des
    ${user_service_discovery}  Set Variable    softplan
    ${senha_service_discovery}  Set Variable   Z5jJ6uzy1NTVU7Xc
    ${setor_encaminhamento}   Set Variable     SETOR1
    ${desc_setor_encaminhamento}   Set Variable     Setor um para teste de encaminhamento
    ${tipo_de_login}    Set Variable  padrao
    set global variable  ${link_cliente}
    set global variable  ${link_portal}
    Set Global Variable    ${service_discovery}    
    Set Global Variable    ${user_robot}     
    Set Global Variable    ${senha_robot}
    Set Global Variable    ${orgao}
    Set Global Variable    ${internacional}
    Set Global Variable    ${service_discovery}
    Set Global Variable    ${link_cliente_interncional}
    Set Global Variable    ${user_service_discovery}
    Set Global Variable    ${senha_service_discovery}
    Set Global Variable    ${setor_encaminhamento}
    Set Global Variable    ${desc_setor_encaminhamento}    
    Import Variables       ${CURDIR}\\variaveis\\vars_pt.py
    Import Variables       ${CURDIR}\\variaveis\\vars_des2.py
    Set Global Variable    ${tipo_de_login}

Configuração de ambiente - Interna COR
    browser.delete all cookies
    ${link_cliente}  set variable  https://solarbpm-cor.ungp.softplan.com.br/
    ${link_portal}  set variable   https://solarbpm-cor.ungp.softplan.com.br/atendimento/inicio
    set global variable  ${link_cliente}
    set global variable  ${link_portal}
    ${user_robot}  set variable    ROBOT
    ${senha_robot}  set variable   123456
    ${orgao}      Set Variable   SolarBPM
    ${internacional}  Set Variable  nao
    ${setor_encaminhamento}   Set Variable     SETOR1
    ${desc_setor_encaminhamento}   Set Variable     Setor um para teste de encaminhamento
    ${tipo_de_login}    set variable  padrao
    Set Global Variable    ${user_robot}     
    Set Global Variable    ${senha_robot}
    Set Global Variable    ${orgao}
    Set Global Variable    ${setor_encaminhamento}
    Set Global Variable    ${desc_setor_encaminhamento}    
    Import Variables       ${CURDIR}\\variaveis\\vars_pt.py
    Import Variables       ${CURDIR}\\variaveis\\vars_cor.py    
    Set Global Variable    ${internacional}    
    Set Global Variable    ${tipo_de_login}

Configuração de ambiente - Interna Produto DES
    browser.delete all cookies
    ${link_cliente}  set variable  https://solarbpm-prdt-des.ungp.softplan.com.br/
    ${link_portal}  set variable   https://solarbpm-prdt-des.ungp.softplan.com.br/atendimento/inicio
    set global variable  ${link_cliente}
    set global variable  ${link_portal}
    ${service_discovery}   Set Variable  SolarBPM
    ${user_service_discovery}  Set Variable    softplan
    ${senha_service_discovery}  Set Variable   U29mdHBsYW4yMDE3    
    ${user_robot}  set variable    ROBOT
    ${senha_robot}  set variable   SolarRobot@11
    ${orgao}      Set Variable   SolarBPM
    ${internacional}  Set Variable  nao
    ${tipo_de_login}    Set Variable  padrao
    Set Global Variable    ${user_robot}     
    Set Global Variable    ${senha_robot}
    Set Global Variable    ${service_discovery}    
    Set Global Variable    ${user_service_discovery}
    Set Global Variable    ${senha_service_discovery}
    Set Global Variable    ${orgao}
    Import Variables       ${CURDIR}\\variaveis\\vars_prdtDES.py
    Set Global Variable    ${internacional}    
    Set Global Variable    ${tipo_de_login}

Configuração de ambiente - Internacionalização Peru
    browser.delete all cookies
    ${link_cliente}  set variable  https://solarbpm-prdt-internacional-des.ungp.softplan.com.br/
    ${link_portal}  set variable   https://solarbpm-prdt-internacional-des.ungp.softplan.com.br/atendimento
    ${link_cliente_interncional}   set variable   https://solarbpm-prdt-internacional-des.ungp.softplan.com.br/portal
    set global variable  ${link_cliente}
    set global variable  ${link_portal}
    ${user_robot}  set variable    SOFTPLAN
    ${senha_robot}  set variable   1
    ${orgao}      Set Variable   SOLARBPM
    ${internacional}  Set Variable  sim
    ${setor_encaminhamento}   Set Variable     SETOR1
    ${desc_setor_encaminhamento}   Set Variable     Setor um para teste de encaminhamento
    ${tipo_de_login}    Set Variable    padrao
    Set Global Variable    ${user_robot}     
    Set Global Variable    ${senha_robot}
    Set Global Variable    ${orgao}
    Set Global Variable    ${link_cliente_interncional}
    Set Global Variable    ${internacional}
    Set Global Variable    ${setor_encaminhamento}
    Set Global Variable    ${desc_setor_encaminhamento}    
    Import Variables       ${CURDIR}\\variaveis\\vars_es-peru.py
    Set Global Variable    ${tipo_de_login}