<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page session='true'%>
<%HttpSession sesion=request.getSession(); out.println("IdSesion: "+sesion.getId()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="NewFile.css">
</head>

<body>
<form method="post">
<div class="linea">
<label>Nom:</label>
<%
String nom=request.getParameter("name");
%>
<input type="text" name="name" <%
if(nom!=null){
%> value="<%=nom %>"
<%} %>>
<%
if(nom!=null && nom.isEmpty()) %> <span id="error">El nom no pot estar en blanc</span>
</div>
<br>
<%
String cognoms = request.getParameter("cognom");
%>
<div class="linea">
<label>Cognoms:</label>
<input type="text" name="cognom"
<%
if(cognoms!=null){
%>
value="<%=cognoms %>"
<%
}
%>
>
<%
if(cognoms!=null && cognoms.isEmpty())%><span id="error">El cognom no pot estar en
blanc</span>
</div>
<br>
<div class="linea">
<label>E-mail:</label>
<%
String mail = request.getParameter("email");
%>
<input type="text" name="email"
<%
if(mail!=null){
%> value="<%=mail %>" <%
}
%>
>
<%
if(mail!=null){
if(mail.isEmpty()){%>
<span id="error">El mail no pot estar en blanc</span>
<%
}else if(!mail.isEmpty() && !mail.contains("@")){
%>
<span id="error">El email es incorrecte perque no hi ha @</span>
<%
}
session.setAttribute("variable", new String(mail));
}
%>
</div>
<br>
<div class="linea">
<label>Data naixement:</label>
<% String data = request.getParameter("data"); %>
<input type="Date" max="2019-10-19" name="data" <% if(data!=null) %> value="<%=data %>">
<%
if(data!=null && data.isEmpty())%><span id="error">La data no pot ser en blanc</span><%
%>
</div>
<br>
<div class="linea">
<%
String sexe = request.getParameter("sexe");
%>
<label>Sexe:</label>
<select name="sexe">
<option></option>
<option value="Home" <% if("Home".equals(sexe)) { %> selected <% } %>>Home</option>
<option value="Dona" <% if("Dona".equals(sexe)) { %> selected <% } %>>Dona</option>
<option value="ND" <% if("ND".equals(sexe)) { %> selected <% } %>>No declarat</option>
</select>
<%
if(sexe!=null && sexe.isEmpty())%><span id="error">El sexe no pot estar en blanc</span><%
%>
</div>
<br>
<div class="linea">
<label>Tipus:</label>
<input type="radio" name="opcio" value="pelicules" checked>
<label for="pelicules">Pel·lícules</label>
<input type="radio" name="opcio" value="series">
<label for="series">Sèries</label>
<%
String seleccio = request.getParameter("opcio");
%>
</div>
<br>
<div class="linea">
<label>Gèneres:</label> <br>
<input type="checkbox" name="generes" value="accio">
<label for="accio">Acció</label>
<input type="checkbox" name="generes" value="ciencia ficcio">
<label for="ciencia ficcio">Ciencia Ficcio</label>
<input type="checkbox" name="generes" value="historica">
<label for="historica">Historica</label>
<input type="checkbox" name="generes" value="drama">
<label for="drama">Drama</label>
<input type="checkbox" name="generes" value="comedia">
<label for="comedia">Comedia</label>
<%
String[] generes = request.getParameterValues("generes");
if(generes==null && nom!=null) %><span id="error">Es te que marcar els generes</span><%
%>
</div>
<br>
<div class=linea>
<% String contrasenya = request.getParameter("pass"); %>
<label>Contrasenya:</label>
<input type="text" name="pass" <% if(contrasenya!=null){%> value="<%=contrasenya %>"<%} %>>
<%
if(contrasenya!=null && contrasenya.length()<8)%><span id="error">La contrasenya te que tindre
minim 8 caracters</span><%
%>
</div>
<br>
<% String contrasenya1 = request.getParameter("password"); %>
<div class="linea">
<label>Contrasenya2:</label>
<input type="text" name="password" <% if(contrasenya1!=null){%> value="<%=contrasenya1
%>"<%} %>>
<%
if(contrasenya1!=null && contrasenya1.length()<8)%><span id="error">La contrasenya te que tindre
minim 8 caracters</span><%
if(contrasenya1!=null && !contrasenya1.equals(contrasenya)) %> <span id="error">La contrasenya
te que ser la mateixa</span>
</div>
<br>
<input type="submit" value="enviar">
</form>
<%
if(nom!=null && cognoms!=null && mail!=null && data!=null && sexe!=null && generes!=null
&& contrasenya!=null && contrasenya1!=null){
if(!(nom.isEmpty()) && !(cognoms.isEmpty()) && !(mail.isEmpty()) && mail.contains("@")
&& !(data.isEmpty()) && !(sexe.isEmpty()) && contrasenya.length()>=8 &&
contrasenya1.length()>=8
&& contrasenya1.equals(contrasenya)){// Miro que els parametres no siguin buits
%>
<br><br><br><br><br>
<h1>XML</h1>
<br><br>
<pre>
&lt;Persona&gt;
&lt;Nom&gt;<%=nom %>&lt;/Nom&gt;
&lt;Cognoms&gt;<%=cognoms %>&lt;/Cognoms&gt;
&lt;E-mail&gt;<%=mail %>&lt;/E-mail&gt;
&lt;Data_Naixement&gt;<%=data %>&lt;/Data_Naixement&gt;
&lt;Sexe&gt;<%=sexe %>&lt;/Sexe&gt;
&lt;Tipus&gt;<%=seleccio %>&lt;/Tipus&gt;
&lt;Generes&gt;<% for(int i=0; i<generes.length; i++){
out.print(generes[i]);
if(i<(generes.length - 1)){
out.print(", ");
}
} %>&lt;/Generes&gt;
&lt;Contrasenya1&gt;<%=contrasenya %>&lt;/Contrasenya1&gt;
&lt;Contrasenya2&gt;<%=contrasenya1 %>&lt;/Contrasenya2&gt;
&lt;/Persona&gt;

</pre>
<%
}
}else{
%>
<span>El formulari no ha sigut enviat</span>
<%
}
%>
</body>
</html>