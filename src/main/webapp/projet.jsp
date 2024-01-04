	      <%@page import="controleur.Controleur"%>
	      <%@page import="controleur.ProjetsCaritas"%>
	      <%@ page import="java.util.ArrayList" %>
	<h2> Gestion des Projets</h2>
	     <%!String action ="";
	      int id_projetcar = 0;%> 
	      
	      <%
	             ProjetsCaritas leProjetCarita= null;
	                       if(request.getParameter("action") != null && request.getParameter("id_projetcar") != null){
	                     	  action = request.getParameter("action");
	                     	  id_projetcar = Integer.parseInt(request.getParameter("id_projetcar"));
	                     	  
	                     	  switch (action){
	                     	  case "sup" : Controleur.deleteProjetCarita (id_projetcar); break;
	                     	  case "edit": leProjetCarita = Controleur.selectWhereProjetCarita(id_projetcar); break;
	                     	  }
	                     			  
	                       }
	             %>
	      
	      <%@ include file="vues/vue_insert_projet.jsp" %>
	      
	      <%
	            if(request.getParameter("Valider")!= null){
	                    	 String titre_p_car = request.getParameter("titre_p_car");
	                    	 String descrip_p_car = request.getParameter("descrip_p_car");
	                    	 String date_debut_p_car = request.getParameter("date_debut_p_car");
	                    	 String date_fin_p_car = request.getParameter("date_fin_p_car");
	                    	 System.out.print(request.getParameter("id_assocarita"));
	                    	 int id_assocarita = Integer.parseInt(request.getParameter("id_assocarita"));
	                    	 int id_cateproj = Integer.parseInt(request.getParameter("id_cateproj"));
	                    	 int id_imagep = Integer.parseInt(request.getParameter("id_imagep"));
	                    	 
	                    	 //instanciation de la classe Projet
	                    	 ProjetsCaritas unProjetCarita = new ProjetsCaritas(id_assocarita, id_cateproj, id_imagep, titre_p_car, descrip_p_car, date_debut_p_car, date_fin_p_car);
	                    	 // insertion dans la base de données
	                    	 Controleur.insertProjetCarita(unProjetCarita);
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
	                 	
	                 	
	                 	 //instanciation de la classe Projet
	                 	 ProjetsCaritas unProjetCarita = new ProjetsCaritas(id_projetcar, id_assocarita, id_cateproj, id_imagep, titre_p_car, descrip_p_car, date_debut_p_car, date_fin_p_car);
	                 	 // insertion dans la base de données
	                 	 Controleur.updateProjetCarita(unProjetCarita);
	                 	 out.print("<br> Mise a jour réussie dans la base");
	                 	// response.sendRedirect("index.jsp?page=1");
	                  }
	                  
	                  ArrayList <VueProjetCaritas> lesProjetsCaritaS = Controleur.selectAllVueProjetCaritas();                 
	            %>
	      <%@ include file="vues/vue_select_projet.jsp" %>
	</body>
	</html>