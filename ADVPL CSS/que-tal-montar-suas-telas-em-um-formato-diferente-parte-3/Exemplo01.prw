/*
@author: Rodrigo Araujo
@site: http://www.blogadvpl.com/
*/
#include "TOTVS.CH"
User Function Exemplo01()
	Local oPanel1
	Local oPanel2
	Local oPanel3
	Local oPanel4
	Local oPanel5
	Local oPanel6
	Local oPanel7
	Local cPanelCSS := ""
	Local oTimer
	Local aUsuario := {}
	Local _cUsuario := ""
	Local nLinha	:= 0
	
	Private cData := ""
	Private cHora := ""
	Private oData := Nil
	Private oHora := Nil	
	Private cNome := Space(100)
	Private cEmail := Space(100)
	Private oNome 
	Private oEmail 
	
	Static oDlg

	SET CENTURY ON
	SET DATE BRITISH

	DEFINE MSDIALOG oDlg TITLE "New Dialog" FROM 000, 000  TO 577, 796 COLORS 0, 11241021 PIXEL STYLE nOR( WS_VISIBLE, WS_POPUP )

	oTimer := TTimer():New(1000, {|| Atualizar() }, oDlg )
	oTimer:Activate()
	
	//Imagem de fundo, para ficar redimensionavel, é necessário quebrar a imagem em vários pedaços
    oFundo := TBitmap():New(000,000,402,302,,"\system\imagens\exemplo01.png",.T.,oDlg,,,.F.,.F.,,,.F.,,.T.,,.F.)
    
    oTLogo := TBitmap():New(040,060,160,070,,"\system\imagens\logototvs.png",.T.,oDlg,,,.F.,.F.,,,.F.,,.T.,,.F.)
    
	oSay1:= TSay():New(06,05,{||'Nome da Rotina'},oDlg,,,,,,.T.,CLR_WHITE,CLR_WHITE,200,20)
	oSay1:lTransparent = .T.

	cData := DTOC(DATE())
	cHora := Time()

	oData:= TSay():New(06,278,{|| cData },oDlg,,,,,,.T.,CLR_WHITE,CLR_WHITE,200,20)
	oData:lTransparent = .T.
	
	oHora:= TSay():New(06,322,{|| cHora },oDlg,,,,,,.T.,CLR_WHITE,CLR_WHITE,200,20)
	oHora:lTransparent = .T.

	//Utilizando CSS para alterar os componentes

	//Estilo para botões
	cSair := "QPushButton {"  
	cSair += " background-image: url(rpo:final.png);background-repeat: none; margin: 2px;"
	cSair += " background-color: #ffffff;"
	cSair += " border-style: outset;"
	cSair += " border-width: 0px;"
	cSair += " border: 0px solid #ffffff;"
	cSair += " border-radius: 5px;"
	cSair += " border-color: #ffffff;"
	cSair += " font: bold 12px Arial;"
	cSair += " padding: 6px;"
	cSair += "}"
	cSair += "QPushButton:pressed {"
	cSair += " background-color: #ffffff;"
	cSair += " border-style: inset;"
	cSair += "}"
    
    oSair := TButton():New(03,359,"    Sair" ,oDlg,{|| oDlg:End() },39,15,,,.F.,.T.,.F.,,.F.,,,.F. )
    oSair:SetCss(cSair) 


	//Estilo para a criação das abas
	cEstiloTab := "QTabWidget { /* The tab widget frame */"
	cEstiloTab += "	     border-top: 1px solid #ffffff;"
	cEstiloTab += "	     position: absolute;"
	cEstiloTab += "	     top: 10em;"   
	cEstiloTab += "	     height: 20px;background:#ffffff;"
	cEstiloTab += "	 }"
	
	cEstiloTab += "	 QTabWidget::tab-bar {"
	cEstiloTab += "	     alignment: center;"
	cEstiloTab += "	 }"
	
	cEstiloTab += "	 QTabBar::tab {"
	cEstiloTab += "	     background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,stop: 0 #E1E1E1, stop: 0.4 #DDDDDD,stop: 0.5 #D8D8D8, stop: 1.0 #D3D3D3);"
	cEstiloTab += "	     border: 1px solid #ffffff;"
	cEstiloTab += "	     border-bottom-color: #ffffff; /* same as the pane color */"
	cEstiloTab += "	     border-top-left-radius: 3px;"
	cEstiloTab += "	     border-top-right-radius: 3px;"
	cEstiloTab += "	     min-width: 10ex;"
	cEstiloTab += "	     padding: 2px;"
	cEstiloTab += "	 }"
	
	cEstiloTab += "	 QTabBar::tab:selected, QTabBar::tab:hover {"
	cEstiloTab += "	     background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #fafafa, stop: 0.4 #f4f4f4,stop: 0.5 #e7e7e7, stop: 1.0 #fafafa);"
	cEstiloTab += "	 }"
	
	cEstiloTab += "	 QTabBar::tab:selected {"
	cEstiloTab += "	     border-color: #9B9B9B;"
	cEstiloTab += "	     border-bottom-color: #ffffff; /* same as pane color */"
	cEstiloTab += "	 }"

	aTFolder := { 'Cadastro', 'Documentos', 'Outros' }
	oTFolder := TFolder():New( 090,08,aTFolder,,oDlg,,,,.T.,,185,160 )	 
	oTFolder:SetCss(cEstiloTab)

	//Estilo para componente textbox
  	cEstiloNom := "QLineEdit{ border: 1px solid gray;border-radius: 5px;background-color: #ffffff;selection-background-color: #ffffff;selection-color: #000000;"    
  	cEstiloNom += "background-image:url(rpo:responsa.png); "
  	cEstiloNom += "background-repeat: no-repeat;"
  	cEstiloNom += "background-attachment: fixed;"
  	cEstiloNom += "padding-left:25px; "
  	cEstiloNom += "}"

  	cEstiloMai := "QLineEdit{ border: 1px solid gray;border-radius: 5px;background-color: #ffffff;selection-background-color: #ffffff;selection-color: #000000;"    
  	cEstiloMai += "background-image:url(rpo:bmppost.png); "
  	cEstiloMai += "background-repeat: no-repeat;"
  	cEstiloMai += "background-attachment: fixed;"
  	cEstiloMai += "padding-left:25px; "
  	cEstiloMai += "}"
	
	oNome := TGet():New( 01,10,{|u| if(PCount()>0,cNome:=u,cNome)},oTFolder:aDialogs[1],165,011,"",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cNome,,,,,,,"Nome: ",1 )
	oNome:SetCss(cEstiloNom)

	oEmail := TGet():New( 25,10,{|u| if(PCount()>0,cEmail:=u,cEmail)},oTFolder:aDialogs[1],165,011,"",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cEmail,,,,,,,"E-mail: ",1 )
	oEmail:SetCss(cEstiloMai)

	oCliente:= TSay():New(30,213,{|| "Cliente: Empresa ABC" },oDlg,,,,,,.T.,8404992,CLR_WHITE,200,12)
	oCliente:lTransparent = .T.

	oEndereco:= TSay():New(40,213,{|| "Endereço: Rua ABCD, 123" },oDlg,,,,,,.T.,8421504,CLR_WHITE,200,12)
	oEndereco:lTransparent = .T.

	oCNPJ:= TSay():New(50,213,{|| "CNPJ: 00.000.000/0000-00" },oDlg,,,,,,.T.,8421504,CLR_WHITE,200,12)
	oCNPJ:lTransparent = .T.


	oColuna1:= TSay():New(68,215,{|| "Coluna 1" + space(6) + "Coluna 2" + space(8) + "Coluna 3"},oDlg,,,,,,.T.,CLR_WHITE,CLR_WHITE,200,12)
	oColuna1:lTransparent = .T.

	oPanel1:= tPanel():Create(oDlg,082,213,"",,,,CLR_YELLOW,CLR_WHITE,174,154)

	cTexto1:=""
	
	DEFINE FONT oFonte NAME "Arial" BOLD
	oTMultiget1 := tMultiget():new( 0, 0, {| u | if( pCount() > 0, cTexto1 := u, cTexto1 ) }, oPanel1, 173, 140,oFonte , , , , , .F.,,,{|| .T.},,,,,,.T.,.T. )
	oTMultiget1:EnableHScroll( .F. )
	
	
	For i := 1 To 30	
		cTexto1 += "Linha " + StrZero(i,2) + space(5) + "Coluna " + StrZero(i,2) + space(5) + "Coluna " + StrZero(i,2) + CHR(10) + CHR(13)
	Next
	
	oTMultiget1:Refresh()
	
	cPagina := "QPushButton {"  
	cPagina += " background-color: #ffffff;"
	cPagina += " border-style: outset;"
	cPagina += " border-width: 2px;"
	cPagina += " border: 1px solid #C0C0C0;"
	cPagina += " border-radius: 5px;"
	cPagina += " border-color: #C0C0C0;"
	cPagina += " font: bold 12px Arial;"
	cPagina += " padding: 6px;"
	cPagina += "}"
	cPagina += "QPushButton:pressed {"
	cPagina += " background-color: #ffffff;"
	cPagina += " border-style: inset;"
	cPagina += "}"
	
	oPage1 := TButton():New(225,350," |< ",oDlg,{||  },15,12,,,.F.,.T.,.F.,,.F.,,,.F. )
	oPage2 := TButton():New(225,370," >| ",oDlg,{||  },15,12,,,.F.,.T.,.F.,,.F.,,,.F. )
	
	oPage1:SetCss(cPagina)
	oPage2:SetCss(cPagina)
	

	oConfirmar := TButton():New(260,108," Confirmar ",oDlg,{|| Janela(cNome,cEmail)  },40,12,,,.F.,.T.,.F.,,.F.,,,.F. )
	oCancelar  := TButton():New(260,152," Cancelar ",oDlg,{||  },40,12,,,.F.,.T.,.F.,,.F.,,,.F. )
	
	oConfirmar:SetCss(cPagina)
	oCancelar:SetCss(cPagina)
	
	oSay2:= TSay():New(289,328,{||'Ambiente: '+GetEnvServer()},oDlg,,,,,,.T.,CLR_WHITE,CLR_WHITE,200,20)
	oSay2:lTransparent = .T.
	
	oFundo:Align := CONTROL_ALIGN_ALLCLIENT
	
  ACTIVATE MSDIALOG oDlg CENTERED
