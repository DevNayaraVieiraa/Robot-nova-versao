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
    Set Browser Timeout    30s
    Run Keyword If    '${cliente}' == 'preBarueri'       Configuração de ambiente em PRE - Barueri
    ...  ELSE IF      '${cliente}' == 'proBarueri'       Configuração de ambiente em PRO - Barueri    
    ...  ELSE IF      '${cliente}' == 'hmlPiracicaba'    Configuração de ambiente - hmlPiracicaba
    ...  ELSE IF      '${cliente}' == 'proPiracicaba'    Configuração de ambiente - proPiracicaba
    ...  ELSE IF      '${cliente}' == 'intDES'           Configuração de ambiente - Interna DES
    ...  ELSE IF      '${cliente}' == 'intDES2'          Configuração de ambiente - Interna DES2
    ...  ELSE IF      '${cliente}' == 'intCOR'           Configuração de ambiente - Interna COR
    ...  ELSE IF      '${cliente}' == 'intPRDT'          Configuração de ambiente - Interna Produto DES
    ...  ELSE IF      '${cliente}' == 'hmlMPSC'          Configuração de ambiente - MPSC HML
    ...  ELSE IF      '${cliente}' == 'preMPSC'          Configuração de ambiente - MPSC PRE
    ...  ELSE IF      '${cliente}' == 'proMPSC'          Configuração de ambiente - MPSC PRO
    ...  ELSE IF      '${cliente}' == 'desPMF'           Configuração de ambiente - PMF DES    
    ...  ELSE IF      '${cliente}' == 'proPMF'           Configuração de ambiente - PMF PRO
    ...  ELSE IF      '${cliente}' == 'Peru'             Configuração de ambiente - Internacionalização Peru
    ...  ELSE IF      '${cliente}' == 'hmlSemil'         Configuração de ambiente - Homologue Semil
    ...  ELSE IF      '${cliente}' == 'proSemil'         Configuração de ambiente - PRO Semil
    ...  ELSE IF      '${cliente}' == 'hmlIMA'           Configuração de ambiente - HML IMA
    ...  ELSE IF      '${cliente}' == 'hmlItapevi'       Configuração de ambiente - HML Itapevi
    ...  ELSE IF      '${cliente}' == 'hmlCopasa'        Configuração de ambiente - HML Copasa
    ...  ELSE IF      '${cliente}' == 'proCopasa'        Configuração de ambiente - PRO Copasa
    ...  ELSE IF      '${cliente}' == 'hmlRibP'          Configuração de ambiente - HML Ribeirão Preto
    ...  ELSE IF      '${cliente}' == 'proRibP'          Configuração de ambiente - PRO Ribeirão Preto
    ...  ELSE IF      '${cliente}' == 'proDiadema'       Configuração de ambiente - PRO Diadema
    ...  ELSE IF      '${cliente}' == 'hmlDiadema'       Configuração de ambiente - HML Diadema
    ...  ELSE IF      '${cliente}' == 'hmlTCE'           Configuração de ambiente - HML TCE
    ...  ELSE IF      '${cliente}' == 'proTCE'           Configuração de ambiente - PRO TCE
    ...  ELSE IF      '${cliente}' == 'proFUABC'         Configuração de ambiente - PRO FUABC
    ...  ELSE IF      '${cliente}' == 'proFUMEC'         Configuração de ambiente - PRO FUMEC
    ...  ELSE IF      '${cliente}' == 'hmlCamDiadema'    Configuração de ambiente - HML Camara de Diadema
    ...  ELSE IF      '${cliente}' == 'proCamDiadema'    Configuração de ambiente - PRO Camara de Diadema

Configuração de ambiente - Interna DES
    browser.delete all cookies
    ${link_cliente}  set variable  https://solarbpm-des.ungp.softplan.com.br/
    ${link_portal}  set variable   https://solarbpm-des.ungp.softplan.com.br/atendimento/inicio
    ${user_robot}  set variable    ROBOT
    ${senha_robot}  set variable   SolarRobot@1
    ${orgao}      Set Variable   SOLARBPM
    ${internacional}  Set Variable  nao
    ${service_discovery}   Set Variable  des
    ${user_service_discovery}  Set Variable    softplan
    ${senha_service_discovery}  Set Variable   U29mdHBsYW4yMDE3
    ${tipo_de_login}     Set Variable      padrao
    set global variable  ${link_cliente}
    set global variable  ${link_portal}
    Set Global Variable    ${service_discovery}    
    Set Global Variable    ${user_robot}     
    Set Global Variable    ${senha_robot}
    Set Global Variable    ${orgao}
    Set Global Variable    ${internacional}
    Set Global Variable    ${service_discovery}
    Set Global Variable    ${user_service_discovery}
    Set Global Variable    ${senha_service_discovery}
    Import Variables       ${CURDIR}\\variaveis\\vars_pt.py
    Set Global Variable    ${tipo_de_login}

