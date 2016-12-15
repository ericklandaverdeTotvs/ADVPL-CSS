#include "Totvs.ch"

User Function tGetCss()
 Local cNome := Space(100) //Irei declarar uma variável chamada cNome do tipo string para o meu campo nome
 Local cEstiloNom := "" //Irei declarer uma variavel chamada cEstiloNom do tipo string para inserir meu estilo
 
 //Irei criar uma janela
 DEFINE DIALOG oDlg TITLE "Usando estilos CSS no Protheus" FROM 180,180 TO 550,700 PIXEL
 
 /*Para funcionar, é preciso utilizar a classe QLineEdit ele será responsável para o correto desenvolvimento do estilo que será utilizado no meu objeto.
 Para quem já conhece CSS, verá que é exatamente o mesmo código utilizado para uma página web.
 A apresentação de imagens nos objetos criados podem ser resgatados de dentro do repositório (RPO), exemplificando ficaria assim: (rpo:imagemqueexistenorepositorio.png)
 */
 
 cEstiloNom := "QLineEdit{ border: 1px solid gray;border-radius: 5px;background-color: #ffffff;selection-background-color: #ffffff;" 
 cEstiloNom += "background-image:url(rpo:responsa.png); "
 cEstiloNom += "background-repeat: no-repeat;"
 cEstiloNom += "background-attachment: fixed;"
 cEstiloNom += "padding-left:25px; "
 cEstiloNom += "}"
 
 /*Agora criamos o nosso objeto tGet normalmente*/
 oNome := TGet():New( 01,10,{|| cNome },oDlg,200,011,"",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,"cNome",,,,,,,"Nome: ",1 )
 
 /*Neste momento, para definirmos o estilo, usaremos a propriedade SetCss, no qual informaremos a ela a variavel que contém o estilo que criamos anteriormente.*/
 oNome:SetCss(cEstiloNom)

 //Finalizamos a janela
 ACTIVATE DIALOG oDlg CENTERED

Return //Finalizamos o programa