Return

User Function TstBtnCSS()
	Local cNome := Space(100)           
	Local cEmail:= Space(100)           
  	
  	DEFINE DIALOG oDlg TITLE "Usando estilos CSS no Protheus" FROM 180,180 TO 550,700 PIXEL
  	
  	cEstiloNom := "QLineEdit{ border: 1px solid gray;border-radius: 5px;background-color: #ffffff;selection-background-color: #ffffff;selection-color: #000000;"    
  	cEstiloNom += "background-image:url(rpo:responsa.png); "
  	cEstiloNom += "background-repeat: no-repeat;"
  	cEstiloNom += "background-attachment: fixed;"
  	cEstiloNom += "padding-left:25px; "
  	cEstiloNom += "}"

  	cEstiloMai := "QLineEdit{ border: 1px solid gray;border-radius: 5px;background-color: #ffffff;selection-background-color: #ffffff;selection-color: #000000;"    
  	cEstiloMai += "background-image:url(rpo:bmppost.png); "
  	cEstiloMai += "background-repeat: no-repeat;"
  	cEstiloMai += "background-attachment: fixed;"
  	cEstiloMai += "padding-left:25px; "
  	cEstiloMai += "}"
  	
    cEstilo1 := "QPushButton {"  
    cEstilo1 += " background-image: url(rpo:totvsprinter_spool.png);background-repeat: none; margin: 2px;"
    cEstilo1 += " border-style: outset;"
    cEstilo1 += " border-width: 2px;"
    cEstilo1 += " border: 1px solid #C0C0C0;"
    cEstilo1 += " border-radius: 5px;"
    cEstilo1 += " border-color: #C0C0C0;"
    cEstilo1 += " font: bold 12px Arial;"
    cEstilo1 += " padding: 6px;"
 	cEstilo1 += "}"
 	cEstilo1 += "QPushButton:pressed {"
    cEstilo1 += " background-color: #e6e6f9;"
    cEstilo1 += " border-style: inset;"
 	cEstilo1 += "}"

	cEstilo2 := "QPushButton {background-image: url(rpo:totvsprinter_pdf.png);background-repeat: none; margin: 2px; "
    cEstilo2 += " border-style: outset;"
    cEstilo2 += " border-width: 2px;"
    cEstilo2 += " border: 1px solid #C0C0C0;"
    cEstilo2 += " border-radius: 0px;"
    cEstilo2 += " border-color: #C0C0C0;"
    cEstilo2 += " font: bold 12px Arial;"
    cEstilo2 += " padding: 6px;"
 	cEstilo2 += "}"
 	cEstilo2 += "QPushButton:pressed {"
    cEstilo2 += " background-color: #e6e6f9;"
    cEstilo2 += " border-style: inset;"
 	cEstilo2 += "}"

	cEstilo3 := "QPushButton {background-image: url(rpo:totvsprinter_email.png);background-repeat: none; margin: 2px;}"

	cEstiloTab := "QTabWidget { /* The tab widget frame */"
	cEstiloTab += "	     border-top: 2px solid #ffffff;"
	cEstiloTab += "	     position: absolute;"
	cEstiloTab += "	     top: 10em;"   
	cEstiloTab += "	     height: 20px;background:#000000;"
	cEstiloTab += "	 }"
	
	cEstiloTab += "	 QTabWidget::tab-bar {"
	cEstiloTab += "	     alignment: center;"
	cEstiloTab += "	 }"
	
	cEstiloTab += "	 QTabBar::tab {"
	cEstiloTab += "	     background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,stop: 0 #E1E1E1, stop: 0.4 #DDDDDD,stop: 0.5 #D8D8D8, stop: 1.0 #D3D3D3);"
	cEstiloTab += "	     border: 2px solid #C4C4C3;"
	cEstiloTab += "	     border-bottom-color: #C2C7CB; /* same as the pane color */"
	cEstiloTab += "	     border-top-left-radius: 4px;"
	cEstiloTab += "	     border-top-right-radius: 4px;"
	cEstiloTab += "	     min-width: 10ex;"
	cEstiloTab += "	     padding: 2px;"
	cEstiloTab += "	 }"
	
	cEstiloTab += "	 QTabBar::tab:selected, QTabBar::tab:hover {"
	cEstiloTab += "	     background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #fafafa, stop: 0.4 #f4f4f4,stop: 0.5 #e7e7e7, stop: 1.0 #fafafa);"
	cEstiloTab += "	 }"
	
	cEstiloTab += "	 QTabBar::tab:selected {"
	cEstiloTab += "	     border-color: #9B9B9B;"
	cEstiloTab += "	     border-bottom-color: #C2C7CB; /* same as pane color */"
	cEstiloTab += "	 }"

   
    aTFolder := { 'Cadastro', 'Documentos', 'Outros' }
	oTFolder := TFolder():New( 0,0,aTFolder,,oDlg,,,,.T.,,260,184 )	 
	oTFolder:SetCss(cEstiloTab)
	
	oNome := TGet():New( 01,10,{|| cNome },oTFolder:aDialogs[1],200,011,"",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,"cNome",,,,,,,"Nome: ",1 )
	oNome:SetCss(cEstiloNom)

	oEmail := TGet():New( 25,10,{|| cEmail },oTFolder:aDialogs[1],200,011,"",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,"cEmail",,,,,,,"E-mail: ",1 )
	oEmail:SetCss(cEstiloMai)

    oBtnImprimir := TButton():New(50,010,"      Imprimir"		,oTFolder:aDialogs[1],{|| Alert('Botão Imprimir com efeito') },50,20,,,.F.,.T.,.F.,,.F.,,,.F. )
    oBtnPDF   	 := TButton():New(50,070,"       Gerar PDF"	 	,oTFolder:aDialogs[1],{|| Alert('Botão Gerar PDF com efeito') },60,20,,,.F.,.T.,.F.,,.F.,,,.F. )
    oBtnEmail    := TButton():New(50,140,"     Enviar E-mail" 	,oTFolder:aDialogs[1],{|| Alert('Botão Enviar E-mail com efeito') },60,20,,,.F.,.T.,.F.,,.F.,,,.F. )

    oBtnImprimir:SetCss(cEstilo1) 
    oBtnPDF:SetCss(cEstilo2) 
    oBtnEmail:SetCss(cEstilo3) 

	cEstiloCmb := "QComboBox {"
	cEstiloCmb += "border: 1px solid gray;"
	cEstiloCmb += "border-radius: 3px;"
	cEstiloCmb += "padding: 1px 18px 1px 3px;"
	cEstiloCmb += "min-width: 6em;"
	cEstiloCmb += "}"
	cEstiloCmb += "QComboBox::drop-down {"
	cEstiloCmb += "subcontrol-origin: padding;"
	cEstiloCmb += "subcontrol-position: top right;"
	cEstiloCmb += "width: 15px;"
	cEstiloCmb += "border-left-width: 1px;"
	cEstiloCmb += "border-left-color: darkgray;"
	cEstiloCmb += "border-left-style: solid; /* just a single line */"
	cEstiloCmb += "border-top-right-radius: 3px; /* same radius as the QComboBox */"
	cEstiloCmb += "border-bottom-right-radius: 3px;"
	cEstiloCmb += "}"
	cEstiloCmb += " QComboBox:editable {"
	cEstiloCmb += "     background: white;"
	cEstiloCmb += " }"

	cEstiloCmb += " QComboBox:!editable, QComboBox::drop-down:editable {"
	cEstiloCmb += "      background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,"
	cEstiloCmb += "                                  stop: 0 #E1E1E1, stop: 0.4 #FFFFFF,"
	cEstiloCmb += "                                  stop: 0.5 #D8D8D8, stop: 1.0 #D3D3D3);"
	cEstiloCmb += " }"

	cEstiloCmb += " QComboBox:!editable:on, QComboBox::drop-down:editable:on { "
	cEstiloCmb += "     background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1, "
	cEstiloCmb += "                                 stop: 0 #D3D3D3, stop: 0.4 #D8D8D8,"
	cEstiloCmb += "                                 stop: 0.5 #FFFFFF, stop: 1.0 #E1E1E1);"
	cEstiloCmb += " }	"
	cEstiloCmb += "QComboBox:on { /* shift the text when the popup opens */"
	cEstiloCmb += "padding-top: 3px;"
	cEstiloCmb += "padding-left: 4px;"
	cEstiloCmb += "}"
	cEstiloCmb += "QComboBox::down-arrow {"
	cEstiloCmb += "image: url(rpo:vcdown.png);"
	cEstiloCmb += "}"
	cEstiloCmb += "QComboBox::down-arrow:on { /* shift the arrow when popup is open */"
	cEstiloCmb += "top: 1px;"
	cEstiloCmb += "left: 1px;"
	cEstiloCmb += "}"

	aItems:= {"AC=Acre","AL=Alagoas","AP=Amapá","AM=Amazonas","BA=Bahia","CE=Ceará","DF=Distrito Federal","ES=Espírito Santo","GO=Goiás","MA=Maranhão","MT=Mato Grosso","MS=Mato Grosso do Sul","MG=Minas Gerais","PA=Pará","PB=Paraíba","PR=Paraná","PE=Pernambuco","PI=Piauí","RJ=Rio de Janeiro","RN=Rio Grande do Norte","RS=Rio Grande do Sul","RO=Rondônia","RR=Roraima","SC=Santa Catarina","SP=São Paulo","SE=Sergipe","TO=Tocantins"}
	cCombo:= aItems[1]
	oCombo0:= TComboBox():New(80,010,{|u|if(PCount()>0,cCombo:=u,cCombo)},aItems,100,10,oTFolder:aDialogs[1],,,,,,.T.,,,,,,,,,'cCombo','Estados',1)
	oCombo1:= TComboBox():New(80,130,{|u|if(PCount()>0,cCombo:=u,cCombo)},aItems,100,10,oTFolder:aDialogs[1],,,,,,.T.,,,,,,,,,'cCombo','Estados',1)
	oCombo1:SetCss(cEstiloCmb)
	
	cEstiloGrp := "background-color: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,stop: 0 #E0E0E0, stop: 1 #FFFFFF);"
	cEstiloGrp += "border: 1px solid gray;"
	cEstiloGrp += "border-radius: 5px;"
	cEstiloGrp += "margin-top: 1ex;}"
	cEstiloGrp += "QGroupBox::title {"
	cEstiloGrp += "subcontrol-origin: margin;"
	cEstiloGrp += "subcontrol-position: top center;"
	cEstiloGrp += "padding: 0 3px;"
	cEstiloGrp += "background-color: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,stop: 0 #FFOECE, stop: 1 #FFFFFF);"
	cEstiloGrp += "QGroupBox::indicator {"
	cEstiloGrp += "width: 13px;"
	cEstiloGrp += "height: 13px;}"
	cEstiloGrp += "QGroupBox::indicator:unchecked {"
	cEstiloGrp += "image: url(rpo:unchecked_15.png);"
	cEstiloGrp += "}"
	cEstiloGrp += ""
	cEstiloGrp += ""
	cEstiloGrp += ""
	cEstiloGrp += ""
	cEstiloGrp += ""
	cEstiloGrp += ""
	oGroup:= TGroup():New(120,06,165,235,'Dados',oTFolder:aDialogs[1],,,.T.)
	oGroup:SetCss(cEstiloGrp)
	
	nMeter1 := 30
    oMeter1 := TMeter():New(130,10,{|u|if(Pcount()>0,nMeter1:=u,nMeter1)},100,oTFolder:aDialogs[1],100,10,,.T.)

	cEstiloMet := "QProgressBar {"
	cEstiloMet += "border: 1px solid grey;"
	cEstiloMet += "border-radius: 5px;"   
	cEstiloMet += "}"
	cEstiloMet += "QProgressBar::chunk {"
	cEstiloMet += "background-color: #05B8CC;"
	cEstiloMet += "width: 20px;"         
	cEstiloMet += "}"
	
	nMeter2 := 0
    oMeter2 := TMeter():New(130,130,{|u|if(Pcount()>0,nMeter2:=u,nMeter2)},100,oTFolder:aDialogs[1],100,10,,.T.)
    oMeter2:SetCss(cEstiloMet)   
    oMeter2:Set(nMeter2)

     
    cEstiloRun := "QPushButton {"  
    cEstiloRun += " background-image: url(rpo:recorrente.png);background-repeat: none; margin: 2px;"
    cEstiloRun += " border-style: outset;"
    cEstiloRun += " border-width: 2px;"
    cEstiloRun += " border: 1px solid #C0C0C0;"
    cEstiloRun += " border-radius: 5px;"
    cEstiloRun += " border-color: #C0C0C0;"
    cEstiloRun += " font: bold 12px Arial;"
    cEstiloRun += " padding: 6px;"
 	cEstiloRun += "}"
    
    oBtnExec    := TButton():New(143,009,"     Executar" 	,oTFolder:aDialogs[1],{|| Run(oMeter1,nMeter1,oMeter2) },50,16,,,.F.,.T.,.F.,,.F.,,,.F. )
    oBtnExec:SetCss(cEstiloRun)

	oTFolder:Align := CONTROL_ALIGN_ALLCLIENT
	    
   ACTIVATE DIALOG oDlg CENTERED