Configuração de ambiente - Interna DES2
    browser.delete all cookies
    ${link_cliente}  set variable  https://solarbpm-des2.ungp.softplan.com.br/
    ${link_portal}  set variable   https://solarbpm-des2.ungp.softplan.com.br/atendimento/inicio
    ${user_robot}  set variable    ROBOT
    ${senha_robot}  set variable   SolarRobot@1
    ${orgao}      Set Variable   SOLARBPM
    ${internacional}  Set Variable  nao
    ${service_discovery}   Set Variable  des
    ${user_service_discovery}  Set Variable    softplan
    ${senha_service_discovery}  Set Variable   Z5jJ6uzy1NTVU7Xc
    ${tipo_de_login}     Set Variable    padrao
    set global variable  ${link_cliente}
    set global variable  ${link_portal}
    Set Global Variable    ${service_discovery}    
    Set Global Variable    ${user_robot}     
    Set Global Variable    ${senha_robot}
    Set Global Variable    ${orgao}
    Set Global Variable    ${internacional}
    Set Global Variable    ${service_discovery}
    Set Global Variable    ${user_service_discovery}
    Set Global Variable    ${senha_service_discovery}
    Import Variables       ${CURDIR}\\variaveis\\vars_pt.py
    Set Global Variable    ${tipo_de_login}

Configuração de ambiente - Interna COR
    browser.delete all cookies
    ${link_cliente}  set variable  https://solarbpm-cor.ungp.softplan.com.br/
    ${link_portal}  set variable   https://solarbpm-cor.ungp.softplan.com.br/atendimento/inicio
    set global variable  ${link_cliente}
    set global variable  ${link_portal}
    ${service_discovery}   Set Variable  cor
    ${user_service_discovery}  Set Variable    softplan
    ${senha_service_discovery}  Set Variable   U29mdHBsYW4yMDE3    
    ${user_robot}  set variable    ROBOT
    ${senha_robot}  set variable   123456
    ${orgao}      Set Variable   SOLARBPM
    ${internacional}  Set Variable  nao
    ${tipo_de_login}       Set Variable    padrao
    Set Global Variable    ${user_robot}     
    Set Global Variable    ${senha_robot}
    Set Global Variable    ${service_discovery}    
    Set Global Variable    ${user_service_discovery}
    Set Global Variable    ${senha_service_discovery}
    Set Global Variable    ${orgao}
    Import Variables       ${CURDIR}\\variaveis\\vars_pt.py
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
    ${orgao}      Set Variable   SOLARBPM
    ${internacional}  Set Variable  nao
    ${tipo_de_login}       set variable   padrao
    Set Global Variable    ${user_robot}     
    Set Global Variable    ${senha_robot}
    Set Global Variable    ${service_discovery}    
    Set Global Variable    ${user_service_discovery}
    Set Global Variable    ${senha_service_discovery}
    Set Global Variable    ${orgao}
    Import Variables       ${CURDIR}\\variaveis\\vars_pt.py
    Set Global Variable    ${internacional}    
    Set Global Variable    ${tipo_de_login}

Configuração de ambiente - Internacionalização Peru
    browser.delete all cookies
    ${link_cliente}  set variable  https://solarbpm-prdt-internacional-des.ungp.softplan.com.br/
    ${link_portal}  set variable   https://solarbpm-prdt-internacional-des.ungp.softplan.com.br/atendimento
    set global variable  ${link_cliente}
    set global variable  ${link_portal}
    ${user_robot}  set variable    SOFTPLAN
    ${senha_robot}  set variable   1
    ${orgao}      Set Variable   SOLARBPM
    ${internacional}  Set Variable  sim
    ${service_discovery}   Set Variable  solarbpm-internacional-des
    ${user_service_discovery}  Set Variable    softplan
    ${senha_service_discovery}  Set Variable   U29mdHBsYW4yMDE3 
    ${tipo_de_login}       Set Variable     padrao
    Set Global Variable    ${user_robot}     
    Set Global Variable    ${senha_robot}
    Set Global Variable    ${orgao}
    Set Global Variable    ${internacional}
    Set Global Variable    ${service_discovery}    
    Set Global Variable    ${user_service_discovery}
    Set Global Variable    ${senha_service_discovery}    
    Import Variables       ${CURDIR}\\variaveis\\vars_es-peru.py
    Set Global Variable    ${tipo_de_login}

