*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-checklist.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Validações SEG - Segurança - ${cliente}
    Login no solar BPM
    Run Keyword And Continue On Failure    Usuários - Cadastro/Consulta
    Run Keyword And Continue On Failure    Perfis - Cadastro/Consulta
    Run Keyword And Continue On Failure    Permissões específicas por usuário
    Run Keyword And Continue On Failure    Cópia de Permissões
    Run Keyword And Continue On Failure    Usuários do setor por sistema
    Run Keyword And Continue On Failure    Setores do usuário por sistema
    Run Keyword And Continue On Failure    Perfis do usuário
    Run Keyword And Continue On Failure    Sistemas - Cadastro/Consulta
    Run Keyword And Continue On Failure    Telas do sistema
    Run Keyword And Continue On Failure    Itens do menu
    Run Keyword And Continue On Failure    Relatório de auditoria
    Run Keyword And Continue On Failure    Configuração de auditoria

Validações SEG - Segurança - proPMF
    Login no solar BPM
    Run Keyword And Continue On Failure    Usuários - Cadastro/Consulta
    Run Keyword And Continue On Failure    Perfis - Cadastro/Consulta
    Run Keyword And Continue On Failure    Permissões específicas por usuário
    Run Keyword And Continue On Failure    Cópia de Permissões
    Run Keyword And Continue On Failure    Usuários do setor por sistema
    Run Keyword And Continue On Failure    Setores do usuário por sistema
    Run Keyword And Continue On Failure    Perfis do usuário
    Run Keyword And Continue On Failure    Sistemas - Cadastro/Consulta
    Run Keyword And Continue On Failure    Telas do sistema
    Run Keyword And Continue On Failure    Relatório de auditoria
    Run Keyword And Continue On Failure    Configuração de auditoria

Validações SEG - Segurança - desPMF
    Login no solar BPM
    Run Keyword And Continue On Failure    Usuários - Cadastro/Consulta
    Run Keyword And Continue On Failure    Perfis - Cadastro/Consulta
    Run Keyword And Continue On Failure    Permissões específicas por usuário
    Run Keyword And Continue On Failure    Cópia de Permissões
    Run Keyword And Continue On Failure    Usuários do setor por sistema
    Run Keyword And Continue On Failure    Setores do usuário por sistema
    Run Keyword And Continue On Failure    Perfis do usuário
    Run Keyword And Continue On Failure    Sistemas - Cadastro/Consulta
    Run Keyword And Continue On Failure    Telas do sistema
    Run Keyword And Continue On Failure    Relatório de auditoria
    Run Keyword And Continue On Failure    Configuração de auditoria

Usuários - Cadastro/Consulta
    browser.go to  ${link_cliente}siderseg/abrirConsultaUsuario.do
    get text       //td[@class='titulo'][contains(.,'${texto_consulta_usuarios}')]   *=    ${texto_consulta_usuarios}
    get text       //td[@height='21'][contains(.,'${texto_filtros_consulta}')]   *=    ${texto_filtros_consulta}
    Take Screenshot

Perfis - Cadastro/Consulta
    browser.go to  ${link_cliente}seg/gridGrupo.do
    get text       //td[@class='titulo'][contains(.,'${texto_cadastro_perfis}')]   *=    ${texto_cadastro_perfis}
    Take Screenshot

Permissões específicas por usuário
    browser.go to  ${link_cliente}siderseg/abrirPermissoesUsuario.do
    get text       //td[@class='titulo'][contains(.,'${texto_permissoes}')]   *=    ${texto_permissoes}
    get text       //td[@height='21'][contains(.,'${texto_identificacao}')]   *=    ${texto_identificacao}
    Take Screenshot

Cópia de Permissões
    browser.go to  ${link_cliente}siderseg/abrirCopiaPermissoesUsuario.do
    get text       //td[@class='titulo'][contains(.,'${texto_copia_permissoes}')]   *=    ${texto_copia_permissoes}
    get text       //td[@height='21'][contains(.,'${texto_identificacao}')]   *=    ${texto_identificacao}
    Take Screenshot

Usuários do setor por sistema
    browser.go to  ${link_cliente}siderseg/abrirCadastroUsuariosSetor.do
    get text       //td[@class='titulo'][contains(.,'${texto_usuarios_setor}')]   *=    ${texto_usuarios_setor}
    get text       //td[@height='21'][contains(.,'${texto_usuarios_setor}')]   *=    ${texto_usuarios_setor}
    Take Screenshot

Setores do usuário por sistema
    browser.go to  ${link_cliente}siderseg/abrirAssocUsuarioSetorSist.do
    get text       //td[@class='titulo'][contains(.,'${texto_associacao_setores}')]   *=    ${texto_associacao_setores}
    Take Screenshot

Perfis do usuário
    browser.go to  ${link_cliente}seg/gridUsuariosPerfis.do
    get text       //td[@class='titulo'][contains(.,'${texto_perfis}')]   *=    ${texto_perfis}
    get text       //td[@height='21'][contains(.,'${texto_filtros_consulta}')]   *=    ${texto_filtros_consulta}
    Take Screenshot

Sistemas - Cadastro/Consulta
    browser.go to  ${link_cliente}seg/gridSistema.do
    get text       //td[@class='titulo'][contains(.,'${texto_cadastro_sistemas}')]   *=    ${texto_cadastro_sistemas}
    Take Screenshot

Telas do sistema
    browser.go to  ${link_cliente}seg/preCadTela.do
    get text       //td[@class='titulo'][contains(.,'${texto_cadastro_telas}')]   *=    ${texto_cadastro_telas}
    get text       //td[@height='21'][contains(.,'${texto_filtros_consulta}')]   *=    ${texto_filtros_consulta}
    Take Screenshot

Itens do menu
    browser.go to  ${link_cliente}seg/gridItemmenu.do
    get text       //td[@class='titulo'][contains(.,'${texto_cad_menu}')]   *=    ${texto_cad_menu}
    get text       //td[@height='21'][contains(.,'${texto_filtros_consulta}')]   *=    ${texto_filtros_consulta}
    Take Screenshot

Relatório de auditoria
    browser.go to  ${link_cliente}seg/relAuditoria.do
    get text       //td[@class='titulo'][contains(.,'${texto_auditoria}')]   *=    ${texto_auditoria}
    get text       //td[@height='21'][contains(.,'${texto_relatorio_auditoria}')]   *=    ${texto_relatorio_auditoria}
    Take Screenshot

Configuração de auditoria
    browser.go to  ${link_cliente}seg/abrirConfigAuditoria.do
    get text       //td[@class='titulo'][contains(.,'${texto_conf_auditoria}')]   *=    ${texto_conf_auditoria}
    get text       //td[@height='21'][contains(.,'${texto_filtros_consulta}')]   *=    ${texto_filtros_consulta}
    Take Screenshot