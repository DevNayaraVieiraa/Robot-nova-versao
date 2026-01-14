*** Settings ***
Documentation    Suite description
Library  Browser
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library  FakerLibrary    locale=pt_BR

*** Keywords ***
Login no solar BPM
    Run Keyword If    '${tipo_de_login}' == 'interno'       Login SolarBpm - Autenicar com login interno
    ...  ELSE IF      '${tipo_de_login}' == 'padrao'        Login SolarBpm - Autenticar com login padrão
    ...  ELSE IF      '${tipo_de_login}' == 'loginMPSC'     Login SolarBpm - Autenticar com login para MPSC
    ...  ELSE IF      '${tipo_de_login}' == 'loginOrgao'    Login SolarBpm - Autenticar com login vinculado a orgao
    ...  ELSE IF      '${tipo_de_login}' == 'loginTCE'      Login SolarBpm - Autenticar com login para TCE

Login SolarBpm - Autenicar com login interno
    Browser.Delete All Cookies
    browser.New Page            ${link_cliente}
    set log level       NONE
    click               //*[@id="linkUserLocal"]
    fill text           //*[@id="j_username"]    ${user_Robot}    
    fill text           //*[@id="j_password"]    ${senha_Robot}   
    set log level       INFO
    click               //*[@id="submitDefault"]
    sleep     1s
    Get Element States    (//div[@class='warningContainer warningContentLogin'])[1]   not contains    visible
      

Login SolarBpm - Autenticar com login padrão
    Browser.Delete All Cookies
    browser.New Page            ${link_cliente}
    set log level       NONE
    fill text           //*[@id="j_username"]    ${user_Robot}    
    fill text           //*[@id="j_password"]    ${senha_Robot}   
    set log level       INFO
    click               //*[@id="submitDefault"]
    sleep     1s
    Get Element States    (//div[@class='warningContainer warningContentLogin'])[1]   not contains    visible
    get text              //*[@id="portal-content"]/main/div/section/div[1]/div[1]/h2   *=        Bem-vindo(a)

Login SolarBpm - Autenticar com login para TCE
    Browser.Delete All Cookies
    browser.New Page            ${link_cliente}
    set log level       NONE
    fill text           //*[@id="j_username"]    ${user_Robot}    
    fill text           //*[@id="j_password"]    ${senha_Robot}   
    set log level       INFO
    click               //input[@id='submitLDAP']
    sleep     1s
    Get Element States    (//div[@class='warningContainer warningContentLogin'])[1]   not contains    visible
    get text              //*[@id="portal-content"]/main/div/section/div[1]/div[1]/h2   *=        Bem-vindo(a)

Login SolarBpm - Autenticar com login para MPSC
    Browser.Delete All Cookies
    browser.New Page            ${link_cliente}
    set log level       NONE
    fill text           //input[contains(@id,'Ecom_User_ID')]    ${user_Robot}    
    fill text           //input[contains(@id,'Ecom_Password')]   ${senha_Robot}   
    set log level       INFO
    click               //span[contains(@id,'loginButton2')]
    sleep   5s
    Get Element States    (//div[@class='warningContainer warningContentLogin'])[1]   not contains    visible
    get text              //*[@id="portal-content"]/main/div/section/div[1]/div[1]/h2   *=        Bem-vindo(a)

Login SolarBpm - Autenticar com login vinculado a orgao
    Browser.Delete All Cookies
    browser.New Page            ${link_cliente}
    set log level       NONE
    Select Options By    //*[@id="tipo-double"]   value   E
    click      //*[@id="orgao-double"]
    Press Keys      //*[@id="orgao-double"]    O
    Press Keys    //*[@id="orgao-double"]   Enter

    fill text           //*[@id="j_username"]    ${user_Robot}    
    fill text           //*[@id="j_password"]    ${senha_Robot}   
    set log level       INFO
    click               //*[@id="submitLDAP"]
    sleep     1s
    Get Element States    (//div[@class='warningContainer warningContentLogin'])[1]   not contains    visible
    get text              //*[@id="portal-content"]/main/div/section/div[1]/div[1]/h2   *=        Bem-vindo(a)

Acesso portal externo
    browser.New Page            ${link_portal}