Return

Static Function Run(oMeter1,nCont,oMeter2)
	For j:= 1 to 100
    	oMeter1:Set(j) 
    	oMeter1:Refresh()
    	Sleep(2)   	
    Next

	For i:= 1 to 100
    	oMeter2:Set(i) 
    	oMeter2:Refresh()
    	Sleep(0)   	
    Next
Return


USER Function fTGet()

Local oSay1
Local oGet1
Local dVarDate := date()



// Habilita interface com data mostrada com 4 digitos no ano
// e Habilita data em formato britânico ( Dia/Mes/Ano )
SET CENTURY ON
SET DATE BRITISH


// Cria uma caixa de diálogo com área util de 800x600  PIXELs
DEFINE DIALOG oDlg TITLE "meu fonte" FROM 0,0 TO 600,800 PIXEL


// Monta um GET para entrada de uma data
@ 005,005 SAY oSay1 PROMPT "Get Date" SIZE 30,12 OF oDlg  PIXEL
@ 015,015 MSGET oGet1 VAR dVarDate SIZE 80,12 OF oDlg  PIXEL HASBUTTON

oGet1:SetCss( "TGet{ color: #000000; "+;
					"    background-color: #FFFFFF; "+;
					"    padding-left: 3px; "+;
					"    padding-right: 3px; "+;
					"    border-top-left-radius:3px;"+;
                	"    border-bottom-left-radius:3px;"+;
				  	"    border: 1px solid #C5C9CA;"+;
				  	"    border-right: 0px; }"+;
				    "QPushButton{ border: 1px solid #C5C9CA;"+;
				    "   background-color: #FFFFFF; "+;
				    "   border-left: 0px;"+;
				    "   border-top-right-radius:3px;"+;
				    "   border-bottom-right-radius:3px; "+;
				    "   outline: none; }"+;
				    "TGet:disabled { color: #666666; "+;
				    "    border: 1px solid #C5C9CA;"+;
				    "    border-right: 0px;"+;
				    "    border-top-right-radius: 0px;"+;
				    "    border-bottom-right-radius: 0px;"+;
				    "    background-color: #F2F2F2;}"+;
				    "QPushButton:disabled{ background-color: #F2F2F2; }"+;
   					"")
  

