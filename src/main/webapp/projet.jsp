<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
      <h2> Gestion des Projets</h2>
     <%! 
      String action ="";
      int id_projetcar = 0;
      
      %> 
      
      <%
      Projet leProjet= null;
          if(request.getParameter("action") != null && request.getParameter("id_projetcar") != null){
        	  action = request.getParameter("action");
        	  id_projetcar = Integer.parseInt(request.getParameter("id_projetcar"));
        	  
        	  switch (action){
        	  case "sup" : Controleur.deleteProjet (id_projetcar); break;
        	  case "edit": leProjet = Controleur.selectWhereProjet(id_projetcar); break;
        	  }
        			  
          }
      %>
      
      <%@ include file="vue/vue_insert_projet.jsp" %>
      
      <%
         if(request.getParameter("Valider")!= null){
        	 String titre_p_car = request.getParameter("titre_p_car");
        	 String descrip_p_car = request.getParameter("descrip_p_car");
        	 String date_debut_p_car = request.getParameter("date_debut_p_car");
        	 String date_fin_p_car = request.getParameter("date_fin_p_car");
        	 int id_assocarita = Integer.parseInt(request.getParameter("id_assocarita"));
        	 int id_cateproj = Integer.parseInt(request.getParameter("id_cateproj"));
        	 int id_imagep = Integer.parseInt(request.getParameter("id_imagep"));
        	 
        	 //instanciation de la classe Projet
        	 Projet unProjet = new Projet(titre_p_car, descrip_p_car, date_debut_p_car, date_fin_p_car, id_assocarita, id_cateproj, id_imagep);
        	 // insertion dans la base de données
        	 Controleur.insertProjet(unProjet);
        	 out.print("<br> Insertion réussie dans la base");
         }
      
      if(request.getParameter("Modifier")!= null){
    	 String titre_p_car = request.getParameter("titre_p_car");
     	 String descrip_p_car = request.getParameter("descrip_p_car");
     	 String date_debut_p_car = request.getParameter("date_debut_p_car");
     	 String date_fin_p_car = request.getParameter("date_fin_p_car");
     	 int id_assocarita = Integer.parseInt(request.getParameter("id_assocarita"));
     	 int id_cateproj = Integer.parseInt(request.getParameter("id_cateproj"));
     	 int id_imagep = Integer.parseInt(request.getParameter("id_imagep"));
     	 int id_projetcar = Integer.parseInt(request.getParameter("id_projetcar"));
     	
     	
     	 //instanciation de la classe Client
     	 Projet unProjet = new Projet(id_projetcar, titre_p_car, descrip_p_car, date_debut_p_car, date_fin_p_car, id_assocarita, id_cateproj, id_imagep);
     	 // insertion dans la base de données
     	 Controleur.updateProjet(unProjet);
     	 out.print("<br> Mise a jour réussie dans la base");
     	// response.sendRedirect("index.jsp?page=1");
      }
      
      
      ArrayList<Projet> lesProjets = Controleur.selectAllProjets ();
      
      %>
      <%@ include file="vue/vue_select_projet.jsp" %>
</body>
</html>