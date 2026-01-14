*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-checklist.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Acessar o service discovery
    go to   ${link_cliente}service-discovery/#/tenants/${service_discovery}/apis
    set log level   NONE
    Fill Text    //input[contains(@id,'inputUser')]    ${user_service_discovery}
    Fill Text    //input[contains(@id,'inputPassword')]    ${senha_service_discovery}
    Set Log Level    INFO
    click        //button[contains(@type,'submit')]
    click        //span[contains(.,'${service_discovery}')]

Conferir serviços api-docs
    Run Keyword If    '${cliente}' == 'proBarueri'           validar solarbpm-integração em proBarueri
    ...  ELSE IF      '${cliente}' == 'proMPSC'              validar endpoints em proMPSC
    ...  ELSE         validação padrão

validar solarbpm-integração em proBarueri
    Run Keyword And Continue On Failure  get text   (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}solarbpm-integracao/v2/api-docs')])[1]                 *=                        ${link_cliente}solarbpm-integracao/v2/api-docs
    Run Keyword And Continue On Failure  get text   (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}solarbpm-integracao/v2/api-docs')])[2]                 *=                        ${link_cliente}solarbpm-integracao/v2/api-docs
    run keyword and continue on failure  get text   //a[contains(.,'${link_cliente}service-discovery/v2/api-docs')]               *=                        ${link_cliente}service-discovery/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}seg-services/v2/api-docs')]                    *=                        ${link_cliente}seg-services/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}ungp-sso-oauth-server/v2/api-docs')]           *=                        ${link_cliente}ungp-sso-oauth-server/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}cdt-pessoa/v2/api-docs')]                      *=                        ${link_cliente}cdt-pessoa/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}bpm-server-editor/v2/api-docs')]               *=                        ${link_cliente}bpm-server-editor/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}bpm-server-executor/v2/api-docs')]             *=                        ${link_cliente}bpm-server-executor/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}bpm-server-adm/v2/api-docs')]                  *=                        ${link_cliente}bpm-server-adm/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}cpa-bpm-backend/v2/api-docs')]                 *=                        ${link_cliente}cpa-bpm-backend/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}cpa-core-backend/v2/api-docs')]                *=                        ${link_cliente}cpa-core-backend/v2/api-docs


validar endpoints em proMPSC
    Run Keyword And Continue On Failure  get text    (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}solarbpm-integracao/v2/api-docs')])[1]                 *=                        ${link_cliente}solarbpm-integracao/v2/api-docs  
    Run Keyword And Continue On Failure  get text    (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}service-discovery/v2/api-docs')])[1]                  *=                        ${link_cliente}service-discovery/v2/api-docs
    Run Keyword And Continue On Failure  get text    (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}service-discovery/v2/api-docs')])[2]                  *=                        ${link_cliente}service-discovery/v2/api-docs
    Run Keyword And Continue On Failure  get text    (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}service-discovery/v2/api-docs')])[1]                  *=                        ${link_cliente}service-discovery/v2/api-docs
    Run Keyword And Continue On Failure  get text    (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}service-discovery/v2/api-docs')])[2]                  *=                        ${link_cliente}service-discovery/v2/api-docs
    Run Keyword And Continue On Failure  get text    (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}cdt-pessoa/v2/api-docs')])[1]                         *=                        ${link_cliente}cdt-pessoa/v2/api-docs
    Run Keyword And Continue On Failure  get text    (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}cdt-pessoa/v2/api-docs')])[2]                         *=                        ${link_cliente}cdt-pessoa/v2/api-docs
    Run Keyword And Continue On Failure  get text    (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}bpm-server-editor/v2/api-docs')])[1]                  *=                        ${link_cliente}bpm-server-editor/v2/api-docs
    Run Keyword And Continue On Failure  get text    (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}bpm-server-editor/v2/api-docs')])[2]                  *=                        ${link_cliente}bpm-server-editor/v2/api-docs
    Run Keyword And Continue On Failure  get text    (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}bpm-server-executor/v2/api-docs')])[1]                *=                        ${link_cliente}bpm-server-executor/v2/api-docs
    Run Keyword And Continue On Failure  get text    (//a[@class='cursor-pointer ng-binding ng-scope'][contains(.,'${link_cliente}bpm-server-executor/v2/api-docs')])[2]                *=                        ${link_cliente}bpm-server-executor/v2/api-docs
    
validação padrão
    run keyword and continue on failure  get text   //a[contains(.,'${link_cliente}service-discovery/v2/api-docs')]               *=                        ${link_cliente}service-discovery/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}seg-services/v2/api-docs')]                    *=                        ${link_cliente}seg-services/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}ungp-sso-oauth-server/v2/api-docs')]           *=                        ${link_cliente}ungp-sso-oauth-server/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}cdt-pessoa/v2/api-docs')]                      *=                        ${link_cliente}cdt-pessoa/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}bpm-server-editor/v2/api-docs')]               *=                        ${link_cliente}bpm-server-editor/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}bpm-server-executor/v2/api-docs')]             *=                        ${link_cliente}bpm-server-executor/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}bpm-server-adm/v2/api-docs')]                  *=                        ${link_cliente}bpm-server-adm/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}cpa-bpm-backend/v2/api-docs')]                 *=                        ${link_cliente}cpa-bpm-backend/v2/api-docs
    Run Keyword And Continue On Failure  get text   //a[contains(.,'${link_cliente}cpa-core-backend/v2/api-docs')]                *=                        ${link_cliente}cpa-core-backend/v2/api-docs

healt check do api-docs
    ${verify_ssl}=    Set Variable    ${False}
    Run Keyword And Continue On Failure    GET  ${link_cliente}service-discovery/v2/api-docs      expected_status=200  verify=${verify_ssl}
    Run Keyword And Continue On Failure    GET  ${link_cliente}seg-services/v2/api-docs           expected_status=200  verify=${verify_ssl}
    Run Keyword And Continue On Failure    GET  ${link_cliente}ungp-sso-oauth-server/v2/api-docs  expected_status=200  verify=${verify_ssl}
    Run Keyword And Continue On Failure    GET  ${link_cliente}cdt-pessoa/v2/api-docs             expected_status=200  verify=${verify_ssl}
    Run Keyword And Continue On Failure    GET  ${link_cliente}bpm-server-editor/v2/api-docs      expected_status=200  verify=${verify_ssl}
    Run Keyword And Continue On Failure    GET  ${link_cliente}bpm-server-executor/v2/api-docs    expected_status=200  verify=${verify_ssl}
    Run Keyword And Continue On Failure    GET  ${link_cliente}bpm-server-adm/v2/api-docs         expected_status=200  verify=${verify_ssl}
    Run Keyword And Continue On Failure    GET  ${link_cliente}cpa-bpm-backend/v2/api-docs        expected_status=200  verify=${verify_ssl}
    Run Keyword And Continue On Failure    GET  ${link_cliente}cpa-core-backend/v2/api-docs       expected_status=200  verify=${verify_ssl}
    Run Keyword And Continue On Failure    GET  ${link_cliente}solarbpm-integracao/v2/api-docs    expected_status=200  verify=${verify_ssl}

    