ACTIVATE DIALOG oDlg CENTER 


Return

Static Function Atualizar()
	cData := DTOC(DATE())
	cHora := Time()
	
	oData:Refresh()
	oHora:Refresh()
Return

Static function Janela(cNome,cEmail)
	LOCAL _cNome := cNome //Space(100)
	Local _cEmail := cEmail //Space(100)
	

	oDialog := TDialog():New(00, 00, 150, 400, "Janela sem borda",,,,nOr(WS_VISIBLE,WS_POPUP),16777215, 16777215,,,.T.,,,,,,.T.)
	oDialog:hasFocus()
	
	cSair := "QPushButton {"  
	cSair += " background-image: url(rpo:final.png);background-repeat: none; margin: 2px;"
	cSair += " background-color: #ffffff;"
	cSair += " border-style: outset;"
	cSair += " border-width: 2px;"
	cSair += " border: 1px solid #000000;"
	cSair += " border-radius: 5px;"
	cSair += " border-color: #000000;"
	cSair += " font: bold 12px Arial;"
	cSair += " padding: 6px;"
	cSair += "}"
	cSair += "QPushButton:pressed {"
	cSair += " background-color: #ffffff;"
	cSair += " border-style: inset;"
	cSair += "}"
    
	oFundo := TBitmap():New(000,000,202,302,,"\system\imagens\telamenor.png",.T.,oDialog,,,.F.,.T.,,,.F.,,.T.,,.F.)
	
  	cEstiloNom := "QLineEdit{ border: 1px solid gray;border-radius: 5px;background-color: #ffffff;selection-background-color: #ffffff;selection-color: #000000;"    
  	cEstiloNom += "background-image:url(rpo:responsa.png); "
  	cEstiloNom += "background-repeat: no-repeat;"
  	cEstiloNom += "background-attachment: fixed;"
  	cEstiloNom += "padding-left:25px; "
  	cEstiloNom += "}"

  	cEstiloMai := "QLineEdit{ border: 1px solid gray;border-radius: 5px;background-color: #ffffff;selection-background-color: #ffffff;selection-color: #000000;"    
  	cEstiloMai += "background-image:url(rpo:bmppost.png); "
  	cEstiloMai += "background-repeat: no-repeat;"
  	cEstiloMai += "background-attachment: fixed;"
  	cEstiloMai += "padding-left:25px; "
  	cEstiloMai += "}"
	
	oNome2 := TGet():New( 10,10,{|u| if(PCount()>0,_cNome:=u,_cNome)} ,oDialog,165,011,"@!",,0,,,.T.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,"_cNome",,,,,,,"Nome: ",1 )
	oNome2:SetCss(cEstiloNom)

	oEmail2 := TGet():New( 30,10,{|u| if(PCount()>0,_cEmail:=u,_cEmail)},oDialog,165,011,"",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,_cEmail,,,,,,,"E-mail: ",1 )
	oEmail2:SetCss(cEstiloMai)

    oSair := TButton():New(60,155,"   Voltar" ,oDialog,{||  oDialog:End() },40,20,,,.F.,.T.,.F.,,.F.,,,.F. )
    oSair:SetCss(cSair)
	
	oFundo:Align := CONTROL_ALIGN_ALLCLIENT
	
	oDialog:Activate(,,,.T.,{|| Nome(_cNome), Email(_cEmail) ,.T.},,{|| } )
	

Return

Static Function Nome(cTexto)
	cNome := cTexto
	oNome:Refresh()
Return

Static Function Email(cTexto)
	cEmail := cTexto
	oEmail:Refresh()
Return